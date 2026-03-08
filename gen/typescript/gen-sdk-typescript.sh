#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Generate TypeScript SDK from OpenAPI specs using openapi-typescript,
# openapi-fetch, ts-to-zod and templates.
#
# Current spec to module mapping:
# - cu-lms -> open-cu-services-lmsapi
#------------------------------------------------------------------------------

OPENAPI_TYPESCRIPT_VERSION="7.13.0"
OPENAPI_FETCH_VERSION="0.17.0"
TS_TO_ZOD_VERSION="5.1.0"
ZOD_VERSION="4.3.6"
TYPESCRIPT_VERSION="5.9.3"

SPEC_KEYS_TO_GENERATE=(
    cu-lms
)

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SPEC_BASE="${ROOT_DIR}/spec"
OUT_BASE="${ROOT_DIR}/typescript"
TEMPLATE_DIR="${ROOT_DIR}/gen/typescript/templates/common"

die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*" >&2; }

resolve_spec() {
    local key="${1:-}"
    [[ -n "$key" ]] || die "Missing spec key"

    case "$key" in
        cu-lms)
            SPEC_PATH="${SPEC_BASE}/cu-lms/cu-lms.openapi.yaml"
            SDK_ID="lmsapi"
            PACKAGE_NAME="open-cu-services-${SDK_ID}"
            PACKAGE_DESC="Open CU Services LMS API TypeScript SDK"
            OUT_DIR="${OUT_BASE}/${SDK_ID}"
            BASE_URL="https://my.centraluniversity.ru/api"
            CLIENT_FACTORY_NAME="createLmsClient"
            ;;
        *) die "Unknown spec key: '$key'";;
    esac
}

yaml_escape() {
    local s="$1"
    s="${s//\\/\\\\}"
    s="${s//\"/\\\"}"
    printf "\"%s\"" "$s"
}

render_template() {
    local tmpl_path="$1"
    local out_path="$2"

    [[ -f "$tmpl_path" ]] || die "Template not found: $tmpl_path"
    "gomplate" -f "$tmpl_path" -o "$out_path" -c ".=stdin:///data.yaml"
}

sdk_generate() {
    local key="$1"

    info "Generating TypeScript SDK for: $key"
    info "  spec : $SPEC_PATH"
    info "  out  : $OUT_DIR"
    info "  pkg  : $PACKAGE_NAME"
    info "  base : $BASE_URL"

    mkdir -p "$OUT_DIR/src"

    # TODO: generation logic
}

main() {
    command -v node >/dev/null 2>&1 || die "Node.js is required"
    command -v npx >/dev/null 2>&1 || die "npx is required"

    local key
    for key in "${SPEC_KEYS_TO_GENERATE[@]}"; do
        resolve_spec "$key"
        [[ -f "$SPEC_PATH" ]] || die "Spec not found for '$key': $SPEC_PATH"
        sdk_generate "$key"
    done
}

main "$@"
