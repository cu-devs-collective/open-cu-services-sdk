#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Generate Go SDK from OpenAPI specs using ogen, go generate and templates.
# SDKs are generated as separate Go modules.
#
# Current spec to module mapping:
# - cu-lms -> github.com/cu-devs-collective/open-cu-services-openapi/golang/lmsapi
#------------------------------------------------------------------------------

# codegen version
OGEN_VERSION="v1.20.1"

SPEC_KEYS_TO_GENERATE=(
    cu-lms
)
OGEN_CONFIG_PATH="../.ogen.yaml"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SPEC_BASE="${ROOT_DIR}/spec"
OUT_BASE="${ROOT_DIR}/golang"
TEMPLATE_DIR="${ROOT_DIR}/gen/golang/templates"

MODULE_BASE="github.com/cu-devs-collective/open-cu-services-openapi/golang"

die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*" >&2; }

resolve_spec() {
    local key="${1:-}"
    [[ -n "$key" ]] || die "Missing spec key"

    case "$key" in
        cu-lms)
            SPEC_PATH="${SPEC_BASE}/cu-lms/cu-lms.openapi.yaml"
            PKG_NAME="lmsapi"
            PKG_DESC="Package lmsapi provides SDK for the CU LMS API."
            OUT_DIR="${OUT_BASE}/${PKG_NAME}"
            MODULE_PATH="${MODULE_BASE}/${PKG_NAME}"
            EXTRA_FILES_WRITER="write_lmsapi_files"
            BASE_URL="https://my.centraluniversity.ru/api"
            USER_AGENT="Open-CU-Services/Go"
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

write_gen_file() {
    local out_dir="$1"
    local pkg="$2"
    local spec_rel="$3"

    local file="${out_dir}/gen.go"
    local tmpl="${TEMPLATE_DIR}/common/gen.go.tmpl"

    render_template "$tmpl" "$file" <<EOF
Package: $(yaml_escape "$pkg")
OgenVersion: $(yaml_escape "$OGEN_VERSION")
Config: true
ConfigPath: $(yaml_escape "$OGEN_CONFIG_PATH")
TargetDir: "."
OgenPackageName: $(yaml_escape "$pkg")
Clean: true
SpecPath: $(yaml_escape "$spec_rel")
EOF
}

write_lmsapi_files() {
    local out_dir="$1"
    local pkg="$2"
    local pkg_desc="$3"

    local package_file="${out_dir}/${pkg}.go"
    local package_file_tmpl="${TEMPLATE_DIR}/common/_package.go.tmpl"
    render_template "$package_file_tmpl" "$package_file" <<EOF
Package: $(yaml_escape "$pkg")
PackageDescription: $(yaml_escape "$pkg_desc")
BaseURL: $(yaml_escape "$BASE_URL")
UserAgent: $(yaml_escape "$USER_AGENT")
EOF

    local default_gen_file="${out_dir}/default_gen.go"
    local default_gen_file_tmpl="${TEMPLATE_DIR}/cu-lms/default_gen.go.tmpl"
    render_template "$default_gen_file_tmpl" "$default_gen_file" <<EOF
Package: $(yaml_escape "$pkg")
EOF
}

extract_ogen_version_from_file() {
    local file="$1"
    sed -nE 's/^[[:space:]]*\/\/go:generate[[:space:]].*github\.com\/ogen-go\/ogen\/cmd\/ogen@([^[:space:]]+).*/\1/p' "$file" \
        | head -n 1
}

sdk_generate() {
    local key="$1"

    info "Generating Go SDK for: $key"
    info "  spec: $SPEC_PATH"
    info "  pkg : $PKG_NAME"
    info "  out : $OUT_DIR"
    info "  mod : $MODULE_PATH"
    info "  ogen: $OGEN_VERSION"

    mkdir -p "$OUT_DIR"

    # 1) go mod init if missing
    if [[ ! -f "${OUT_DIR}/go.mod" ]]; then
        info "Initializing go.mod"
        (cd "$OUT_DIR" && go mod init "$MODULE_PATH")
    else
        info "go.mod exists, skipping go mod init"
    fi

    # 2) go get ogen@version
    (cd "$OUT_DIR" && go get "github.com/ogen-go/ogen@${OGEN_VERSION}")

    # 3) write/update gen.go
    local gen_file="${OUT_DIR}/gen.go"
    local needs_rewrite=0
    if [[ ! -f "$gen_file" ]]; then
        info "Writing ${gen_file}"
        needs_rewrite=1
    else
        local current_ver
        current_ver="$(extract_ogen_version_from_file "$gen_file")"

        if [[ -z "$current_ver" ]]; then
            info "gen.go has no recognizable ogen version, rewriting file"
            needs_rewrite=1
        elif [[ "$current_ver" != "$OGEN_VERSION" ]]; then
            info "gen.go ogen version changed (${current_ver} -> ${OGEN_VERSION}), rewriting file"
            needs_rewrite=1
        else
            info "No ogen version change (${OGEN_VERSION})"
        fi
    fi

    local spec_rel="../../spec/${SPEC_PATH#"${SPEC_BASE}"/}"
    if (( needs_rewrite )); then
        write_gen_file "$OUT_DIR" "$PKG_NAME" "$spec_rel"
    fi

    # 4) go generate
    info "Running go generate"
    (cd "$OUT_DIR" && go generate -v -tags tools ./...)

    # 5) write extra package-specific files
    if [[ -n "${EXTRA_FILES_WRITER:-}" ]]; then
        info "Writing extra files via ${EXTRA_FILES_WRITER}"
        "${EXTRA_FILES_WRITER}" "$OUT_DIR" "$PKG_NAME" "$PKG_DESC"
    fi

    # 6) go mod tidy
    (cd "$OUT_DIR" && go mod tidy)
}

ensure_tooling() {
    command -v go >/dev/null 2>&1 || die "Go is required: https://go.dev/doc/install"
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
