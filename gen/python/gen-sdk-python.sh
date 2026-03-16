#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Generate Python SDK from OpenAPI specs using openapi-python-client and
# templates with runtime helpers.
#
# Current spec to package mapping:
# - cu-lms -> open-cu-services-lmsapi
#------------------------------------------------------------------------------

# codegen version
OPENAPI_PYTHON_CLIENT_VERSION="0.28.3"
# pyproject.toml dependencies versions
PYTHON_VERSION=">=3.10"
HTTPX_VERSION="==0.28.1"
ATTRS_VERSION="==25.4.0"
PYTHON_DATEUTIL_VERSION="==2.9.0.post0"
# pyproject.toml build system version
UV_VERSION=">=0.10.0,<0.11.0"

SPEC_KEYS_TO_GENERATE=(
    cu-lms
)

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SPEC_BASE="${ROOT_DIR}/spec"
OUT_BASE="${ROOT_DIR}/python"
TEMPLATE_DIR="${ROOT_DIR}/gen/python/templates"
UVX_CACHE_DIR="${ROOT_DIR}/.uv-cache"
UVX_TOOL_DIR="${ROOT_DIR}/.uv-tools"

die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*" >&2; }

resolve_spec() {
    local key="${1:-}"
    [[ -n "$key" ]] || die "Missing spec key"

    case "$key" in
        cu-lms)
            SPEC_PATH="${SPEC_BASE}/cu-lms/cu-lms.openapi.yaml"
            SDK_ID="lmsapi"
            PROJECT_NAME="open-cu-services-${SDK_ID}"
            PACKAGE_IMPORT_NAME="open_cu_services_${SDK_ID}"
            PACKAGE_DESC="Open CU Services LMS API Python SDK"
            OUT_DIR="${OUT_BASE}/${SDK_ID}"
            CONFIG_PATH="${OUT_DIR}/openapi-python-client-config.yml"
            BASE_URL="https://my.centraluniversity.ru/api"
            USER_AGENT="Open-CU-Services/Python"
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

write_generator_config_file() {
    local out_dir="$1"

    local file="$2"
    local tmpl="${TEMPLATE_DIR}/common/openapi-python-client-config.yml.tmpl"

    render_template "$tmpl" "$file" <<EOF
PackageImportName: $(yaml_escape "$PACKAGE_IMPORT_NAME")
EOF
}

write_pyproject_file() {
    local out_dir="$1"

    local file="${out_dir}/pyproject.toml"
    local tmpl="${TEMPLATE_DIR}/common/pyproject.toml.tmpl"

    render_template "$tmpl" "$file" <<EOF
ProjectName: $(yaml_escape "$PROJECT_NAME")
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

write_lmsapi_files() {
    local out_dir="$1"

    local defaults_file="${out_dir}/defaults.py"
    local defaults_file_tmpl="${TEMPLATE_DIR}/cu-lms/defaults.py.tmpl"
    render_template "$defaults_file_tmpl" "$defaults_file" <<EOF
BaseURL: $(yaml_escape "$BASE_URL")
UserAgent: $(yaml_escape "$USER_AGENT")
EOF

    local init_file="${out_dir}/__init__.py"
    local init_file_tmpl="${TEMPLATE_DIR}/cu-lms/__init__.py.tmpl"
    render_template "$init_file_tmpl" "$init_file" <<EOF
PackageDescription: $(yaml_escape "$PACKAGE_DESC")
EOF
}

sdk_generate() {
    local key="$1"

    info "Generating Python SDK for: $key"
    info "  spec : $SPEC_PATH"
    info "  out  : $OUT_DIR"
    info "  dist : $PROJECT_NAME"
    info "  pkg  : $PACKAGE_IMPORT_NAME"
    info "  openapi-python-client: $OPENAPI_PYTHON_CLIENT_VERSION"

    mkdir -p "$OUT_DIR"

    # 1) write package files
    write_generator_config_file "$OUT_DIR" "$CONFIG_PATH"
    write_pyproject_file "$OUT_DIR"

    # 2) run openapi-python-client generation
    info "Running openapi-python-client generation"
    run_uvx --from "openapi-python-client==${OPENAPI_PYTHON_CLIENT_VERSION}" openapi-python-client generate \
        --path "$SPEC_PATH" \
        --meta uv \
        --config "$CONFIG_PATH" \
        --output-path "$OUT_DIR" \
        --overwrite

    local package_dir="${OUT_DIR}/${PACKAGE_IMPORT_NAME}"
    [[ -d "$package_dir" ]] || die "Generated package directory not found: $package_dir"

    # 3) write extra package-specific files
    if [[ -n "${EXTRA_FILES_WRITER:-}" ]]; then
        info "Writing extra files via ${EXTRA_FILES_WRITER}"
        "${EXTRA_FILES_WRITER}" "$OUT_DIR"
    fi
}

ensure_tooling() {
    command -v python3 >/dev/null 2>&1 || die "Python 3 is required"
    command -v uv >/dev/null 2>&1 || die "uv is required"
    command -v gomplate >/dev/null 2>&1 || die "gomplate is required, run make install-tools-generate"
}

main() {
    ensure_tooling

    local key
    for key in "${SPEC_KEYS_TO_GENERATE[@]}"; do
        resolve_spec "$key"
        [[ -f "$SPEC_PATH" ]] || die "Spec not found for '$key': $SPEC_PATH"
        sdk_generate "$key"
    done
}

main "$@"
