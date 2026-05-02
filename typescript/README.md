# Open CU Services SDK for TypeScript

The `master` branch does not store source code of SDKs, instead code is stored
in the SDK branches and version tags:

- latest SDK branch: `typescript/<sdk-id>`, for example `typescript/lmsapi`
- versioned SDK tag: `typescript/<sdk-id>/v<version>`, for example
  `typescript/lmsapi/v0.1.0`

## Available SDKs

- [CU LMS API (`lmsapi`)](#cu-lms-api-lmsapi)

### CU LMS API (`lmsapi`)

[![typescript/lmsapi latest tag badge](https://badgen.net/static/typescript%2Flmsapi/v0.1.0/3178C6)](https://github.com/cu-devs-collective/open-cu-services-sdk/tree/typescript/lmsapi/v0.1.0/typescript/lmsapi)

<!-- markdownlint-disable MD013-->
| Field                                       | Value                                                                                  |
| ------------------------------------------- | -------------------------------------------------------------------------------------- |
| SDK ID                                      | `lmsapi`                                                                               |
| Package name                                | `@cu-devs-collective/open-cu-services-lmsapi`                                          |
| Latest version                              | `0.1.0`                                                                                |
| TypeScript                                  | ![TypeScript 6.0.3](https://badgen.net/static/TypeScript/6.0.3/3178C6)                 |
| Package manager                             | ![pnpm 10.31.0](https://badgen.net/static/pnpm/10.31.0/F69220)                         |
| Published to [npm](https://www.npmjs.com/)  | ❌                                                                                     |
| Supports maintainer debug response loglines | ❌                                                                                     |
<!-- markdownlint-enable MD013-->

## Installation

**The package is not published to npm yet**. To install it from the repository tag,
use a package manager that supports git dependencies with a subdirectory path.

Recommended package manager is [`pnpm`](https://pnpm.io/).

Add the dependency to your `package.json`:

```json
{
  "dependencies": {
    "@cu-devs-collective/open-cu-services-lmsapi": "git+https://github.com/cu-devs-collective/open-cu-services-sdk#typescript/lmsapi/v0.1.0&path:/typescript/lmsapi"
  }
}
```

Then install dependencies:

```sh
pnpm install
```

See [`examples/typescript`](../examples/typescript) for runnable examples.

## Development

When working against a local checkout of a generated SDK branch or tag, use a
file dependency. **This works for `npm` and `pnpm`**:

```json
{
  "dependencies": {
    "@cu-devs-collective/open-cu-services-lmsapi": "file:../../typescript/lmsapi"
  }
}
```

Then install dependencies with your package manager:

```sh
# npm
npm install
# pnpm
pnpm install
```

This override only works when the checked-out ref contains the generated package
at `typescript/lmsapi`.

## Reporting Issues

Please read [Reporting Issues for Codegen Clients](https://github.com/cu-devs-collective/open-cu-services-sdk/blob/master/README.md#reporting-issues-for-codegen-clients)
and use the [Codegen client issue report template](https://github.com/cu-devs-collective/open-cu-services-sdk/issues/new?template=01-codegen_client_issue_report.yml)
for codegen client issues.
