#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Fixups for the Dart SDK.
#
# Unfortunately, swagger_dart_code_generator needs a few pre/post codegen
# fixups for the generated SDKs.
#------------------------------------------------------------------------------

die() { echo "ERROR: $*" >&2; exit 1; }

ensure_fixups_tooling() {
    command -v yq >/dev/null 2>&1 || die "yq is required, run make install-tools-generate"
    command -v perl >/dev/null 2>&1 || die "perl is required"
}

run_precodegen_fixups() {
    local sdk_id="$1"
    local swagger_input_path="$2"

    case "$sdk_id" in
        lmsapi)
            # swagger_dart_code_generator does not resolve top-level schema aliases.
            yq -i \
                '.components.schemas.CourseSummaryByIdResponse = .components.schemas.CourseSummaryItem' \
                "$swagger_input_path"
            # shellcheck disable=SC2016
            yq -i \
                '.paths."/micro-lms/courses/{courseId}".get.responses."200".content."application/json".schema."$ref" = "#/components/schemas/CourseSummaryItem"' \
                "$swagger_input_path"
            ;;
        *) ;;
    esac
}

run_postcodegen_fixups() {
    local sdk_id="$1"
    local out_dir="$2"

    case "$sdk_id" in
        lmsapi)
            # Not needed for now!
            ;;
        *) ;;
    esac
}
