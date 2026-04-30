#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Generate Dart SDKs from OpenAPI specs using swagger_dart_code_generator,
# build_runner and templates.
#
# Current spec to package mapping:
# - lmsapi -> open_cu_services_lmsapi
#------------------------------------------------------------------------------

SPEC_KEYS_TO_GENERATE=(
    lmsapi
)

SDK_GEN_LANGUAGE="Dart"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VERSION_MANIFEST="${ROOT_DIR}/gen/dart/version/pubspec.yaml"
SPEC_BASE="${ROOT_DIR}/spec"
OUT_BASE="${ROOT_DIR}/dart"
TEMPLATE_DIR="${ROOT_DIR}/gen/dart/templates"
FIXUPS_SCRIPT="${ROOT_DIR}/gen/dart/fixups.sh"
PUBLIC_KEY_HEX_FILE="${ROOT_DIR}/gen/_common/cert/2026-04-26/pub.hex"

# shellcheck source=gen/_common/sdk-gen-common.sh
source "${ROOT_DIR}/gen/_common/sdk-gen-common.sh"

# shellcheck source=gen/dart/fixups.sh
source "${FIXUPS_SCRIPT}"

load_versions() {
    load_version_manifest dart "$VERSION_MANIFEST" \
        SWAGGER_DART_CODE_GENERATOR_VERSION \
        BUILD_RUNNER_VERSION \
        CHOPPER_GENERATOR_VERSION \
        JSON_SERIALIZABLE_VERSION \
        DART_SDK_VERSION \
        ARCHIVE_VERSION \
        CHOPPER_VERSION \
        COLLECTION_VERSION \
        HTTP_VERSION \
        JSON_ANNOTATION_VERSION \
        SODIUM_VERSION
}

resolve_spec() {
    local key="${1:-}"
    [[ -n "$key" ]] || die "Missing spec key"

    case "$key" in
        lmsapi)
            SPEC_ID="lmsapi"
            SDK_ID="lmsapi"
            SDK_ID_SNAKE_CASE="lms_api"
            SPEC_PATH="${SPEC_BASE}/${SPEC_ID}/${SPEC_ID}.re.openapi.yaml"
            PACKAGE_NAME="open_cu_services_${SDK_ID}"
            PACKAGE_DESC="Open CU Services LMS API Dart SDK"
            OUT_DIR="${OUT_BASE}/${SDK_ID}"
            LIBRARY_FILE="${PACKAGE_NAME}.dart"
            SWAGGER_INPUT_PATH="${OUT_DIR}/lib/swaggers/${SDK_ID_SNAKE_CASE}.yaml"
            GENERATED_REL_PATH="generated/${SDK_ID_SNAKE_CASE}.swagger.dart"
            EXTRA_FILES_WRITER="write_${SDK_ID}_files"
            BASE_URL="https://my.centraluniversity.ru/api"
            USER_AGENT="Open-CU-Services/Dart"
            ;;
        *) die "Unknown spec key: '$key'";;
    esac
}

