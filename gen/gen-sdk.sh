#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Orchestrator for SDK generation scripts for languages.
# It contains NO language-specific logic.
# Each language owns its generation logic in gen/<lang>/gen-sdk-<lang>.sh.
# This script only selects which generator to run and forwards args.
#
# Usage:
#   gen-sdk.sh --help
#   gen-sdk.sh <lang> [-- <generator-args...>]
#------------------------------------------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*" >&2; }

list_langs() {
    local d found=0
    shopt -s nullglob
    for d in "${SCRIPT_DIR}"/*; do
        [[ -d "$d" ]] || continue
        local lang
        lang="$(basename "$d")"
        [[ "$lang" != _* ]] || continue
        [[ -f "${d}/gen-sdk-${lang}.sh" ]] || continue
        found=1
        echo "  - ${lang}"
    done
    shopt -u nullglob

    (( found )) || echo "  (none found)"
}

indent2() { printf '%*s' 2 ''; }

usage() {
    cat >&2 <<EOF
Usage:
$(indent2)$(basename "$0") --help
$(indent2)$(basename "$0") <lang> [-- <generator-args...>]

Orchestrator for SDK generation scripts for languages.
Args are being forwarded to selected script.

Common generator args:
$(indent2)--sdk-id <id>       Run SDK generation only for specified SDK ID. Argument can be repeated.

Available languages:
$(list_langs)
EOF
}

main() {
    if [[ $# -eq 0 ]]; then
        usage
        exit 2
    fi

    case "${1:-}" in
        -h|--help) usage; exit 0;;
    esac

    local lang="$1"
    shift || true
    [[ "$lang" != _* ]] || die "'${lang}' is treated as special directory and is not supported for generation"

    local -a passthru=()
    if [[ "${1:-}" == "--" ]]; then
        shift || true
    fi
    passthru=("$@")

    local script="${SCRIPT_DIR}/${lang}/gen-sdk-${lang}.sh"
    [[ -f "$script" ]] || die "Language '${lang}' is not supported for generation"
    [[ -x "$script" ]] || die "Generator script is not executable: $script (try: chmod +x \"$script\")"

    if (( ${#passthru[@]} > 0 )); then
        exec "$script" "${passthru[@]}"
    else
        exec "$script"
    fi
}

main "$@"
