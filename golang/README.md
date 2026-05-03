# Open CU Services SDK for Go

The `master` branch does not store source code of SDKs, instead code is stored
in the SDK branches and version tags:

- latest SDK branch: `golang/<sdk-id>`, for example `golang/lmsapi`
- versioned SDK tag: `golang/<sdk-id>/v<version>`, for example
  `golang/lmsapi/v0.1.0`

## Available SDKs

- [CU LMS API (`lmsapi`)](#cu-lms-api-lmsapi)

### CU LMS API (`lmsapi`)

[![Latest Release](https://badgen.net/static/Latest%20Release/v0.1.0/orange)](https://github.com/cu-devs-collective/open-cu-services-sdk/tree/golang/lmsapi/v0.1.0/golang/lmsapi)
[![Spec](https://badgen.net/static/Spec/v0.1.0/blue)](https://cu-devs-collective.github.io/open-cu-services-sdk/api-docs/?url=https://raw.githubusercontent.com/cu-devs-collective/open-cu-services-sdk/spec/lmsapi/v0.1.0/spec/lmsapi/lmsapi.re.openapi.yaml)
[![Debug Response Support](https://badgen.net/static/Debug%20Response%20Support/v1/green)](https://github.com/cu-devs-collective/open-cu-services-sdk/blob/master/README.md#reporting-issues-for-codegen-clients)
[![License](https://badgen.net/badge/License/MIT/blue)](https://github.com/cu-devs-collective/open-cu-services-sdk/blob/master/LICENSE)

![Go](https://badgen.net/static/Go/1.25/00ADD8)
[![Go Reference](https://pkg.go.dev/badge/github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi.svg)](https://pkg.go.dev/github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi)

## Installation

Add the module to your Go project:

```bash
# Latest version
go get github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi@latest

# Tagged version
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
