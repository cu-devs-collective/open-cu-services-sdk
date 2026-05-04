#!/usr/bin/env bash
#------------------------------------------------------------------------------
# Shared helpers for SDK generation scripts for languages.
#------------------------------------------------------------------------------

if [[ "${SDK_GEN_COMMON_SH_LOADED:-0}" == "1" ]]; then
    return 0
fi
SDK_GEN_COMMON_SH_LOADED=1

die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*" >&2; }

indent2() { printf '%*s' 2 ''; }

sdk_gen_usage() {
    local language="${SDK_GEN_LANGUAGE:-SDK}"

    cat >&2 <<EOF
Usage:
$(indent2)$(basename "$0") [--sdk-id <id> ...]

Generate ${language} SDKs.

Options:
$(indent2)--sdk-id <id>       Run SDK generation only for specified SDK ID. Argument can be repeated.
$(indent2)-h, --help          Show this help.

Default SDK IDs:
$(indent2)${SPEC_KEYS_TO_GENERATE[*]}
EOF
}

parse_sdk_gen_args() {
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
                sdk_gen_usage
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

load_version_manifest() {
    local language="$1"
    local version_manifest="$2"
    shift 2

    [[ -f "$version_manifest" ]] || die "Version manifest not found: $version_manifest"

    local versions_data
    versions_data="$(parseversions export "$language" "$version_manifest")" \
        || die "Failed to parse versions from $version_manifest"
    eval "$versions_data"

    local var_name
    for var_name in "$@"; do
        [[ -n "${!var_name:-}" ]] || die "Missing $var_name"
    done
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
    mkdir -p "$(dirname "$out_path")"
    gomplate -f "$tmpl_path" -o "$out_path" -c ".=stdin:///data.yaml"
}

sdk_gen_main() {
    parse_sdk_gen_args "$@"
    ensure_tooling
    load_versions

    PACKAGE_VERSION="${PACKAGE_VERSION:-0.0.0}"

    local key
    for key in "${SPEC_KEYS_TO_GENERATE[@]}"; do
        resolve_spec "$key"
        local spec_path="${SPEC_PATH:-}"
        [[ -f "$spec_path" ]] || die "Spec not found for '$key': $spec_path"
        # SPEC_VERSION is used by language-specific functions called in sdk_generate.
        # shellcheck disable=SC2034
        SPEC_VERSION="$(read_spec_version "$spec_path")"
        sdk_generate "$key"
    done
}
