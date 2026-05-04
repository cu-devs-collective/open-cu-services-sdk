# Open CU Services SDK

**English** | [Русский](README.ru.md)

![OpenAPI](https://badgen.net/badge/icon/3.0.3/green?icon=openapiinitiative&label=OpenAPI)
[![API-RE](https://badgen.net/badge/icon/compliant/green?icon=https://raw.githubusercontent.com/API-RE/api-re-standard/refs/heads/master/assets/api-re-logo-white.svg&label=API-RE)](https://github.com/API-RE/api-re-standard)
![SDK Languages](https://badgen.net/static/SDK%20Languages/Go%20|%20TypeScript%20|%20Python%20|%20Dart/cyan)

[![CU LMS API Spec](https://badgen.net/static/CU%20LMS%20API%20Spec/v0.1.0/blue)](https://cu-devs-collective.github.io/open-cu-services-sdk/api-docs/?url=https://raw.githubusercontent.com/cu-devs-collective/open-cu-services-sdk/spec/lmsapi/v0.1.0/spec/lmsapi/lmsapi.re.openapi.yaml)

> OpenAPI specifications and clients for the CU Service APIs, reverse engineered
> for Open CU Services Project

## Table of contents

- [Project Goal](#project-goal)
- [Quick Start](#quick-start)
- [Available SDKs](#available-sdks)
- [Versioning](#versioning)
- [Reporting Issues for Codegen Clients](#reporting-issues-for-codegen-clients)
- [Repository Layout](#repository-layout)
- [Development](#development)
- [Contributing](#contributing)

## Project Goal

// TODO

## Quick Start

Pick an SDK implementation from the [Available SDKs](#available-sdks) and follow
its README for installation and usage.
See the [examples](./examples/) to learn how the SDKs are used in different
languages.

## Available SDKs

<!-- markdownlint-disable MD013 MD033 -->
| Name       | SDK ID   | Specification                                                                                                                                                                                                                                                                         | Implementations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ---------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| CU LMS API | `lmsapi` | [![Spec](https://badgen.net/static/Spec/v0.1.0/blue?icon=openapiinitiative)](https://cu-devs-collective.github.io/open-cu-services-sdk/api-docs/?url=https://raw.githubusercontent.com/cu-devs-collective/open-cu-services-sdk/spec/lmsapi/v0.1.0/spec/lmsapi/lmsapi.re.openapi.yaml) | [![Go](https://badgen.net/static/Go/v0.1.0/555?labelColor=00ADD8&icon=go)](./golang/README.md#cu-lms-api-lmsapi) <br> [![TypeScript](https://badgen.net/static/TypeScript/v0.1.0/555?labelColor=3178C6&icon=typescript)](./typescript/README.md#cu-lms-api-lmsapi) <br> [![Python](https://badgen.net/static/Python/v0.1.0/555?labelColor=3572A5&icon=python)](./python/README.md#cu-lms-api-lmsapi) <br> [![Dart](https://badgen.net/static/Dart/v0.1.0/555?labelColor=00B4AB&icon=dart)](./dart/README.md#cu-lms-api-lmsapi) |
<!-- markdownlint-enable MD013 MD033 -->

## Versioning

The project follows strict versioning conventions and naming principles for its
specifications and SDK [releases](https://github.com/cu-devs-collective/open-cu-services-sdk/releases),
ensuring reproducible builds and predictable updates.

### Specs and SDKs Versioning

[SemVer](https://semver.org/spec/v2.0.0.html) is used to version specs and SDKs.
Each version consists of 3 parts: `MAJOR.MINOR.PATCH`, for example `0.1.0`.

It is important to note that specification and SDK versions are related but may
not match exactly, as each serves a different purpose.

Changes in `MAJOR` and `MINOR` versions reflect updates to the specification and
are aligned with SDK versions:

<!-- markdownlint-disable MD013 -->
- `MAJOR` - global changes to the specification, such as reaching a stable release
- `MINOR` - new endpoints or significant changes to existing ones with possible renaming
<!-- markdownlint-enable MD013 -->

`PATCH` versions reflect smaller changes in either the specification or SDKs,
such as:

<!-- markdownlint-disable MD013 -->
- schema fixes within existing endpoints (including situations when API was changed on backend)
- SDK template or generation changes
<!-- markdownlint-enable MD013 -->

> [!WARNING]
> While the specification is not yet stable, `PATCH` updates may
> occasionally include breaking changes (for example changes to component names),
> although this is avoided whenever possible.

### Spec Components Naming

Effort is made to keep component names stable so that codegenerated SDK types
remain consistent. However, changes may occur in `MINOR` versions and, rarely,
in `PATCH` versions.

Since the API specifications are reverse engineered, changes to them may occur
at any time.

### Breaking changes

Breaking changes (like component renaming) are always documented on the
[Releases tab](https://github.com/cu-devs-collective/open-cu-services-sdk/releases)
in the corresponding section.

Breaking change expectation for release depends on the version increment:

- `MAJOR` - breaking changes are expected
- `MAJOR` - breaking changes are likely, but uncommon
- `MINOR` - breaking changes are rare

### Releases Versioning

Specifications and SDKs are released as tags in their respective branches.

#### Spec Release Versioning

Spec is released in `master` branch and is tagged as `spec/{SDK_ID}/v{VERSION}`,
where `SDK_ID` means SDK ID from the [Available SDKs](#available-sdks) and `VERSION`
is spec version. For example `spec/lmsapi/v0.1.0`.

> [!NOTE]
> On spec release, affected codegenerated SDKs are listed in the same release's
> description.
> As a result, separate GitHub releases are not created for every SDK tag.

#### Language SDK Release Versioning

SDK is released in its SDK branch `{LANG}/{SDK_ID}`, where `LANG` means matching
SDK language implementation. SDK is tagged as `{LANG}/{SDK_ID}/v{VERSION}`, where
`VERSION` is SDK version. For example `golang/lmsapi/v0.1.0`.

Expected `LANG` values for languages:

- Go: `golang`
- TypeScript: `typescript`
- Python: `python`
- Dart: `dart`

## Reporting Issues for Codegen Clients

**English** | [Русский](README.ru.md#как-сообщить-об-ошибках-в-кодосгенерированных-клиентах)

// TODO

## Repository Layout

This project is a monorepo with the following structure:

```text
.github/       GitHub CI workflows and repo automation
dart/          Dart SDKs output path for codegen
examples/      Runnable examples for SDKs in different languages
gen/           SDK codegen scripts, templates and pinned dependencies
golang/        Go SDKs output path for codegen
python/        Python SDKs output path for codegen
spec/          Reverse engineered OpenAPI specifications
tools/         Tools for codegen and patching
typescript/    TypeScript SDKs output path for codegen
```

## Development

You should have `Go 1.25` or later installed for local development.
`Python` is also required to install [pre-commit](https://pre-commit.com/#install).

Of course, for different language SDKs to generate, you'll also need their
required tooling. If any required tool is missing, the generation process
will print what needs to be installed.

Install local tooling:

```sh
make install-tools
```

Lint OpenAPI specs:

```sh
make lint-specs
```

Generate all SDKs:

```sh
make generate
```

Generate one SDK language by appending its `LANG` value [from list](#language-sdk-release-versioning):

```sh
make generate-golang
```

## Contributing

// TODO
