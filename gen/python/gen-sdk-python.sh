#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Generate Python SDK from OpenAPI specs using openapi-python-client and
# templates with runtime helpers.
#
# Current spec to package mapping:
# - lmsapi -> open-cu-services-lmsapi
#------------------------------------------------------------------------------

SPEC_KEYS_TO_GENERATE=(
    lmsapi
)

SDK_GEN_LANGUAGE="Python"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VERSION_MANIFEST="${ROOT_DIR}/gen/python/version/pyproject.toml"
SPEC_BASE="${ROOT_DIR}/spec"
OUT_BASE="${ROOT_DIR}/python"
TEMPLATE_DIR="${ROOT_DIR}/gen/python/templates"
UVX_CACHE_DIR="${ROOT_DIR}/.uv-cache"
UVX_TOOL_DIR="${ROOT_DIR}/.uv-tools"

# shellcheck source=gen/_common/sdk-gen-common.sh
source "${ROOT_DIR}/gen/_common/sdk-gen-common.sh"

load_versions() {
    load_version_manifest python "$VERSION_MANIFEST" \
        OPENAPI_PYTHON_CLIENT_VERSION \
        PYTHON_VERSION \
        HTTPX_VERSION \
        ATTRS_VERSION \
        PYTHON_DATEUTIL_VERSION \
        UV_VERSION
}

resolve_spec() {
    local key="${1:-}"
    [[ -n "$key" ]] || die "Missing spec key"

    case "$key" in
        lmsapi)
            SPEC_ID="lmsapi"
            SDK_ID="lmsapi"
            SPEC_PATH="${SPEC_BASE}/${SPEC_ID}/${SPEC_ID}.re.openapi.yaml"
            PROJECT_NAME="open-cu-services-${SDK_ID}"
            PACKAGE_IMPORT_NAME="open_cu_services_${SDK_ID}"
            PACKAGE_DESC="Open CU Services LMS API Python SDK"
            OUT_DIR="${OUT_BASE}/${SDK_ID}"
            CONFIG_PATH="${OUT_DIR}/openapi-python-client-config.yml"
            EXTRA_FILES_WRITER="write_lmsapi_files"
            BASE_URL="https://my.centraluniversity.ru/api"
            USER_AGENT="Open-CU-Services/Python"
            ;;
        *) die "Unknown spec key: '$key'";;
    esac
}

write_generator_config_file() {
    local out_dir="$1"

    local file="$2"
    local tmpl="${TEMPLATE_DIR}/common/openapi-python-client-config.yml.tmpl"
    render_template "$tmpl" "$file" <<EOF
ProjectName: $(yaml_escape "$PROJECT_NAME")
PackageImportName: $(yaml_escape "$PACKAGE_IMPORT_NAME")
EOF
}

write_pyproject_file() {
    local out_dir="$1"

    local file="${out_dir}/pyproject.toml"
    local tmpl="${TEMPLATE_DIR}/common/pyproject.toml.tmpl"
    render_template "$tmpl" "$file" <<EOF
ProjectName: $(yaml_escape "$PROJECT_NAME")
PackageVersion: $(yaml_escape "$PACKAGE_VERSION")
SpecVersion: $(yaml_escape "$SPEC_VERSION")
SpecRef: $(yaml_escape "spec/${SDK_ID}/v${SPEC_VERSION}")
PackageDescription: $(yaml_escape "$PACKAGE_DESC")
PythonVersion: $(yaml_escape "$PYTHON_VERSION")
HttpxVersion: $(yaml_escape "$HTTPX_VERSION")
AttrsVersion: $(yaml_escape "$ATTRS_VERSION")
PythonDateutilVersion: $(yaml_escape "$PYTHON_DATEUTIL_VERSION")
PackageImportName: $(yaml_escape "$PACKAGE_IMPORT_NAME")
UvVersion: $(yaml_escape "$UV_VERSION")
EOF
}

