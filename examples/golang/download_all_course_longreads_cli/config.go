package main

import (
	"flag"
	"fmt"
	"time"
)

type appConfig struct {
	// minCourseQueryLength is the minimum course query length after normalization.
	minCourseQueryLength int
	// pageLimit is the page limit for list requests.
	pageLimit int32

	// outDir is the directory for downloaded PDF files.
	outDir string
	// requestsPerSec is the maximum number of network requests started per second.
	requestsPerSec int
	// workerPoolSize is the number of parallel workers for longread scanning and PDF downloading.
	workerPoolSize int
	// downloadTimeout is the timeout for each PDF download request.
	downloadTimeout time.Duration
	// allowDuplicates downloads duplicate files instead of skipping them by SHA-256 hash.
	allowDuplicates bool
	// weeksOnly skips themes whose names do not start with "Неделя N" or "Week N"
	// and prefixes downloaded filenames with "NN__".
	weeksOnly bool
}

func parseConfig() (*appConfig, error) {
	var cfg = new(appConfig)

	const (
		defaultMinCourseQueryLength = 4
		defaultPageLimit            = 100
	)
	cfg.minCourseQueryLength = defaultMinCourseQueryLength
	cfg.pageLimit = defaultPageLimit

	flag.StringVar(&cfg.outDir, "out", "out", "directory for downloaded PDF files")
	flag.IntVar(&cfg.requestsPerSec, "max-rps", 20, "maximum number of started network requests per second")
	flag.IntVar(&cfg.workerPoolSize, "workers", 20, "number of parallel workers for longread scanning and PDF downloading")
	flag.DurationVar(&cfg.downloadTimeout, "download-timeout", 30*time.Second, "timeout for each PDF download request")
	flag.BoolVar(&cfg.allowDuplicates, "allow-duplicates", false, "download duplicate files instead of skipping them by SHA-256 hash")
	flag.BoolVar(&cfg.weeksOnly, "weeks-only", false, "skip non-week themes and prefix downloaded filenames with NN__")
	flag.Parse()

	if cfg.requestsPerSec < 1 {
		return nil, fmt.Errorf("-max-rps must be positive")
	}
	if cfg.workerPoolSize < 1 {
		return nil, fmt.Errorf("-workers must be positive")
	}
	if cfg.downloadTimeout <= 0 {
		return nil, fmt.Errorf("-download-timeout must be positive")
	}

	return cfg, nil
}
