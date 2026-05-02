# Open CU Services SDK for Dart

The `master` branch does not store source code of SDKs, instead code is stored
in the SDK branches and version tags:

- latest SDK branch: `dart/<sdk-id>`, for example `dart/lmsapi`
- versioned SDK tag: `dart/<sdk-id>/v<version>`, for example
  `dart/lmsapi/v0.1.0`

## Available SDKs

- [CU LMS API (`lmsapi`)](#cu-lms-api-lmsapi)

### CU LMS API (`lmsapi`)

[![dart/lmsapi latest tag badge](https://badgen.net/static/dart%2Flmsapi/v0.1.0/00B4AB)](https://github.com/cu-devs-collective/open-cu-services-sdk/tree/dart/lmsapi/v0.1.0/dart/lmsapi)

<!-- markdownlint-disable MD013-->
| Field                                       | Value                                                                      |
| ------------------------------------------- | -------------------------------------------------------------------------- |
| SDK ID                                      | `lmsapi`                                                                   |
| Package name                                | `open_cu_services_lmsapi`                                                  |
| Latest version                              | `0.1.0`                                                                    |
| Dart SDK                                    | ![Dart SDK ^3.11.0](https://badgen.net/static/Dart%20SDK/%5E3.11.0/0175C2) |
| Published to [pub](https://pub.dev/)        | ❌                                                                         |
| Supports maintainer debug response loglines | ✅                                                                         |
| Maintainer debug response logline prefix    | `log_v2_`                                                                  |
<!-- markdownlint-enable MD013-->

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
