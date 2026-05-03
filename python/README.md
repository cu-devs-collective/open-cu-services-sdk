# Open CU Services SDK for Python

The `master` branch does not store source code of SDKs, instead code is stored
in the SDK branches and version tags:

- latest SDK branch: `python/<sdk-id>`, for example `python/lmsapi`
- versioned SDK tag: `python/<sdk-id>/v<version>`, for example
  `python/lmsapi/v0.1.0`

## Available SDKs

- [CU LMS API (`lmsapi`)](#cu-lms-api-lmsapi)

### CU LMS API (`lmsapi`)

[![Latest Release](https://badgen.net/static/Latest%20Release/0.1.0/orange)](https://github.com/cu-devs-collective/open-cu-services-sdk/tree/python/lmsapi/v0.1.0/python/lmsapi)
[![Spec](https://badgen.net/static/Spec/v0.1.0/blue)](https://cu-devs-collective.github.io/open-cu-services-sdk/api-docs/?url=https://raw.githubusercontent.com/cu-devs-collective/open-cu-services-sdk/spec/lmsapi/v0.1.0/spec/lmsapi/lmsapi.re.openapi.yaml)
[![Debug Response Support](https://badgen.net/static/Debug%20Response%20Support/no/red)](https://github.com/cu-devs-collective/open-cu-services-sdk/blob/master/README.md#reporting-issues-for-codegen-clients)
[![License MIT](https://badgen.net/badge/License/MIT/blue)](https://github.com/cu-devs-collective/open-cu-services-sdk/blob/master/LICENSE)

![Python >=3.10](https://badgen.net/static/Python/%3E%3D3.10/3572A5)

## Installation

### Install with pip

Install with `pip`:

```bash
pip install "open-cu-services-lmsapi @ git+https://github.com/cu-devs-collective/open-cu-services-sdk.git@python/lmsapi/v0.1.0#subdirectory=python/lmsapi"
```

Or add to `requirements.txt`:

```txt
open-cu-services-lmsapi @ git+https://github.com/cu-devs-collective/open-cu-services-sdk.git@python/lmsapi/v0.1.0#subdirectory=python/lmsapi
```

### Install with package manager

Add the dependency to your `pyproject.toml`:

```toml
dependencies = [
  "open-cu-services-lmsapi @ git+https://github.com/cu-devs-collective/open-cu-services-sdk.git@python/lmsapi/v0.1.0#subdirectory=python/lmsapi"
]
```

When using a package manager like `uv` or `poetry`, you can define the source
explicitly:

<!-- markdownlint-disable MD013-->
```toml
# uv
[tool.uv.sources]
open-cu-services-lmsapi = { git = "https://github.com/cu-devs-collective/open-cu-services-sdk", tag = "python/lmsapi/v0.1.0", subdirectory = "python/lmsapi" }

# poetry
[tool.poetry.dependencies]
open-cu-services-lmsapi = { git = "https://github.com/cu-devs-collective/open-cu-services-sdk", tag = "python/lmsapi/v0.1.0", subdirectory = "python/lmsapi" }
```
<!-- markdownlint-enable MD013-->

See [`examples/python`](../examples/python) for runnable examples.

## Development

When working against a local checkout of a generated SDK branch or tag, add a
local source override in your `pyproject.toml`.
`pip` does not support dependency source overrides in `pyproject.toml`, instead
use a package manager like `uv` or `poetry`:

```toml
# uv
[tool.uv.sources]
open-cu-services-lmsapi = { path = "../../python/lmsapi" }

# poetry
[tool.poetry.dependencies]
open-cu-services-lmsapi = { path = "../../python/lmsapi", develop = true }
```

For direct local testing with `pip`, install the generated package path into
your virtual environment:

```bash
pip install -e ../../python/lmsapi
```

This override only works when the checked-out ref contains the generated package
at `python/lmsapi`.

## Reporting Issues

Please read [Reporting Issues for Codegen Clients](https://github.com/cu-devs-collective/open-cu-services-sdk/blob/master/README.md#reporting-issues-for-codegen-clients)
and use the [Codegen client issue report template](https://github.com/cu-devs-collective/open-cu-services-sdk/issues/new?template=01-codegen_client_issue_report.yml)
for codegen client issues.
