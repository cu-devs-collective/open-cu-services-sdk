# Open CU Services SDK for Dart

The `master` branch does not store source code of SDKs, instead code is stored
in the SDK branches and version tags:

- latest SDK branch: `dart/<sdk-id>`, for example `dart/lmsapi`
- versioned SDK tag: `dart/<sdk-id>/v<version>`, for example
  `dart/lmsapi/v0.1.0`

## Available SDKs

- [CU LMS API (`lmsapi`)](#cu-lms-api-lmsapi)

### CU LMS API (`lmsapi`)

[![Latest Release](https://badgen.net/static/Latest%20Release/v0.1.0/orange)](https://github.com/cu-devs-collective/open-cu-services-sdk/tree/dart/lmsapi/v0.1.0/dart/lmsapi)
[![Spec](https://badgen.net/static/Spec/v0.1.0/blue)](https://cu-devs-collective.github.io/open-cu-services-sdk/api-docs/?url=https://raw.githubusercontent.com/cu-devs-collective/open-cu-services-sdk/spec/lmsapi/v0.1.0/spec/lmsapi/lmsapi.re.openapi.yaml)
[![Debug Response Support](https://badgen.net/static/Debug%20Response%20Support/v2/green)](https://github.com/cu-devs-collective/open-cu-services-sdk/blob/master/README.md#reporting-issues-for-codegen-clients)
[![License](https://badgen.net/badge/License/MIT/blue)](https://github.com/cu-devs-collective/open-cu-services-sdk/blob/master/LICENSE)

![Dart SDK](https://badgen.net/static/Dart%20SDK/%5E3.11.0/00B4AB)

## Installation

Add the dependency to your `pubspec.yaml`:

```yaml
# Add to dependencies block in your pubspec.yaml
open_cu_services_lmsapi:
  git:
    url: https://github.com/cu-devs-collective/open-cu-services-sdk.git
    ref: dart/lmsapi/v0.1.0
    path: dart/lmsapi
```

Then fetch dependencies:

```sh
dart pub get
```

See [`examples/dart`](../examples/dart) for runnable examples.

## Development

When working against a local checkout of a generated SDK branch or tag, add a
path override to your `pubspec.yaml`:

```yaml
dependency_overrides:
  open_cu_services_lmsapi:
    path: ../../dart/lmsapi
```

This override only works when the checked-out ref contains the generated package
at `dart/lmsapi`.

## Reporting Issues

Please read [Reporting Issues for Codegen Clients](https://github.com/cu-devs-collective/open-cu-services-sdk/blob/master/README.md#reporting-issues-for-codegen-clients)
and use the [Codegen client issue report template](https://github.com/cu-devs-collective/open-cu-services-sdk/issues/new?template=01-codegen_client_issue_report.yml)
for codegen client issues.

**Please include the full `log_v2_` + base64url logline in your issue report.**
