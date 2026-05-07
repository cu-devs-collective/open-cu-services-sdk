package main

import (
	"context"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"sync"
	"sync/atomic"

	"github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi"
)

type downloadJob struct {
	index      int
	total      int
	file       pdfFile
	outputName string
	outputPath string
}

type downloadStats struct {
	downloaded atomic.Int64
	skipped    atomic.Int64
}

type downloadSaveResultKind int

const (
	downloadSaveResultDownloaded downloadSaveResultKind = iota
	downloadSaveResultSkipped
	downloadSaveResultRenamed
)

type downloadSaveResult struct {
	kind         downloadSaveResultKind
	existingPath string
}

func downloadPDFs(ctx context.Context, client *lmsapi.Client, httpClient *http.Client,
	limiter *rpsLimiter, cfg *appConfig,
	files []pdfFile,
	usedFileNames map[string]int,
	knownHashesToFileName map[string]string,
) (downloaded int, skipped int) {
	jobs := make(chan downloadJob)
	var (
		wg       sync.WaitGroup
		printMu  sync.Mutex
		hashesMu sync.Mutex
		stats    downloadStats
	)

	for range min(cfg.workerPoolSize, len(files)) {
		wg.Go(func() {
			for job := range jobs {
				processDownloadJob(ctx, client, httpClient, limiter, cfg,
					job, knownHashesToFileName, &hashesMu, &printMu, &stats)
			}
		})
	}

	for i, file := range files {
		outputName := uniqueName(cleanFileName(file.outputName), usedFileNames)
		jobs <- downloadJob{
			index:      i,
			total:      len(files),
			file:       file,
			outputName: outputName,
			outputPath: filepath.Join(cfg.outDir, outputName),
		}
	}
	close(jobs)
	wg.Wait()

	return stats.values()
}

func processDownloadJob(ctx context.Context, client *lmsapi.Client, httpClient *http.Client,
	limiter *rpsLimiter, cfg *appConfig,
	job downloadJob,
	knownHashesToFileName map[string]string,
	hashesMu *sync.Mutex,
	printMu *sync.Mutex,
	stats *downloadStats,
) {
	printDownloadProgress(printMu, job, "Generating download link for %q...\n", job.outputName)
	url := generateDownloadURL(ctx, client, limiter, job.file)

	printDownloadProgress(printMu, job, "Downloading %q...\n", job.outputName)
	if cfg.allowDuplicates {
		tempPath := downloadFileToTemp(ctx, httpClient, limiter, url, cfg.outDir)
		renameDownloadedFile(tempPath, job.outputPath)
		stats.downloaded.Add(1)
		printDownloadProgress(printMu, job,
			"Downloaded %q from longread %q\n",
			job.outputName, job.file.longreadName)
		return
	}

	tempPath, hash := downloadFileToTempWithHash(ctx, httpClient, limiter, url, cfg.outDir)
	result := saveDownloadedFile(tempPath, hash, job, knownHashesToFileName, hashesMu)
	switch result.kind {
	case downloadSaveResultDownloaded:
		stats.downloaded.Add(1)
		printDownloadProgress(printMu, job,
			"Downloaded %q from longread %q\n",
			job.outputName, job.file.longreadName)
	case downloadSaveResultSkipped:
		stats.skipped.Add(1)
		printDownloadProgress(printMu, job,
			"Skipped duplicate %q; same content already saved as %q\n",
			job.outputName, result.existingPath)
	case downloadSaveResultRenamed:
		printDownloadProgress(printMu, job,
			"Renamed duplicate %q to preferred earlier-week name %q\n",
			result.existingPath, job.outputName)
	default:
		log.Fatalf("processDownloadJob: unexpected download save result: %d", result.kind)
	}
}

func saveDownloadedFile(tempPath, hash string,
	job downloadJob,
	knownHashesToFileName map[string]string,
	hashesMu *sync.Mutex,
) downloadSaveResult {
	hashesMu.Lock()
	if existingPath, ok := knownHashesToFileName[hash]; ok {
		if shouldPreferDuplicatePath(job.outputPath, existingPath) {
			removeTempFile(tempPath)
			renameDownloadedFile(existingPath, job.outputPath)
			knownHashesToFileName[hash] = job.outputPath
			hashesMu.Unlock()
			return downloadSaveResult{
				kind:         downloadSaveResultRenamed,
				existingPath: existingPath,
			}
		}
		hashesMu.Unlock()

		removeTempFile(tempPath)
		return downloadSaveResult{
			kind:         downloadSaveResultSkipped,
			existingPath: existingPath,
		}
	}

	renameDownloadedFile(tempPath, job.outputPath)
	knownHashesToFileName[hash] = job.outputPath
	hashesMu.Unlock()
	return downloadSaveResult{kind: downloadSaveResultDownloaded}
}

