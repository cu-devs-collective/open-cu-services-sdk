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

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VERSION_MANIFEST="${ROOT_DIR}/gen/python/version/pyproject.toml"
SPEC_BASE="${ROOT_DIR}/spec"
OUT_BASE="${ROOT_DIR}/python"
TEMPLATE_DIR="${ROOT_DIR}/gen/python/templates"
UVX_CACHE_DIR="${ROOT_DIR}/.uv-cache"
UVX_TOOL_DIR="${ROOT_DIR}/.uv-tools"

die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*" >&2; }

usage() {
    cat >&2 <<EOF
Usage:
  $(basename "$0") [--sdk-id <id> ...]

Generate Python SDKs.

Options:
  --sdk-id <id>       Run SDK generation only for specified SDK ID. Argument can be repeated.
  -h, --help          Show this help.

Default SDK IDs:
  ${SPEC_KEYS_TO_GENERATE[*]}
EOF
}

parse_args() {
    local -a sdk_ids=()

    while (($#)); do
        case "$1" in
            --sdk-id)
                shift || true
                [[ -n "${1:-}" && "${1:-}" != -* ]] || die "--sdk-id requires a value"
                sdk_ids+=("$1")
                ;;
            --sdk-id=*)
                local sdk_id="${1#--sdk-id=}"
                [[ -n "$sdk_id" && "$sdk_id" != -* ]] || die "--sdk-id requires a value"
                sdk_ids+=("$sdk_id")
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            *)
                die "Unknown argument: $1"
                ;;
        esac
        shift || true
    done

    if (( ${#sdk_ids[@]} > 0 )); then
        SPEC_KEYS_TO_GENERATE=("${sdk_ids[@]}")
    fi
}

load_versions() {
    [[ -f "$VERSION_MANIFEST" ]] || die "Version manifest not found: $VERSION_MANIFEST"

    local versions_data
    versions_data="$(parseversions export python "$VERSION_MANIFEST")" \
        || die "Failed to parse versions from $VERSION_MANIFEST"
    eval "$versions_data"

    [[ -n "$OPENAPI_PYTHON_CLIENT_VERSION" ]] || die "Missing OPENAPI_PYTHON_CLIENT_VERSION"
    [[ -n "$PYTHON_VERSION" ]] || die "Missing PYTHON_VERSION"
    [[ -n "$HTTPX_VERSION" ]] || die "Missing HTTPX_VERSION"
    [[ -n "$ATTRS_VERSION" ]] || die "Missing ATTRS_VERSION"
    [[ -n "$PYTHON_DATEUTIL_VERSION" ]] || die "Missing PYTHON_DATEUTIL_VERSION"
    [[ -n "$UV_VERSION" ]] || die "Missing UV_VERSION"
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
SpecRef: $(yaml_escape "spec/${SDK_ID}/${SPEC_VERSION}")
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
SpecRef: $(yaml_escape "spec/${SDK_ID}/${SPEC_VERSION}")
EOF
}

sdk_generate() {
    local key="$1"

    info "Generating Python SDK for: $key"
    info "  spec : $SPEC_PATH"
    info "  out  : $OUT_DIR"
    info "  dist : $PROJECT_NAME"
    info "  pkg  : $PACKAGE_IMPORT_NAME"
    info "  sdk  : $PACKAGE_VERSION"
    info "  spec : $SPEC_VERSION"
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

main() {
    parse_args "$@"
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
