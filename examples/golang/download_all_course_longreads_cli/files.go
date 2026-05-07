package main

import (
	"crypto/sha256"
	"encoding/hex"
	"errors"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"strconv"
	"strings"

	"github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi"
)

const tempDownloadFilePrefix = ".download-"

type pdfFile struct {
	longreadName string
	filename     lmsapi.FileNameObjectPath
	version      lmsapi.NilLongreadMaterialVersion
	outputName   string
}

func loadExistingFileHashes(dir string) (map[string]string, error) {
	hashes := make(map[string]string)
	entries, err := os.ReadDir(dir)
	if err != nil {
		if errors.Is(err, os.ErrNotExist) {
			return hashes, nil
		}
		return nil, fmt.Errorf("os.ReadDir(%q): %v", dir, err)
	}

	for _, entry := range entries {
		if entry.IsDir() || strings.HasPrefix(entry.Name(), tempDownloadFilePrefix) {
			continue
		}

		path := filepath.Join(dir, entry.Name())
		hash, err := computeFileSHA256(path)
		if err != nil {
			return nil, fmt.Errorf("computeFileSHA256: %v", err)
		}
		hashes[hash] = path
	}

	return hashes, nil
}

func computeFileSHA256(path string) (string, error) {
	file, err := os.Open(path)
	if err != nil {
		return "", fmt.Errorf("open file %q: %w", path, err)
	}
	defer func() { _ = file.Close() }()

	hash := sha256.New()
	if _, err := io.Copy(hash, file); err != nil {
		return "", fmt.Errorf("hash file %q: %w", path, err)
	}
	return hex.EncodeToString(hash.Sum(nil)), nil
}

func loadExistingFileNames(dir string) (map[string]int, error) {
	names := make(map[string]int)
	entries, err := os.ReadDir(dir)
	if err != nil {
		if errors.Is(err, os.ErrNotExist) {
			return names, nil
		}
		return nil, fmt.Errorf("os.ReadDir(%q): %v", dir, err)
	}

	for _, entry := range entries {
		if entry.IsDir() || strings.HasPrefix(entry.Name(), tempDownloadFilePrefix) {
			continue
		}
		names[entry.Name()] = 1
	}

	return names, nil
}

func isPDF(name string) bool {
	return strings.EqualFold(filepath.Ext(name), ".pdf")
}

func needsFallbackFileName(name string) (string, bool) {
	if name == "." || name == string(filepath.Separator) || name == "" {
		return "longread.pdf", true
	}
	return "", false
}

func cleanFileName(name string) string {
	name = filepath.Base(strings.TrimSpace(name))
	name = strings.ReplaceAll(name, string(filepath.Separator), "_")
	if n, ok := needsFallbackFileName(name); ok {
		return n
	}
	return name
}

func withWeekPrefix(weekNumber int, name string) string {
	return fmt.Sprintf("%02d__%s", weekNumber, name)
}

func shouldPreferDuplicatePath(candidatePath, existingPath string) bool {
	candidateWeek, candidateOK := weekPrefixNumber(filepath.Base(candidatePath))
	existingWeek, existingOK := weekPrefixNumber(filepath.Base(existingPath))
	if candidateOK && existingOK {
		return candidateWeek < existingWeek
	}
	if candidateOK != existingOK {
		return candidateOK
	}
	return filepath.Base(candidatePath) < filepath.Base(existingPath)
}

func weekPrefixNumber(name string) (int, bool) {
	prefix, _, ok := strings.Cut(name, "__")
	if !ok || len(prefix) != 2 {
		return 0, false
	}

	weekNumber, err := strconv.Atoi(prefix)
	if err != nil {
		return 0, false
	}
	return weekNumber, true
}

func uniqueName(name string, used map[string]int) string {
	ext := filepath.Ext(name)
	base := strings.TrimSuffix(name, ext)

	candidate := name
	for {
		if _, ok := used[candidate]; !ok {
			used[candidate] = 1
			return candidate
		}

		next := used[name] + 1
		used[name] = next
		candidate = fmt.Sprintf("%s (%d)%s", base, next, ext)
	}
}
