package main

import (
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strings"
)

func run(args []string) error {
	if len(args) != 3 || args[0] != "export" {
		return fmt.Errorf(
			"usage: %s export <golang|typescript|python|dart> <manifest_path>",
			filepath.Base(os.Args[0]))
	}

	values, err := loadValues(args[1], args[2])
	if err != nil {
		return err
	}

	fmt.Print(renderExports(values))
	return nil
}

func loadValues(language, manifestPath string) (map[string]string, error) {
	switch language {
	case "golang":
		return loadGoValues(manifestPath)
	case "typescript":
		return loadTypeScriptValues(manifestPath)
	case "python":
		return loadPythonValues(manifestPath)
	case "dart":
		return loadDartValues(manifestPath)
	default:
		return nil, fmt.Errorf("unsupported language %q", language)
	}
}

func renderExports(values map[string]string) string {
	keys := make([]string, 0, len(values))
	for key := range values {
		keys = append(keys, key)
	}
	sort.Strings(keys)

	var builder strings.Builder
	for _, key := range keys {
		builder.WriteString(key)
		builder.WriteString("=")
		builder.WriteString(shellQuote(values[key]))
		builder.WriteString("\n")
	}

	return builder.String()
}