run_uvx() {
    mkdir -p "$UVX_CACHE_DIR" "$UVX_TOOL_DIR"
    UV_CACHE_DIR="$UVX_CACHE_DIR" UV_TOOL_DIR="$UVX_TOOL_DIR" uvx "$@"
}

verify_sdk() {
    local out_dir="$1"

    if [[ "${VERIFY_SDK:-1}" == "0" ]]; then
        info "Skipping Python SDK verification"
        return
    fi

    info "Verifying Python SDK"
    (
        cd "$out_dir"
        run_uvx ruff check . --no-respect-gitignore --select F,E9
        uv build
    )
}

write_lmsapi_files() {
    local out_dir="$1"
    local pkg_import_name="$2"

    local defaults_file="${out_dir}/$pkg_import_name/defaults.py"
    local defaults_file_tmpl="${TEMPLATE_DIR}/lmsapi/defaults.py.tmpl"
    render_template "$defaults_file_tmpl" "$defaults_file" <<EOF
BaseURL: $(yaml_escape "$BASE_URL")
UserAgent: $(yaml_escape "$USER_AGENT")
PackageVersion: $(yaml_escape "$PACKAGE_VERSION")
SpecVersion: $(yaml_escape "$SPEC_VERSION")
EOF

    local init_file="${out_dir}/$pkg_import_name/__init__.py"
    local init_file_tmpl="${TEMPLATE_DIR}/lmsapi/__init__.py.tmpl"
    render_template "$init_file_tmpl" "$init_file" <<EOF
PackageDescription: $(yaml_escape "$PACKAGE_DESC")
PackageVersion: $(yaml_escape "$PACKAGE_VERSION")
SpecVersion: $(yaml_escape "$SPEC_VERSION")
SpecRef: $(yaml_escape "spec/${SDK_ID}/v${SPEC_VERSION}")
EOF
}

sdk_generate() {
    local key="$1"

    info "Generating Python SDK for: $key"
    info "  spec : $SPEC_PATH"
    info "  out  : $OUT_DIR"
    info "  dist : $PROJECT_NAME"
    info "  pkg  : $PACKAGE_IMPORT_NAME"
    info "  sdk  : v$PACKAGE_VERSION"
    info "  spec : v$SPEC_VERSION"
    info "  openapi-python-client: $OPENAPI_PYTHON_CLIENT_VERSION"

    mkdir -p "$OUT_DIR"

    # 1) write generator config
    write_generator_config_file "$OUT_DIR" "$CONFIG_PATH"

    # 2) run openapi-python-client generation
    info "Running openapi-python-client generation"
    run_uvx --from "openapi-python-client${OPENAPI_PYTHON_CLIENT_VERSION}" openapi-python-client generate \
        --path "$SPEC_PATH" \
        --meta uv \
        --config "$CONFIG_PATH" \
        --output-path "$OUT_DIR" \
        --overwrite

    local package_dir="${OUT_DIR}/${PACKAGE_IMPORT_NAME}"
    [[ -d "$package_dir" ]] || die "Generated package directory not found: $package_dir"

    # 3) rewrite package pyproject.toml file
    write_pyproject_file "$OUT_DIR"

    # 4) write extra package-specific files
    if [[ -n "${EXTRA_FILES_WRITER:-}" ]]; then
        info "Writing extra files via ${EXTRA_FILES_WRITER}"
        "${EXTRA_FILES_WRITER}" "$OUT_DIR" "$PACKAGE_IMPORT_NAME"
    fi

    # 5) verify generated package
    verify_sdk "$OUT_DIR"
}

ensure_tooling() {
    command -v python3 >/dev/null 2>&1 || die "Python 3 is required"
    command -v uv >/dev/null 2>&1 || die "uv is required"
    command -v yq >/dev/null 2>&1 || die "yq is required, run make install-tools-generate"
    command -v gomplate >/dev/null 2>&1 || die "gomplate is required, run make install-tools-generate"
    command -v parseversions >/dev/null 2>&1 || die "parseversions is required, run make install-tools-generate"
}

sdk_gen_main "$@"
