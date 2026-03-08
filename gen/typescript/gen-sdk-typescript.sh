#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Generate TypeScript SDK from OpenAPI specs using @hey-api/openapi-ts, zod,
# and templates.
#
# Current spec to module mapping:
# - cu-lms -> open-cu-services-lmsapi
#------------------------------------------------------------------------------

OPENAPI_TS_VERSION="0.94.0"
TYPESCRIPT_VERSION="5.9.3"
ZOD_VERSION="4.3.6"
PNPM_VERSION="10.31.0"

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
            EXTRA_FILES_WRITER="write_lmsapi_files"
            BASE_URL="https://my.centraluniversity.ru/api"
            CLIENT_FACTORY_NAME="createLmsApiClient"
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
    gomplate -f "$tmpl_path" -o "$out_path" -c ".=stdin:///data.yaml"
}

write_package_json_file() {
    local out_dir="$1"

    local file="${out_dir}/package.json"
    local tmpl="${TEMPLATE_DIR}/package.json.tmpl"

    render_template "$tmpl" "$file" <<EOF
PackageName: $(yaml_escape "$PACKAGE_NAME")
PackageDescription: $(yaml_escape "$PACKAGE_DESC")
OpenapiTsVersion: $(yaml_escape "$OPENAPI_TS_VERSION")
TypescriptVersion: $(yaml_escape "$TYPESCRIPT_VERSION")
ZodVersion: $(yaml_escape "$ZOD_VERSION")
PnpmVersion: $(yaml_escape "$PNPM_VERSION")
EOF
}

write_tsconfig_file() {
    local out_dir="$1"

    local file="${out_dir}/tsconfig.json"
    local tmpl="${TEMPLATE_DIR}/tsconfig.json.tmpl"

    render_template "$tmpl" "$file" <<'EOF'
{}
EOF
}

write_openapi_ts_config_file() {
    local out_dir="$1"
    local spec_path="$2"

    local file="${out_dir}/openapi-ts.config.ts"
    local tmpl="${TEMPLATE_DIR}/openapi-ts.config.ts.tmpl"

    render_template "$tmpl" "$file" <<EOF
SpecPath: $(yaml_escape "$spec_path")
EOF
}

write_lmsapi_files() {
    local out_dir="$1"

    local default_file="${out_dir}/src/default.ts"
    local default_file_tmpl="${TEMPLATE_DIR}/default.ts.tmpl"
    render_template "$default_file_tmpl" "$default_file" <<EOF
BaseURL: $(yaml_escape "$BASE_URL")
ClientFactoryName: $(yaml_escape "$CLIENT_FACTORY_NAME")
EOF
}

ensure_default_export() {
    local out_dir="$1"
    local index_file="${out_dir}/src/index.ts"
    local export_line='export * from "./default";'

    grep -Fqx "$export_line" "$index_file" || printf '\n%s\n' "$export_line" >>"$index_file"
}

sdk_generate() {
    local key="$1"

    info "Generating TypeScript SDK for: $key"
    info "  spec : $SPEC_PATH"
    info "  out  : $OUT_DIR"
    info "  pkg  : $PACKAGE_NAME"
    info "  openapi-ts: $OPENAPI_TS_VERSION"

    mkdir -p "$OUT_DIR"

    # 1) write package files
    write_package_json_file "$OUT_DIR"
    write_tsconfig_file "$OUT_DIR"
    local spec_rel="../../spec/${SPEC_PATH#${SPEC_BASE}/}"
    write_openapi_ts_config_file "$OUT_DIR" "$spec_rel"

    # 2) install pnpm deps
    info "Installing pnpm dependencies"
    (cd "$OUT_DIR" && CI=true pnpm install --frozen-lockfile=false)

    # 3) run openapi-ts generation
    info "Running openapi-ts generation"
    (cd "$OUT_DIR" && pnpm exec openapi-ts -f openapi-ts.config.ts)

    # 4) write extra package-specific files
    if [[ -n "${EXTRA_FILES_WRITER:-}" ]]; then
        info "Writing extra files via ${EXTRA_FILES_WRITER}"
        "${EXTRA_FILES_WRITER}" "$OUT_DIR"
    fi

    # 5) ensure default helpers are exported from package entrypoint
    ensure_default_export "$OUT_DIR"
}

main() {
    command -v node >/dev/null 2>&1 || die "Node.js is required"
    command -v pnpm >/dev/null 2>&1 || die "pnpm is required"
    command -v gomplate >/dev/null 2>&1 || die "gomplate is required, run make install-tools-generate"

    local key
    for key in "${SPEC_KEYS_TO_GENERATE[@]}"; do
        resolve_spec "$key"
        [[ -f "$SPEC_PATH" ]] || die "Spec not found for '$key': $SPEC_PATH"
        sdk_generate "$key"
    done
}

main "$@"
