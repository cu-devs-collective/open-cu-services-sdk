// This example is a CLI utility that downloads all PDF longread materials
// for a CU LMS course selected by name.
//
// It searches the authenticated student's courses, asks the user to confirm
// the matched course, scans that course's themes and longreads, downloads only
// PDF file materials into the configured output directory and automatically
// skips duplicate files by their SHA-256 hash unless duplicate skipping is
// disabled by flag.
//
// If weeks-only is enabled, the example scans only themes whose names start
// with "Неделя N" or "Week N" and prefixes downloaded filenames with "NN__",
// where NN is the zero-padded week number.
//
// Run with --help to see all configurable options.
package main

import (
	"bufio"
	"context"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"

	"github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi"
)

func main() {
	cfg, err := parseConfig()
	if err != nil {
		log.Fatalf("parseConfig: %v", err)
	}
	ctx := context.Background()
	limiter := newRPSLimiter(cfg.requestsPerSec)
	defer limiter.close()

	// Loads bffCookie from env variable CU_LMS_BFF_COOKIE.
	client, err := lmsapi.NewDefaultClientFromEnv()
	if err != nil {
		log.Fatalf("lmsapi.NewDefaultClientFromEnv error: %v", err)
	}

	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Enter course name to search: ")
	courseQuery, err := reader.ReadString('\n')
	if err != nil {
		log.Fatalf("read course name error: %v", err)
	}
	courseQuery = strings.TrimSpace(courseQuery)
	if msg := validateCourseQuery(courseQuery, int(cfg.minCourseQueryLength)); msg != "" {
		log.Fatalln(msg)
	}

	courses := listStudentCourses(ctx, client, limiter, cfg.pageLimit)
	course, ok := matchCourse(courses, courseQuery)
	if !ok {
		log.Fatalf("No course could be matched for query %q (special characters removed)\n",
			courseQuery)
	}

	fmt.Printf("Matched course with name %q (ID: %d)\n", course.GetName(), course.GetID())
	fmt.Print("Is this correct? Type yes/y to continue: ")
	answer, err := reader.ReadString('\n')
	if err != nil {
		log.Fatalf("read confirmation error: %v", err)
	}
	if !isYes(answer) {
		log.Fatalln("Cancelled by user")
	}

	fmt.Println("Loading course overview...")
	courseOverview := getCourseOverview(ctx, client, limiter, course.GetID())

	fmt.Printf("Scanning %d course themes for longread PDF files...\n", len(courseOverview.GetThemes()))
	files := collectLongreadPDFs(ctx, client, limiter, cfg, courseOverview)
	if len(files) == 0 {
		log.Fatalln("No PDF longread files found")
	}
	fmt.Printf("Found %d PDF files. Starting download...\n", len(files))

	if err := os.MkdirAll(cfg.outDir, 0o755); err != nil {
		log.Fatalf("os.MkdirAll(%q) error: %v", cfg.outDir, err)
	}

	var knownHashesToFileName map[string]string
	if !cfg.allowDuplicates {
		knownHashesToFileName, err = loadExistingFileHashes(cfg.outDir)
		if err != nil {
			log.Fatalf("loadExistingFileHashes: %v", err)
		}
	}
	httpClient := &http.Client{Timeout: cfg.downloadTimeout}
	usedFileNames, err := loadExistingFileNames(cfg.outDir)
	if err != nil {
		log.Fatalf("loadExistingFileNames: %v", err)
	}
	downloaded, skipped := downloadPDFs(ctx, client, httpClient, limiter, cfg,
		files, usedFileNames, knownHashesToFileName)

	fmt.Printf("Downloaded %d longread PDF files into %q, skipped %d duplicates\n", downloaded, cfg.outDir, skipped)
}

func validateCourseQuery(courseQuery string, minCourseQuery int) string {
	if courseQuery == "" {
		return "Course name must not be empty"
	}
	normalizedCourseQuery := normalizeCourseName(courseQuery)
	if len([]rune(normalizedCourseQuery)) < minCourseQuery {
		return fmt.Sprintf("Course name must contain at least %d non-special characters", minCourseQuery)
	}
	return ""
}

func isYes(value string) bool {
	switch strings.ToLower(strings.TrimSpace(value)) {
	case "y", "yes", "д", "да":
		return true
	default:
		return false
	}
}
