package main

import (
	"fmt"

	"github.com/BurntSushi/toml"
)

type pythonManifest struct {
	Project struct {
		RequiresPython string   `toml:"requires-python"`
		Dependencies   []string `toml:"dependencies"`
	} `toml:"project"`
	BuildSystem struct {
		Requires []string `toml:"requires"`
	} `toml:"build-system"`
}

func loadPythonValues(manifestPath string) (map[string]string, error) {
	var doc pythonManifest
	if _, err := toml.DecodeFile(manifestPath, &doc); err != nil {
		return nil, fmt.Errorf("parse %s: %w", manifestPath, err)
	}

	projectDeps := valuesToReqs(doc.Project.Dependencies)
	buildDeps := valuesToReqs(doc.BuildSystem.Requires)

	values := map[string]string{
		"PYTHON_VERSION": doc.Project.RequiresPython,

		"HTTPX_VERSION":                 projectDeps["httpx"],
		"ATTRS_VERSION":                 projectDeps["attrs"],
		"PYTHON_DATEUTIL_VERSION":       projectDeps["python-dateutil"],
		"OPENAPI_PYTHON_CLIENT_VERSION": projectDeps["openapi-python-client"],

		"UV_VERSION": buildDeps["uv_build"],
	}

	return values, requireKeys(manifestPath, values)
}
