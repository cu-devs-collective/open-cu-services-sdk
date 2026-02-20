LOCAL_BIN ?= $(CURDIR)/bin
PATH      := $(PATH):$(LOCAL_BIN)
GO        ?= go

YAMLLINT_VERSION := v1.38.0
VACUUM_VERSION   := v0.23.8

YAMLLINT := $(LOCAL_BIN)/yamllint

VACUUM           := $(LOCAL_BIN)/vacuum
VACUUM_RULESET   := .spectral.yaml
VACUUM_LINT_ARGS := lint -b -d --no-clip -n warn --remote=false --min-score 100 -r $(VACUUM_RULESET)

OPENAPI_SPEC_FILES := spec/**/*openapi.yaml

ifneq (,$(wildcard .env))
	include .env
	export
endif

.PHONY: install-tools
install-tools:
	@command -v $(GO) >/dev/null 2>&1 || { echo "Go is required: https://go.dev/doc/install"; exit 1; }
	@mkdir -p $(LOCAL_BIN)
	GOBIN=$(LOCAL_BIN) $(GO) install github.com/daveshanley/vacuum@$(VACUUM_VERSION) \
		&& GOBIN=$(LOCAL_BIN) $(GO) install github.com/wasilibs/go-yamllint/cmd/yamllint@$(YAMLLINT_VERSION)

.PHONY: install
install: install-tools

.PHONY: lint
lint:
	@$(YAMLLINT) $(OPENAPI_SPEC_FILES)
	@$(VACUUM) $(VACUUM_LINT_ARGS) $(OPENAPI_SPEC_FILES)

.PHONY: lint-vacuum
lint-vacuum:
	@$(VACUUM) $(VACUUM_LINT_ARGS) $(OPENAPI_SPEC_FILES)
