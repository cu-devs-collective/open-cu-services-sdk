#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Generate Go SDK using ogen + go generate.
#------------------------------------------------------------------------------

OGEN_VERSION="v1.19.0"
SPEC_KEYS_TO_GENERATE=(
    cu-lms
)

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SPEC_BASE="${ROOT_DIR}/spec"
MODULE_BASE="github.com/cu-club/cu-open-lms-openapi/golang"

die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*" >&2; }

resolve_spec() {
    local key="${1:-}"
    [[ -n "$key" ]] || die "Missing spec key"

    case "$key" in
        cu-lms)
            SPEC_PATH="${SPEC_BASE}/cu-lms/cu-lms.openapi.yaml"
            PKG_NAME="lmsapi"
            OUT_DIR="${ROOT_DIR}/golang/${PKG_NAME}"
            MODULE_PATH="${MODULE_BASE}/${PKG_NAME}"
            ;;
        *) die "Unknown spec key: '$key'";;
    esac
}

sed_inplace() {
    local expr="$1" file="$2"
    if [[ "${OSTYPE:-}" == darwin* ]]; then
        sed -i '' -e "$expr" "$file"
    else
        sed -i -e "$expr" "$file"
    fi
}

write_gen_file() {
    local out_dir="$1"
    local pkg="$2"
    local spec_rel="$3"
    local file="${out_dir}/gen_sdk.go"

    cat > "$file" <<EOF
package ${pkg}

import _ "github.com/ogen-go/ogen"

//go:generate go run github.com/ogen-go/ogen/cmd/ogen@${OGEN_VERSION} --target . --package ${pkg} --clean ${spec_rel}
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
    local spec_rel="../../spec/${SPEC_PATH#${SPEC_BASE}/}"
    if [[ ! -f "${OUT_DIR}/go.mod" ]]; then
        info "Initializing go.mod"
        (cd "$OUT_DIR" && go mod init "$MODULE_PATH")
    else
        info "go.mod exists, skipping go mod init"
    fi

    # 2) go get ogen@version
    (cd "$OUT_DIR" && go get "github.com/ogen-go/ogen@${OGEN_VERSION}")

    # 3) write/update gen_sdk.go
    local gen_file="${OUT_DIR}/gen_sdk.go"
    if [[ ! -f "$gen_file" ]]; then
        info "Writing ${gen_file}"
        write_gen_file "$OUT_DIR" "$PKG_NAME" "$spec_rel"
    else
        local current_ver
        current_ver="$(extract_ogen_version_from_file "$gen_file")"

        if [[ -z "$current_ver" ]]; then
            info "gen_sdk.go has no recognizable ogen version, rewriting file"
            write_gen_file "$OUT_DIR" "$PKG_NAME" "$spec_rel"
        elif [[ "$current_ver" != "$OGEN_VERSION" ]]; then
            info "Updating ogen version in gen_sdk.go: ${current_ver} -> ${OGEN_VERSION}"
            sed_inplace "s#\(github\\.com/ogen-go/ogen/cmd/ogen@\)[^[:space:]]\\+#\\1${OGEN_VERSION}#g" "$gen_file"
        else
            info "No ogen version change (${OGEN_VERSION})"
        fi
    fi

    # 4) go generate
    info "Running go generate"
    (cd "$OUT_DIR" && go generate -v ./...)

    # 5) go mod tidy
    (cd "$OUT_DIR" && go mod tidy)
}

main() {
    command -v go >/dev/null 2>&1 || die "Go is required: https://go.dev/doc/install"

    local key
    for key in "${SPEC_KEYS_TO_GENERATE[@]}"; do
        resolve_spec "$key"
        [[ -f "$SPEC_PATH" ]] || die "Spec not found for '$key': $SPEC_PATH"
        sdk_generate "$key"
    done
}

main "$@"