func generateDownloadURL(ctx context.Context, client *lmsapi.Client, limiter *rpsLimiter,
	file pdfFile,
) string {
	const operation = "client.GenerateContentDownloadLink"

	params := lmsapi.GenerateContentDownloadLinkParams{
		Filename: file.filename,
	}
	if version, ok := file.version.Get(); ok {
		params.Version = lmsapi.NewOptNilLongreadMaterialVersion(version)
	}

	if !limiter.wait() {
		handleRequestLimiterClosed(operation)
	}
	res, err := client.GenerateContentDownloadLink(ctx, params)
	if err != nil {
		handleAPIError(operation, err)
	}

	switch r := res.(type) {
	case *lmsapi.GenerateContentDownloadLinkResponse:
		return string(r.GetURL())
	case *lmsapi.BaseUnauthorizedError:
		handleStudentUnauthorized()
	case *lmsapi.BaseForbiddenError:
		log.Fatalf("SDK call %q: student has no access to file %q", operation, file.filename)
	default:
		handleDefaultRes(operation, r)
	}
	return ""
}

func downloadFileToTemp(ctx context.Context, client *http.Client, limiter *rpsLimiter,
	url, dir string,
) string {
	out, resp := createTempFileForDownload(ctx, client, limiter, url, dir)
	defer func() { _ = out.Close() }()
	defer func() { _ = resp.Body.Close() }()

	if _, err := io.Copy(out, resp.Body); err != nil {
		log.Fatalf("io.Copy(%q) error: %v", out.Name(), err)
	}

	return out.Name()
}

func downloadFileToTempWithHash(ctx context.Context, client *http.Client, limiter *rpsLimiter,
	url, dir string,
) (string, string) {
	out, resp := createTempFileForDownload(ctx, client, limiter, url, dir)
	defer func() { _ = out.Close() }()
	defer func() { _ = resp.Body.Close() }()

	hash := sha256.New()
	if _, err := io.Copy(io.MultiWriter(out, hash), resp.Body); err != nil {
		log.Fatalf("io.Copy(%q) error: %v", out.Name(), err)
	}

	return out.Name(), hex.EncodeToString(hash.Sum(nil))
}

func createTempFileForDownload(ctx context.Context, client *http.Client, limiter *rpsLimiter,
	url, dir string,
) (*os.File, *http.Response) {
	const operation = "download file"

	req, err := http.NewRequestWithContext(ctx, http.MethodGet, url, nil)
	if err != nil {
		log.Fatalf("createTempFileForDownload: http.NewRequestWithContext: %v", err)
	}

	if !limiter.wait() {
		handleRequestLimiterClosed(operation)
	}
	resp, err := client.Do(req)
	if err != nil {
		handleNetworkError(operation, err)
	}

	if resp.StatusCode < 200 || resp.StatusCode > 299 {
		_ = resp.Body.Close()
		log.Fatalf("%s unexpected statusCode=%d", operation, resp.StatusCode)
	}

	out, err := os.CreateTemp(dir, tempDownloadFilePrefix+"*.pdf")
	if err != nil {
		log.Fatalf("os.CreateTemp(%q) error: %v", dir, err)
	}

	return out, resp
}

func renameDownloadedFile(oldPath, newPath string) {
	if err := os.Rename(oldPath, newPath); err != nil {
		log.Fatalf("os.Rename(%q, %q) error: %v", oldPath, newPath, err)
	}
}

func removeTempFile(path string) {
	if err := os.Remove(path); err != nil {
		log.Fatalf("os.Remove(%q) error: %v", path, err)
	}
}

func (s *downloadStats) values() (downloaded int, skipped int) {
	return int(s.downloaded.Load()), int(s.skipped.Load())
}

func printDownloadProgress(mu *sync.Mutex, job downloadJob, format string, args ...any) {
	mu.Lock()
	defer mu.Unlock()

	fmt.Printf("[%d/%d] ", job.index+1, job.total)
	fmt.Printf(format, args...)
}
