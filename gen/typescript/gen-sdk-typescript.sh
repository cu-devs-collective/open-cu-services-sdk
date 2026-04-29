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

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VERSION_MANIFEST="${ROOT_DIR}/gen/typescript/version/package.json"
SPEC_BASE="${ROOT_DIR}/spec"
OUT_BASE="${ROOT_DIR}/typescript"
TEMPLATE_DIR="${ROOT_DIR}/gen/typescript/templates"

die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*" >&2; }

load_versions() {
    [[ -f "$VERSION_MANIFEST" ]] || die "Version manifest not found: $VERSION_MANIFEST"

    local versions_data
    versions_data="$(parseversions export typescript "$VERSION_MANIFEST")" \
        || die "Failed to parse versions from $VERSION_MANIFEST"
    eval "$versions_data"

    [[ -n "$OPENAPI_TS_VERSION" ]] || die "Missing OPENAPI_TS_VERSION"
    [[ -n "$TYPESCRIPT_VERSION" ]] || die "Missing TYPESCRIPT_VERSION"
    [[ -n "$ZOD_VERSION" ]] || die "Missing ZOD_VERSION"
    [[ -n "$PNPM_VERSION" ]] || die "Missing PNPM_VERSION"
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

yaml_escape() {
    local s="$1"
    s="${s//\\/\\\\}"
    s="${s//\"/\\\"}"
    printf "\"%s\"" "$s"
}

read_spec_version() {
    local spec_path="$1"
    local version
    version="$(yq -r '.info.version' "$spec_path")"
    [[ -n "$version" && "$version" != "null" ]] \
        || die "Missing info.version in spec: $spec_path"
    printf "%s" "$version"
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
}

ensure_tooling() {
    command -v node >/dev/null 2>&1 || die "Node.js is required"
    command -v pnpm >/dev/null 2>&1 || die "pnpm is required"
    command -v yq >/dev/null 2>&1 || die "yq is required, run make install-tools-generate"
    command -v gomplate >/dev/null 2>&1 || die "gomplate is required, run make install-tools-generate"
    command -v parseversions >/dev/null 2>&1 || die "parseversions is required, run make install-tools-generate"
}

main() {
    ensure_tooling
    load_versions

    PACKAGE_VERSION="${PACKAGE_VERSION:-0.0.0}"

    local key
    for key in "${SPEC_KEYS_TO_GENERATE[@]}"; do
        resolve_spec "$key"
        [[ -f "$SPEC_PATH" ]] || die "Spec not found for '$key': $SPEC_PATH"
        SPEC_VERSION="$(read_spec_version "$SPEC_PATH")"
        sdk_generate "$key"
    done
}

main "$@"
