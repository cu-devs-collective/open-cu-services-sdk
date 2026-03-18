package main

import (
	"encoding/json"
	"fmt"
	"os"
	"strings"
)

type typeScriptManifest struct {
	Dependencies    map[string]string `json:"dependencies"`
	DevDependencies map[string]string `json:"devDependencies"`
	PackageManager  string            `json:"packageManager"`
}

func loadTypeScriptValues(manifestPath string) (map[string]string, error) {
	raw, err := os.ReadFile(manifestPath)
	if err != nil {
		return nil, fmt.Errorf("read %s: %w", manifestPath, err)
	}

	var doc typeScriptManifest
	if err := json.Unmarshal(raw, &doc); err != nil {
		return nil, fmt.Errorf("parse %s: %w", manifestPath, err)
	}

	values := map[string]string{
		"ZOD_VERSION": doc.Dependencies["zod"],

		"OPENAPI_TS_VERSION": doc.DevDependencies["@hey-api/openapi-ts"],
		"TYPESCRIPT_VERSION": doc.DevDependencies["typescript"],

		"PNPM_VERSION": strings.TrimPrefix(doc.PackageManager, "pnpm@"),
	}

	return values, requireKeys(manifestPath, values)
}
