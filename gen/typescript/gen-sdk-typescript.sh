#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Generate TypeScript SDK from OpenAPI specs using @hey-api/openapi-ts, zod,
# and templates.
#
# Current spec to module mapping:
# - lmsapi -> @cu-devs-collective/open-cu-services-lmsapi
#------------------------------------------------------------------------------

SPEC_KEYS_TO_GENERATE=(
    lmsapi
)

SDK_GEN_LANGUAGE="TypeScript"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VERSION_MANIFEST="${ROOT_DIR}/gen/typescript/version/package.json"
SPEC_BASE="${ROOT_DIR}/spec"
OUT_BASE="${ROOT_DIR}/typescript"
TEMPLATE_DIR="${ROOT_DIR}/gen/typescript/templates"

# shellcheck source=gen/_common/sdk-gen-common.sh
source "${ROOT_DIR}/gen/_common/sdk-gen-common.sh"

load_versions() {
    load_version_manifest typescript "$VERSION_MANIFEST" \
        OPENAPI_TS_VERSION \
        TYPESCRIPT_VERSION \
        ZOD_VERSION \
        PNPM_VERSION
}

resolve_spec() {
    local key="${1:-}"
    [[ -n "$key" ]] || die "Missing spec key"

    case "$key" in
        lmsapi)
            SPEC_ID="lmsapi"
            SDK_ID="lmsapi"
            SPEC_PATH="${SPEC_BASE}/${SPEC_ID}/${SPEC_ID}.re.openapi.yaml"
            PACKAGE_NAME="@cu-devs-collective/open-cu-services-${SDK_ID}"
            PACKAGE_DESC="Open CU Services LMS API TypeScript SDK"
            OUT_DIR="${OUT_BASE}/${SDK_ID}"
            EXTRA_FILES_WRITER="write_lmsapi_files"
            BASE_URL="https://my.centraluniversity.ru/api"
            USER_AGENT="Open-CU-Services/TypeScript"
            CLIENT_FACTORY_NAME="createLmsApiClient"
            ;;
        *) die "Unknown spec key: '$key'";;
    esac
}

write_package_json_file() {
    local out_dir="$1"

    local file="${out_dir}/package.json"
    local tmpl="${TEMPLATE_DIR}/common/package.json.tmpl"
    render_template "$tmpl" "$file" <<EOF
PackageName: $(yaml_escape "$PACKAGE_NAME")
PackageVersion: $(yaml_escape "$PACKAGE_VERSION")
SpecVersion: $(yaml_escape "$SPEC_VERSION")
SpecRef: $(yaml_escape "spec/${SDK_ID}/${SPEC_VERSION}")
PackageDescription: $(yaml_escape "$PACKAGE_DESC")
OpenapiTsVersion: $(yaml_escape "$OPENAPI_TS_VERSION")
TypescriptVersion: $(yaml_escape "$TYPESCRIPT_VERSION")
ZodVersion: $(yaml_escape "$ZOD_VERSION")
PnpmVersion: $(yaml_escape "$PNPM_VERSION")
EOF
}

write_gitignore_file() {
    local out_dir="$1"

    local file="${out_dir}/.gitignore"
    local tmpl="${TEMPLATE_DIR}/common/gitignore.tmpl"
    render_template "$tmpl" "$file" <<'EOF'
{}
EOF
}

write_tsconfig_file() {
    local out_dir="$1"

    local file="${out_dir}/tsconfig.json"
    local tmpl="${TEMPLATE_DIR}/common/tsconfig.json.tmpl"
    render_template "$tmpl" "$file" <<'EOF'
{}
EOF
}

write_openapi_ts_config_file() {
    local out_dir="$1"
    local spec_path="$2"

    local file="${out_dir}/openapi-ts.config.ts"
    local tmpl="${TEMPLATE_DIR}/common/openapi-ts.config.ts.tmpl"
    render_template "$tmpl" "$file" <<EOF
SpecPath: $(yaml_escape "$spec_path")
EOF
}

write_lmsapi_files() {
    local out_dir="$1"

    local default_file="${out_dir}/src/default.ts"
    local default_file_tmpl="${TEMPLATE_DIR}/common/default.ts.tmpl"
    render_template "$default_file_tmpl" "$default_file" <<EOF
BaseURL: $(yaml_escape "$BASE_URL")
UserAgent: $(yaml_escape "$USER_AGENT")
ClientFactoryName: $(yaml_escape "$CLIENT_FACTORY_NAME")
PackageVersion: $(yaml_escape "$PACKAGE_VERSION")
SpecVersion: $(yaml_escape "$SPEC_VERSION")
EOF
}

ensure_default_export() {
    local out_dir="$1"
    local index_file="${out_dir}/src/index.ts"
    local export_line='export * from "./default";'

    grep -Fqx "$export_line" "$index_file" || printf '\n%s\n' "$export_line" >>"$index_file"
}

verify_sdk() {
    local out_dir="$1"

    if [[ "${VERIFY_SDK:-1}" == "0" ]]; then
        info "Skipping TypeScript SDK verification"
        return
    fi

    info "Verifying TypeScript SDK"
    (cd "$out_dir" && pnpm run build)
}

sdk_generate() {
    local key="$1"

    info "Generating TypeScript SDK for: $key"
    info "  spec : $SPEC_PATH"
    info "  out  : $OUT_DIR"
    info "  pkg  : $PACKAGE_NAME"
    info "  sdk  : $PACKAGE_VERSION"
    info "  spec : $SPEC_VERSION"
    info "  openapi-ts: $OPENAPI_TS_VERSION"

    mkdir -p "$OUT_DIR"

    # 1) write package files
    write_package_json_file "$OUT_DIR"
    write_gitignore_file "$OUT_DIR"
    write_tsconfig_file "$OUT_DIR"
    local spec_rel="../../spec/${SPEC_PATH#"${SPEC_BASE}"/}"
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

    # 6) verify generated package
    verify_sdk "$OUT_DIR"
}

ensure_tooling() {
    command -v node >/dev/null 2>&1 || die "Node.js is required"
    command -v pnpm >/dev/null 2>&1 || die "pnpm is required"
    command -v yq >/dev/null 2>&1 || die "yq is required, run make install-tools-generate"
    command -v gomplate >/dev/null 2>&1 || die "gomplate is required, run make install-tools-generate"
    command -v parseversions >/dev/null 2>&1 || die "parseversions is required, run make install-tools-generate"
}

sdk_gen_main "$@"
