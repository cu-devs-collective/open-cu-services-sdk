# Open CU Services SDK for Go

The `master` branch does not store source code of SDKs, instead code is stored
in the SDK branches and version tags:

- latest SDK branch: `golang/<sdk-id>`, for example `golang/lmsapi`
- versioned SDK tag: `golang/<sdk-id>/v<version>`, for example
  `golang/lmsapi/v0.1.0`

## Available SDKs

- [CU LMS API (`lmsapi`)](#cu-lms-api-lmsapi)

### CU LMS API (`lmsapi`)

[![golang/lmsapi latest tag badge](https://badgen.net/static/golang%2Flmsapi/v0.1.0/00ADD8)](https://github.com/cu-devs-collective/open-cu-services-sdk/tree/golang/lmsapi/v0.1.0/golang/lmsapi)

<!-- markdownlint-disable MD013-->
| Field                                       | Value                                                              |
| ------------------------------------------- | ------------------------------------------------------------------ |
| SDK ID                                      | `lmsapi`                                                           |
| Module path                                 | `github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi` |
| Latest version                              | `v0.1.0`                                                           |
| Go                                          | ![Go 1.25.0](https://badgen.net/static/Go/1.25.0/00ADD8)           |
| Published as Go module                      | ✅                                                                 |
| Supports maintainer debug response loglines | ✅                                                                 |
| Maintainer debug response logline prefix    | `log_v1_`                                                          |
<!-- markdownlint-enable MD013-->

## Installation

Add the module to your Go project:

```bash
go get github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi@v0.1.0
```

See [`examples/golang`](../examples/golang) for runnable examples.

## Development

When working against a local checkout of a generated SDK branch or tag, add a
replace directive to your `go.mod`:

```go
replace github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi => ../../golang/lmsapi
```

This override only works when the checked-out ref contains the generated module
at `golang/lmsapi`.

## Reporting Issues

Please read [Reporting Issues for Codegen Clients](https://github.com/cu-devs-collective/open-cu-services-sdk/blob/master/README.md#reporting-issues-for-codegen-clients)
and use the [Codegen client issue report template](https://github.com/cu-devs-collective/open-cu-services-sdk/issues/new?template=01-codegen_client_issue_report.yml)
for codegen client issues.

**Please include the full `log_v1_` + base64url logline in your issue report.**
