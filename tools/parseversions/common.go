package main

import (
	"fmt"
	"os"
	"sort"
	"strings"

	"go.yaml.in/yaml/v3"
)

func decodeYAMLFile(manifestPath string, out any) error {
	raw, err := os.ReadFile(manifestPath)
	if err != nil {
		return fmt.Errorf("os.ReadFile: %w", err)
	}
	if err := yaml.Unmarshal(raw, out); err != nil {
		return fmt.Errorf("yaml.Unmarshal: %w", err)
	}
	return nil
}

func requireKeys(manifestPath string, reqs map[string]string) error {
	var missing []string
	for key, value := range reqs {
		if value == "" {
			missing = append(missing, key)
		}
	}

	if len(missing) == 0 {
		return nil
	}

	sort.Strings(missing)
	return fmt.Errorf("missing required values in %s: %s",
		manifestPath, strings.Join(missing, ", "))
}

func valuesToReqs(values []string) map[string]string {
	reqs := map[string]string{}
	for _, value := range values {
		name, version, ok := splitReq(value)
		if ok {
			reqs[name] = version
		}
	}
	return reqs
}

func splitReq(value string) (string, string, bool) {
	operators := []string{"==", ">=", "<=", "~=", "!=", ">", "<"}
	for _, operator := range operators {
		if index := strings.Index(value, operator); index >= 0 {
			return strings.TrimSpace(value[:index]),
				strings.TrimSpace(value[index:]),
				true
		}
	}
	return "", "", false
}

func shellQuote(value string) string {
	if value == "" {
		return "''"
	}
	return "'" + strings.ReplaceAll(value, "'", `'"'"'`) + "'"
}
