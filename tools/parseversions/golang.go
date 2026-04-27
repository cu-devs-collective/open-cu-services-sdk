package main

import (
	"fmt"
	"os"

	"golang.org/x/mod/modfile"
)

func loadGoValues(manifestPath string) (map[string]string, error) {
	raw, err := os.ReadFile(manifestPath)
	if err != nil {
		return nil, fmt.Errorf("read %s: %w", manifestPath, err)
	}

	doc, err := modfile.Parse(manifestPath, raw, nil)
	if err != nil {
		return nil, fmt.Errorf("parse %s: %w", manifestPath, err)
	}

	requirements := map[string]string{}
	for _, req := range doc.Require {
		requirements[req.Mod.Path] = req.Mod.Version
	}

	values := map[string]string{
		"GO_MOD_VERSION": doc.Go.Version,

		"KLAUSPOST_COMPRESS_VERSION": requirements["github.com/klauspost/compress"],
		"OGEN_VERSION":               requirements["github.com/ogen-go/ogen"],
		"X_CRYPTO_VERSION":           requirements["golang.org/x/crypto"],
	}

	return values, requireKeys(manifestPath, values)
}
