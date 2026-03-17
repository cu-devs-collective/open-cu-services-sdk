#!/usr/bin/env bash
set -euo pipefail
#------------------------------------------------------------------------------
# Generate Dart SDKs from OpenAPI specs using swagger_dart_code_generator,
# build_runner and templates.
#
# Current spec to package mapping:
# - cu-lms -> open_cu_services_lmsapi
#------------------------------------------------------------------------------

# codegen versions
SWAGGER_DART_CODE_GENERATOR_VERSION="4.1.1"
BUILD_RUNNER_VERSION="2.12.2"
# dependencies version
CHOPPER_VERSION="8.5.0"
CHOPPER_GENERATOR_VERSION="8.6.0"
JSON_ANNOTATION_VERSION="4.11.0"
COLLECTION_VERSION="1.19.1"
JSON_SERIALIZABLE_VERSION="6.13.0"
HTTP_VERSION="1.6.0"
DART_SDK_VERSION=">=3.0.0 <4.0.0"

SPEC_KEYS_TO_GENERATE=(
    cu-lms
)

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SPEC_BASE="${ROOT_DIR}/spec"
OUT_BASE="${ROOT_DIR}/dart"
TEMPLATE_DIR="${ROOT_DIR}/gen/dart/templates"

die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*" >&2; }

resolve_spec() {
    local key="${1:-}"
    [[ -n "$key" ]] || die "Missing spec key"

    case "$key" in
        cu-lms)
            SPEC_PATH="${SPEC_BASE}/cu-lms/cu-lms.openapi.yaml"
            SDK_ID="lmsapi"
            PACKAGE_NAME="open_cu_services_${SDK_ID}"
            PACKAGE_DESC="Open CU Services LMS API Dart SDK"
            OUT_DIR="${OUT_BASE}/${SDK_ID}"
            LIBRARY_FILE="${PACKAGE_NAME}.dart"
            GENERATED_REL_PATH="generated/${SDK_ID}.swagger.dart"
            EXTRA_FILES_WRITER="write_lmsapi_files"
            BASE_URL="https://my.centraluniversity.ru/api"
            USER_AGENT="Open-CU-Services/Dart"
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

write_pubspec_file() {
    local out_dir="$1"
    local file="${out_dir}/pubspec.yaml"
    local tmpl="${TEMPLATE_DIR}/common/pubspec.yaml.tmpl"

    render_template "$tmpl" "$file" <<EOF
PackageName: $(yaml_escape "$PACKAGE_NAME")
PackageDescription: $(yaml_escape "$PACKAGE_DESC")
DartSdkVersion: $(yaml_escape "$DART_SDK_VERSION")
ChopperVersion: $(yaml_escape "$CHOPPER_VERSION")
CollectionVersion: $(yaml_escape "$COLLECTION_VERSION")
HttpVersion: $(yaml_escape "$HTTP_VERSION")
JsonAnnotationVersion: $(yaml_escape "$JSON_ANNOTATION_VERSION")
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

write_lmsapi_files() {
    local out_dir="$1"

    # TODO: write_lmsapi_files
}

sdk_generate() {
    local key="$1"

    info "Generating Dart SDK for: $key"
    info "  spec : $SPEC_PATH"
    info "  out  : $OUT_DIR"
    info "  pkg  : $PACKAGE_NAME"
    info "  swagger_dart_code_generator: $SWAGGER_DART_CODE_GENERATOR_VERSION"

    mkdir -p "$OUT_DIR"

    # 1) write package files
    write_pubspec_file "$OUT_DIR"
    write_gitignore_file "$OUT_DIR"
    write_analysis_options_file "$OUT_DIR"

    # 2) install pub dependencies
    info "Installing Dart dependencies"
    (cd "$OUT_DIR" && dart pub get)

    # 3) run swagger_dart_code_generator generation
    info "Running swagger_dart_code_generator generation"
    (cd "$OUT_DIR" && dart run build_runner build --delete-conflicting-outputs)

    # 4) write extra package-specific files
    if [[ -n "${EXTRA_FILES_WRITER:-}" ]]; then
        info "Writing extra files via ${EXTRA_FILES_WRITER}"
        "${EXTRA_FILES_WRITER}" "$OUT_DIR"
    fi
}

ensure_tooling() {
    command -v dart >/dev/null 2>&1 || die "Dart is required: https://dart.dev/get-dart"
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
