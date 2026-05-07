package main

import (
	"context"
	"fmt"
	"log"
	"regexp"
	"strconv"
	"sync"

	"github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi"
)

var themeWeekPrefixPattern = regexp.MustCompile(`(?i)^\s*(?:неделя|week)\s+(\d+)`)

type longreadJob struct {
	themeIndex    int
	themeCount    int
	longreadIndex int
	longreadCount int
	weekNumber    int
	longread      lmsapi.LongreadItem
}

func collectLongreadPDFs(ctx context.Context, client *lmsapi.Client, limiter *rpsLimiter,
	cfg *appConfig,
	courseOverview *lmsapi.CourseOverviewByIdResponse,
) []pdfFile {
	var files []pdfFile
	themes := courseOverview.GetThemes()
	var jobs []longreadJob
	for themeIndex, theme := range themes {
		weekNumber, hasWeekPrefix := parseThemeWeekNumber(string(theme.GetName()))
		if cfg.weeksOnly && !hasWeekPrefix {
			// Themes without "Неделя N" or "Week N" prefixes usually do not
			// contain longreads. For weeks-only mode, opening them is skipped.
			fmt.Printf("Skipping theme %d/%d: %q (no week prefix)\n",
				themeIndex+1, len(themes), theme.GetName())
			continue
		}

		longreads := theme.GetLongreads()
		fmt.Printf(
			"Scanning theme %d/%d: %q (%d longreads)\n",
			themeIndex+1,
			len(themes),
			theme.GetName(),
			len(longreads),
		)

		for longreadIndex, longread := range longreads {
			jobs = append(jobs, longreadJob{
				themeIndex:    themeIndex,
				themeCount:    len(themes),
				longreadIndex: longreadIndex,
				longreadCount: len(longreads),
				weekNumber:    weekNumber,
				longread:      longread,
			})
		}
	}
	if len(jobs) == 0 {
		return files
	}

	jobsCh := make(chan longreadJob)
	resultsCh := make(chan []pdfFile)
	var (
		wg      sync.WaitGroup
		printMu sync.Mutex
	)
	workerCount := min(cfg.workerPoolSize, len(jobs))

	for range workerCount {
		wg.Go(func() {
			for job := range jobsCh {
				printMu.Lock()
				fmt.Printf(
					"  Scanning theme %d/%d longread %d/%d: %q...\n",
					job.themeIndex+1,
					job.themeCount,
					job.longreadIndex+1,
					job.longreadCount,
					job.longread.GetName(),
				)
				printMu.Unlock()

				// Exercises are intentionally ignored. The course overview exposes
				// homework-like exercises separately from longreads, so iterating only
				// over theme.Longreads keeps this example focused on longread content.
				longreadFiles := collectLongreadPDFsByID(ctx, client, limiter, cfg.pageLimit, job.longread)
				if cfg.weeksOnly {
					for i := range longreadFiles {
						longreadFiles[i].outputName = withWeekPrefix(job.weekNumber, longreadFiles[i].outputName)
					}
				}

				printMu.Lock()
				fmt.Printf("  Found %d PDF files in longread %q\n",
					len(longreadFiles),
					job.longread.GetName(),
				)
				printMu.Unlock()
				resultsCh <- longreadFiles
			}
		})
	}

	go func() {
		for _, job := range jobs {
			jobsCh <- job
		}
		close(jobsCh)
		wg.Wait()
		close(resultsCh)
	}()

	for longreadFiles := range resultsCh {
		files = append(files, longreadFiles...)
	}

	return files
}

func parseThemeWeekNumber(themeName string) (int, bool) {
	match := themeWeekPrefixPattern.FindStringSubmatch(themeName)
	if match == nil {
		return 0, false
	}

	weekNumber, err := strconv.Atoi(match[1])
	if err != nil {
		return 0, false
	}
	return weekNumber, true
}

func collectLongreadPDFsByID(ctx context.Context, client *lmsapi.Client, limiter *rpsLimiter,
	pageLimit int32,
	longread lmsapi.LongreadItem,
) []pdfFile {
	const operation = "client.LongreadMaterialsById"

	var files []pdfFile
	seenFiles := make(map[string]struct{})

	for offset := int32(0); ; offset += pageLimit {
		if !limiter.wait() {
			handleRequestLimiterClosed(operation)
		}
		res, err := client.LongreadMaterialsById(ctx, lmsapi.LongreadMaterialsByIdParams{
			LongreadId: longread.GetID(),
			Limit:      lmsapi.NewOptInt32(pageLimit),
			Offset:     lmsapi.NewOptInt32(offset),
		})
		if err != nil {
			handleAPIError(operation, err)
		}

		switch r := res.(type) {
		case *lmsapi.LongreadMaterialsByIdResponse:
			for _, material := range r.GetItems() {
				fileMaterial, ok := material.GetLongreadFileMaterialItem()
				if !ok {
					continue
				}

				files = appendPDFFileCandidate(
					files,
					seenFiles,
					longread,
					fileMaterial.GetFilename(),
					fileMaterial.GetVersion(),
					string(fileMaterial.GetFilename()),
				)

				content := fileMaterial.GetContent()
				files = appendPDFFileCandidate(
					files,
					seenFiles,
					longread,
					content.GetFilename(),
					content.GetVersion(),
					string(content.GetName()),
				)
			}
			if len(r.GetItems()) < int(pageLimit) {
				return files
			}
		case *lmsapi.BaseUnauthorizedError:
			handleStudentUnauthorized()
		case *lmsapi.BaseNotFoundError:
			log.Fatalf("SDK call %q: longread ID=%d not found", operation, longread.GetID())
		default:
			handleDefaultRes(operation, r)
		}
	}
}

func appendPDFFileCandidate(
	files []pdfFile,
	seenFiles map[string]struct{},
	longread lmsapi.LongreadItem,
	filename lmsapi.FileNameObjectPath,
	version lmsapi.NilLongreadMaterialVersion,
	outputName string,
) []pdfFile {
	if filename == "" {
		return files
	}
	if !isPDF(outputName) && !isPDF(string(filename)) {
		return files
	}

	key := fmt.Sprintf("%s\x00%s", filename, materialVersionKey(version))
	if _, ok := seenFiles[key]; ok {
		return files
	}
	seenFiles[key] = struct{}{}

	return append(files, pdfFile{
		longreadName: string(longread.GetName()),
		filename:     filename,
		version:      version,
		outputName:   cleanFileName(outputName),
	})
}

func materialVersionKey(version lmsapi.NilLongreadMaterialVersion) string {
	if v, ok := version.Get(); ok {
		return string(v)
	}
	return ""
}
