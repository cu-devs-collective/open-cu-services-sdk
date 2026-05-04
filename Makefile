LOCAL_BIN ?= $(CURDIR)/bin
PATH      := $(PATH):$(LOCAL_BIN)
GO        ?= go
GEN_SDK   := $(CURDIR)/gen/gen-sdk.sh

GOYAMLLINT_VERSION           := v1.38.0
VACUUM_VERSION               := v0.26.1
GOMPLATE_VERSION             := v5.0.0
YQ_VERSION                   := v4.53.2
EDITORCONFIG_CHECKER_VERSION := v3.6.1

YAMLLINT := $(LOCAL_BIN)/yamllint

VACUUM           := $(LOCAL_BIN)/vacuum
VACUUM_RULESET   := .spectral.yaml
VACUUM_LINT_ARGS := lint -b -d --no-clip -n warn --remote=false --min-score 100 -r $(VACUUM_RULESET)

EDITORCONFIG_CHECKER := $(LOCAL_BIN)/editorconfig-checker

OPENAPI_SPEC_FILES := spec/**/*openapi.yaml

ifneq (,$(wildcard .env))
	include .env
	export
endif

.PHONY: check-go
check-go:
	@command -v $(GO) >/dev/null 2>&1 || { echo "Go is required: https://go.dev/doc/install"; exit 1; }

$(LOCAL_BIN):
	@mkdir -p $@

.PHONY: install-tools-lint-specs
install-tools-lint-specs: check-go $(LOCAL_BIN)
	GOBIN=$(LOCAL_BIN) $(GO) install github.com/daveshanley/vacuum@$(VACUUM_VERSION)
	GOBIN=$(LOCAL_BIN) $(GO) install github.com/wasilibs/go-yamllint/cmd/yamllint@$(GOYAMLLINT_VERSION)

.PHONY: install-tools-lint-other
install-tools-lint-other: check-go $(LOCAL_BIN)
	GOBIN=$(LOCAL_BIN) $(GO) install github.com/editorconfig-checker/editorconfig-checker/v3/cmd/editorconfig-checker@$(EDITORCONFIG_CHECKER_VERSION)

.PHONY: install-tools-generate
install-tools-generate: check-go $(LOCAL_BIN)
	GOBIN=$(LOCAL_BIN) $(GO) install github.com/hairyhenderson/gomplate/v5/cmd/gomplate@$(GOMPLATE_VERSION)
	GOBIN=$(LOCAL_BIN) $(GO) install github.com/mikefarah/yq/v4@$(YQ_VERSION)
	cd tools/parseversions && GOBIN=$(LOCAL_BIN) $(GO) install
	cd tools/patchers/goclientpatcher && GOBIN=$(LOCAL_BIN) $(GO) install

.PHONY: install-tools
install-tools: install-tools-lint-specs install-tools-lint-other install-tools-generate

.PHONY: install
install: install-tools

.PHONY: lint
lint: lint-specs lint-other

.PHONY: lint-specs
lint-specs: lint-specs-yamllint lint-specs-vacuum

.PHONY: lint-other
lint-other:
	@$(EDITORCONFIG_CHECKER)

.PHONY: lint-specs-yamllint
lint-specs-yamllint:
	@$(YAMLLINT) $(OPENAPI_SPEC_FILES)

.PHONY: lint-specs-vacuum
lint-specs-vacuum:
	@$(VACUUM) $(VACUUM_LINT_ARGS) $(OPENAPI_SPEC_FILES)

.PHONY: generate
generate: generate-golang generate-python generate-typescript generate-dart

.PHONY: generate-golang
generate-golang:
	$(info Running Go SDK generation...)
	@$(GEN_SDK) golang

.PHONY: generate-python
generate-python:
	$(info Running Python SDK generation...)
	@$(GEN_SDK) python

.PHONY: generate-typescript
generate-typescript:
	$(info Running TypeScript SDK generation...)
	@$(GEN_SDK) typescript

.PHONY: generate-dart
generate-dart:
	$(info Running Dart SDK generation...)
	@$(GEN_SDK) dart
