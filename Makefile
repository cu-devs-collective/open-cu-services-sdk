LOCAL_BIN := $(CURDIR)/bin
PATH      := $(PATH):$(LOCAL_BIN)

YAMLLINT_VERSION := v1.38.0
VACUUM_VERSION   := v0.23.8

YAMLLINT := $(LOCAL_BIN)/yamllint

VACUUM         := $(LOCAL_BIN)/vacuum
VACUUM_RULESET := .spectral.yaml

OPENAPI_SPEC_FILES := api/**/*openapi.yaml

ifneq (,$(wildcard .env))
	include .env
	export
endif


.PHONY: install-bins
install-bins:
	@mkdir -p $(LOCAL_BIN)
	GOBIN=$(LOCAL_BIN) go install github.com/daveshanley/vacuum@$(VACUUM_VERSION)
	GOBIN=$(LOCAL_BIN) go install github.com/wasilibs/go-yamllint/cmd/yamllint@$(YAMLLINT_VERSION)

.PHONY: install
install: install-bins

.PHONY: lint
lint:
	@$(YAMLLINT) $(OPENAPI_SPEC_FILES)
	@$(VACUUM) lint -b -d --no-clip -r ./.spectral.yaml $(OPENAPI_SPEC_FILES)
