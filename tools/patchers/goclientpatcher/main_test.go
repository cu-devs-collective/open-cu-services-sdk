package main

import (
	"os"
	"path/filepath"
	"strings"
	"testing"
)

func TestPatchGeneratedClient(t *testing.T) {
	dir := t.TempDir()

	cfg := `package lmsapi

import ht "github.com/ogen-go/ogen/http"

type clientConfig struct {
	Client ht.Client
}
`
	client := `package lmsapi

import "context"

type Client struct{}
type RequestOption func()
type requestConfig struct {
	Client any
}
type WidgetRes struct{}
type WidgetParams struct{}
var resp any

// Widget fetches a widget.
func (c *Client) Widget(ctx context.Context, params WidgetParams, options ...RequestOption) (WidgetRes, error) {
	res, err := c.sendWidget(ctx, params, options...)
	return res, err
}

func (c *Client) sendWidget(ctx context.Context, params WidgetParams, requestOptions ...RequestOption) (WidgetRes, error) {
	var reqCfg requestConfig
	return decodeWidgetResponse(resp, reqCfg.DebugResponse)
}
`
	decoders := `package lmsapi

import (
	"io"
	"net/http"
)

// decodeWidgetResponse decodes widget responses.
func decodeWidgetResponse(resp *http.Response) (res WidgetRes, _ error) {
	buf, err := io.ReadAll(resp.Body)
	if err != nil {
		return res, err
	}
	_ = buf
	return WidgetRes{}, nil
}
`

	mustWrite(t, filepath.Join(dir, "oas_cfg_gen.go"), cfg)
	mustWrite(t, filepath.Join(dir, "oas_client_gen.go"), client)
	mustWrite(t, filepath.Join(dir, "oas_response_decoders_gen.go"), decoders)

	if err := run([]string{"--dir", dir}); err != nil {
		t.Fatal(err)
	}

	gotCfg := mustRead(t, filepath.Join(dir, "oas_cfg_gen.go"))
	for _, want := range []string{
		"DebugResponseOptions  []DebugResponseOption",
		"DisableDebugResponses bool",
	} {
		if !strings.Contains(gotCfg, want) {
			t.Fatalf("patched config does not contain %q:\n%s", want, gotCfg)
		}
	}

	gotClient := mustRead(t, filepath.Join(dir, "oas_client_gen.go"))
	for _, want := range []string{
		"return callClientDebugResponse(c, func(debugResponse *DebugResponse) (WidgetRes, error)",
		"appendDebugResponseRequestOption(options, debugResponse)...",
		"DebugResponse *DebugResponse",
		"decodeWidgetResponse(resp, reqCfg.DebugResponse)",
		"// Widget fetches a widget.",
	} {
		if !strings.Contains(gotClient, want) {
			t.Fatalf("patched client does not contain %q:\n%s", want, gotClient)
		}
	}

	gotDecoders := mustRead(t, filepath.Join(dir, "oas_response_decoders_gen.go"))
	for _, want := range []string{
		"func decodeWidgetResponse(resp *http.Response, debugResponse *DebugResponse)",
		"debugResponseBody, err := readDebugResponseBody(resp, debugResponse)",
		"buf := debugResponseBody",
		"// decodeWidgetResponse decodes widget responses.",
	} {
		if !strings.Contains(gotDecoders, want) {
			t.Fatalf("patched decoders do not contain %q:\n%s", want, gotDecoders)
		}
	}
}

func mustWrite(t *testing.T, path, data string) {
	t.Helper()
	if err := os.WriteFile(path, []byte(data), 0o644); err != nil {
		t.Fatal(err)
	}
}

func mustRead(t *testing.T, path string) string {
	t.Helper()
	data, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	return string(data)
}
