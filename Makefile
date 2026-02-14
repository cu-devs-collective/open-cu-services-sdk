LOCAL_BIN := $(CURDIR)/bin
PATH      := $(PATH):$(LOCAL_BIN)

VACUUM         := $(LOCAL_BIN)/vacuum
VACUUM_VERSION := v0.23.8

OPENAPI_SPEC_FILES := "./api/cu-lms/cu-lms.openapi.yaml"

ifneq (,$(wildcard .env))
	include .env
	export
endif


.PHONY: install-bins
install-bins:
	@mkdir -p $(LOCAL_BIN)
	GOBIN=$(LOCAL_BIN) go install github.com/daveshanley/vacuum@$(VACUUM_VERSION)

.PHONY: install
install: install-bins

.PHONY: lint
lint:
	$(VACUUM) lint -b -d --no-clip $(OPENAPI_SPEC_FILES)
