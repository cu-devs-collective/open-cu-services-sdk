LOCAL_BIN ?= $(CURDIR)/bin
PATH      := $(PATH):$(LOCAL_BIN)
GO        ?= go
GEN_SDK   := $(CURDIR)/gen/gen-sdk.sh

GOYAMLLINT_VERSION := v1.38.0
VACUUM_VERSION     := v0.24.0
GOMPLATE_VERSION   := v5.0.0
YQ_VERSION         := v4.52.4

YAMLLINT := $(LOCAL_BIN)/yamllint

VACUUM           := $(LOCAL_BIN)/vacuum
VACUUM_RULESET   := .spectral.yaml
VACUUM_LINT_ARGS := lint -b -d --no-clip -n warn --remote=false --min-score 100 -r $(VACUUM_RULESET)

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

.PHONY: install-tools-lint
install-tools-lint: check-go $(LOCAL_BIN)
	GOBIN=$(LOCAL_BIN) $(GO) install github.com/daveshanley/vacuum@$(VACUUM_VERSION)
	GOBIN=$(LOCAL_BIN) $(GO) install github.com/wasilibs/go-yamllint/cmd/yamllint@$(GOYAMLLINT_VERSION)

.PHONY: install-tools-generate
install-tools-generate: check-go $(LOCAL_BIN)
	GOBIN=$(LOCAL_BIN) $(GO) install github.com/hairyhenderson/gomplate/v5/cmd/gomplate@$(GOMPLATE_VERSION)
	GOBIN=$(LOCAL_BIN) $(GO) install github.com/mikefarah/yq/v4@$(YQ_VERSION)

.PHONY: install-tools
install-tools: install-tools-lint install-tools-generate

.PHONY: install
install: install-tools

.PHONY: lint
lint: lint-yamllint lint-vacuum

.PHONY: lint-yamllint
lint-yamllint:
	@$(YAMLLINT) $(OPENAPI_SPEC_FILES)

.PHONY: lint-vacuum
lint-vacuum:
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
	$(info Skipped - not supported yet)
# 	@$(GEN_SDK) python

.PHONY: generate-typescript
generate-typescript:
	$(info Running TypeScript SDK generation...)
	@$(GEN_SDK) typescript

.PHONY: generate-dart
generate-dart:
	$(info Running Dart SDK generation...)
	$(info Skipped - not supported yet)
# 	@$(GEN_SDK) dart
