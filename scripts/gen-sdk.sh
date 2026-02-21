#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Orchestrator for SDK generation scripts for languages.
# It contains NO language-specific logic.
# Each language owns its generation logic in scripts/gen-sdk-{lang}.sh.
# This script only selects which generator to run and forwards args.
#
# Usage:
#   gen-sdk.sh --help
#   gen-sdk.sh <lang> [-- <args...>]
#------------------------------------------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*" >&2; }

list_langs() {
    local f base lang found=0
    shopt -s nullglob
    for f in "${SCRIPT_DIR}"/gen-sdk-*.sh; do
        found=1
        base="$(basename "$f")"
        lang="${base#gen-sdk-}"
        lang="${lang%.sh}"
        echo "  - ${lang}"
    done
    shopt -u nullglob

    (( found )) || echo "  (none found)"
}

usage() {
  cat >&2 <<EOF
Usage:
  $(basename "$0") --help
  $(basename "$0") <lang> [-- <args...>]

Orchestrator for SDK generation scripts for languages.
Args are being forwarded to selected script.

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

    local -a passthru=()
    if [[ "${1:-}" == "--" ]]; then
        shift || true
    fi
    passthru=("$@")

    local script="${SCRIPT_DIR}/gen-sdk-${lang}.sh"
    [[ -f "$script" ]] || die "Unknown language '${lang}'"
    [[ -x "$script" ]] || die "Generator script is not executable: $script (try: chmod +x \"$script\")"

    if (( ${#passthru[@]} > 0 )); then
        exec "$script" "${passthru[@]}"
    else
        exec "$script"
    fi
}

main "$@"
