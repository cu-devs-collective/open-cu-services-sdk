package main

type dartManifest struct {
	Environment struct {
		SDK string `yaml:"sdk"`
	} `yaml:"environment"`
	Dependencies    map[string]string `yaml:"dependencies"`
	DevDependencies map[string]string `yaml:"dev_dependencies"`
}

func loadDartValues(manifestPath string) (map[string]string, error) {
	var doc dartManifest
	if err := decodeYAMLFile(manifestPath, &doc); err != nil {
		return nil, err
	}

	values := map[string]string{
		"DART_SDK_VERSION": doc.Environment.SDK,

		"CHOPPER_VERSION":         doc.Dependencies["chopper"],
		"COLLECTION_VERSION":      doc.Dependencies["collection"],
		"HTTP_VERSION":            doc.Dependencies["http"],
		"JSON_ANNOTATION_VERSION": doc.Dependencies["json_annotation"],

		"SWAGGER_DART_CODE_GENERATOR_VERSION": doc.DevDependencies["swagger_dart_code_generator"],
		"BUILD_RUNNER_VERSION":                doc.DevDependencies["build_runner"],
		"CHOPPER_GENERATOR_VERSION":           doc.DevDependencies["chopper_generator"],
		"JSON_SERIALIZABLE_VERSION":           doc.DevDependencies["json_serializable"],
	}

	return values, requireKeys(manifestPath, values)
}
