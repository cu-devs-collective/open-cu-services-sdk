package main

import (
	"errors"
	"flag"
	"fmt"
	"os"
	"path/filepath"
)

func main() {
	if err := run(os.Args[1:]); err != nil {
		fmt.Fprintf(os.Stderr, "goclientpatcher: %v\n", err)
		os.Exit(1)
	}
}

func run(args []string) error {
	var outDir string
	fs := flag.NewFlagSet("goclientpatcher", flag.ContinueOnError)
	fs.StringVar(&outDir, "dir", "", "generated Go client package directory")
	if err := fs.Parse(args); err != nil {
		return err
	}
	if outDir == "" && fs.NArg() == 1 {
		outDir = fs.Arg(0)
	}
	if outDir == "" {
		return errors.New("missing generated Go client package directory")
	}

	cfgFile := filepath.Join(outDir, "oas_cfg_gen.go")
	clientFile := filepath.Join(outDir, "oas_client_gen.go")
	responseDecodersFile := filepath.Join(outDir, "oas_response_decoders_gen.go")

	if err := patchConfig(cfgFile); err != nil {
		return fmt.Errorf("patch config: %w", err)
	}
	count, err := patchClient(clientFile)
	if err != nil {
		return fmt.Errorf("patch client: %w", err)
	}
	if count == 0 {
		return errors.New("no exported Client wrappers were patched")
	}
	if err := patchResponseDecoders(responseDecodersFile); err != nil {
		return fmt.Errorf("patch response decoders: %w", err)
	}
	return nil
}