write_pubspec_file() {
    local out_dir="$1"

    local file="${out_dir}/pubspec.yaml"
    local tmpl="${TEMPLATE_DIR}/common/pubspec.yaml.tmpl"
    render_template "$tmpl" "$file" <<EOF
PackageName: $(yaml_escape "$PACKAGE_NAME")
PackageVersion: $(yaml_escape "$PACKAGE_VERSION")
SpecVersion: $(yaml_escape "$SPEC_VERSION")
SpecRef: $(yaml_escape "spec/${SDK_ID}/${SPEC_VERSION}")
PackageDescription: $(yaml_escape "$PACKAGE_DESC")
DartSdkVersion: $(yaml_escape "$DART_SDK_VERSION")
ArchiveVersion: $(yaml_escape "$ARCHIVE_VERSION")
ChopperVersion: $(yaml_escape "$CHOPPER_VERSION")
CollectionVersion: $(yaml_escape "$COLLECTION_VERSION")
HttpVersion: $(yaml_escape "$HTTP_VERSION")
JsonAnnotationVersion: $(yaml_escape "$JSON_ANNOTATION_VERSION")
SodiumVersion: $(yaml_escape "$SODIUM_VERSION")
BuildRunnerVersion: $(yaml_escape "$BUILD_RUNNER_VERSION")
ChopperGeneratorVersion: $(yaml_escape "$CHOPPER_GENERATOR_VERSION")
JsonSerializableVersion: $(yaml_escape "$JSON_SERIALIZABLE_VERSION")
SwaggerDartCodeGeneratorVersion: $(yaml_escape "$SWAGGER_DART_CODE_GENERATOR_VERSION")
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

write_analysis_options_file() {
    local out_dir="$1"

    local file="${out_dir}/analysis_options.yaml"
    local tmpl="${TEMPLATE_DIR}/common/analysis_options.yaml.tmpl"
    render_template "$tmpl" "$file" <<'EOF'
{}
EOF
}

write_build_config_file() {
    local out_dir="$1"

    local file="${out_dir}/build.yaml"
    local tmpl="${TEMPLATE_DIR}/common/build.yaml.tmpl"
    render_template "$tmpl" "$file" <<'EOF'
{}
EOF
}

write_library_file() {
    local out_dir="$1"

    local file="${out_dir}/lib/${LIBRARY_FILE}"
    local tmpl="${TEMPLATE_DIR}/common/library.dart.tmpl"
    local debug_response_library_path="debug_response.dart"
    render_template "$tmpl" "$file" <<EOF
GeneratedLibraryPath: $(yaml_escape "$GENERATED_REL_PATH")
DebugResponseLibraryPath: $(yaml_escape "$debug_response_library_path")
EOF
}

copy_swagger_input() {
    local out_dir="$1"

    mkdir -p "${out_dir}/lib/swaggers"
    cp "$SPEC_PATH" "$SWAGGER_INPUT_PATH"
}

write_lmsapi_files() {
    local out_dir="$1"

    [[ -f "$PUBLIC_KEY_HEX_FILE" ]] \
        || die "Public key not found: $PUBLIC_KEY_HEX_FILE"
    local public_key_hex
    public_key_hex="$(tr -d '[:space:]' < "$PUBLIC_KEY_HEX_FILE")"

    local debug_response_file="${out_dir}/lib/debug_response.dart"
    local debug_response_tmpl="${TEMPLATE_DIR}/common/debug_response.dart.tmpl"
    render_template "$debug_response_tmpl" "$debug_response_file" <<EOF
DebugResponsePublicKeyHex: $(yaml_escape "$public_key_hex")
EOF

    local defaults_file="${out_dir}/lib/defaults.dart"
    local defaults_tmpl="${TEMPLATE_DIR}/lmsapi/defaults.dart.tmpl"
    render_template "$defaults_tmpl" "$defaults_file" <<EOF
BaseURL: $(yaml_escape "$BASE_URL")
UserAgent: $(yaml_escape "$USER_AGENT")
PackageVersion: $(yaml_escape "$PACKAGE_VERSION")
SpecVersion: $(yaml_escape "$SPEC_VERSION")
$(emit_defaults_template_data "$SDK_ID")
EOF
}

verify_sdk() {
    local out_dir="$1"

    if [[ "${VERIFY_SDK:-1}" == "0" ]]; then
        info "Skipping Dart SDK verification"
        return
    fi

    info "Verifying Dart SDK"
    (cd "$out_dir" && dart analyze)
}

sdk_generate() {
    local key="$1"

    info "Generating Dart SDK for: $key"
    info "  spec : $SPEC_PATH"
    info "  out  : $OUT_DIR"
    info "  pkg  : $PACKAGE_NAME"
    info "  sdk  : $PACKAGE_VERSION"
    info "  spec : $SPEC_VERSION"
    info "  swagger_dart_code_generator: $SWAGGER_DART_CODE_GENERATOR_VERSION"

    mkdir -p "$OUT_DIR"

    # 1) write package files
    write_pubspec_file "$OUT_DIR"
    write_gitignore_file "$OUT_DIR"
    write_analysis_options_file "$OUT_DIR"
    write_build_config_file "$OUT_DIR"
    write_library_file "$OUT_DIR"
    copy_swagger_input "$OUT_DIR"

    # 2) write extra package-specific files
    if [[ -n "${EXTRA_FILES_WRITER:-}" ]]; then
        info "Writing extra files via ${EXTRA_FILES_WRITER}"
        "${EXTRA_FILES_WRITER}" "$OUT_DIR"
    fi

    # 3) run precodegen fixups
    run_precodegen_fixups "$SDK_ID" "$SWAGGER_INPUT_PATH"

    # 4) install pub dependencies
    info "Installing Dart dependencies"
    (cd "$OUT_DIR" && dart pub get)

    # 5) run swagger_dart_code_generator generation
    info "Cleaning previous build_runner state"
    (cd "$OUT_DIR" && dart run build_runner clean)
    info "Running swagger_dart_code_generator generation"
    (cd "$OUT_DIR" && dart run build_runner build --delete-conflicting-outputs)

    # 6) run postcodegen fixups
    run_postcodegen_fixups "$SDK_ID" "$OUT_DIR"

    # 7) dart format
    (cd "$OUT_DIR" && dart format . >/dev/null)

    # 8) verify generated package
    verify_sdk "$OUT_DIR"
}

ensure_tooling() {
    command -v dart >/dev/null 2>&1 || die "Dart is required: https://dart.dev/get-dart"
    command -v yq >/dev/null 2>&1 || die "yq is required, run make install-tools-generate"
    command -v gomplate >/dev/null 2>&1 || die "gomplate is required, run make install-tools-generate"
    command -v parseversions >/dev/null 2>&1 || die "parseversions is required, run make install-tools-generate"
    ensure_fixups_tooling
}

sdk_gen_main "$@"
