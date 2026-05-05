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

Project started as a hobby of one student to reverse engineer CU LMS API
(because he enjoys to reverse engineer stuff in his free time).

Later, it became clear that many CU students were not satisfied with the quality
of the official LMS, as it is *not as good as it could be*. The community also
wanted tools that could improve their LMS experience and adapt it to their needs.

Research of such attempts was made to come to a conclusion, that those are not
suited to be named as production-grade foundations. Many relied heavily on
AI-generated logic: specifications were generated without strong typing guarantees
or comments, and client code was often not deterministic. This makes it difficult
for such tools to earn trust and be safely used by the university community.

This is not meant to blame anyone working on open-source alternatives. Instead,
those efforts are valuable and deserve thanks. They helped make the problem
clear: CU LMS is proprietary software with a closed API, and stabilizing
reverse engineered integrations is difficult for individual hobbyists.

That is why the Open CU Services Project was born: to provide an open effort for
stabilizing reverse engineered CU Services specifications and giving the CU developers
community reliable SDKs.

Developers should be able to build tools using SDKs instead of reverse
engineering the APIs themselves. Maintaining that reverse engineering layer is
the responsibility of this project.

SDKs are codegenerated (not to be confused with AI-generated) from reverse
engineered specs. This allows the project to provide deterministic and reliable
SDKs that can be considered production-grade.

Stability is the project's top priority, so client SDKs should not be expected
to support all available endpoints from the start.

## Quick Start

Pick an SDK implementation from the [Available SDKs](#available-sdks) and follow
its README for installation and usage.
See the [examples](./examples/) to learn how the SDKs are used in different
languages.

## Available SDKs

<!-- markdownlint-disable MD013 MD033 -->
| Name       | SDK ID   | Specification                                                                                                                                                                                                                                                                                | Implementations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ---------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CU LMS API | `lmsapi` | [![spec/lmsapi](https://badgen.net/static/Spec/v0.1.0/blue?icon=openapiinitiative)](https://cu-devs-collective.github.io/open-cu-services-sdk/api-docs/?url=https://raw.githubusercontent.com/cu-devs-collective/open-cu-services-sdk/spec/lmsapi/v0.1.0/spec/lmsapi/lmsapi.re.openapi.yaml) | [![golang/lmsapi](https://badgen.net/static/Go/v0.1.0/555?labelColor=00ADD8&icon=go)](./golang/README.md#cu-lms-api-lmsapi) <br> [![typescript/lmsapi](https://badgen.net/static/TypeScript/v0.1.0/555?labelColor=3178C6&icon=typescript)](./typescript/README.md#cu-lms-api-lmsapi) <br> [![python/lmsapi](https://badgen.net/static/Python/v0.1.0/555?labelColor=3572A5&icon=python)](./python/README.md#cu-lms-api-lmsapi) <br> [![dart/lmsapi](https://badgen.net/static/Dart/v0.1.0/555?labelColor=00B4AB&icon=dart)](./dart/README.md#cu-lms-api-lmsapi) |
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
- Periodic SDK dependency updates
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

Specifications are being reverse engineered independently and are not official
documentation. A significant effort is made to make them as close to the backend
API as OpenAPI standard allows.

Because of this, every SDK response is being validated against spec schemas.
This provides strong-typing for SDKs, but comes at a cost: even a small backend
API change breaks the whole response schema validation and cause the client to
return an error. This design is made on purpose to make invalid responses be
rejected entirely. This design may change in the future.

To reduce MTTD (Mean Time to Detect), MTTR (Mean Time to Resolution), and
TTM (Time to Market), this project has a feature named as *Debug Response Loglines*.
This feature is supported by some SDK implementations (you can find out on
corresponding SDK README for details).

**Debug Response Loglines** (or **Debug Response** for short) - are specially-crafted
logs that help maintainers inspect validation issues. They include SDK metadata,
the validation error, and the full response body. Only data required for validation
is included: no cookies or any other authentication data is stored. The logline
data is encrypted with the repository public key and can only be decrypted by maintainers.
This means you can safely include Debug Response Loglines in public issues.

Data shared through Debug Response Loglines is used only for fixing specification
issues and nothing else. Access to private keys is restricted to responsible maintainers.

Debug Response Logline is a string of the following format:
logline version prefix (like `log_v1_`) and continuous `base64url`-string appended.
For example: `log_v1_VGhpcyBpcyBhbiBleGFtcGxlIGxvbCwgYWN0dWFsIGxvZ2xpbmUgaXMgZW5jcnlwdGVk`.

> [!WARNING]
> If your client does not support Debug Responses, it is your responsibility to
> include the relevant log details and removing all sensitive information before
> posting logs publicly. This includes personal data and any private university
> data such as identificators.

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
[`pre-commit`](https://pre-commit.com/#install) is required to run some of the
validations, which requires `Python`. It is recommended to install `pre-commit`
with [`pipx`](https://pipx.pypa.io/stable/how-to/install-pipx/).

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

Run codegeneration of all SDKs:

```sh
make generate
```

Or codegenerate one SDK language at a time by appending its `LANG` value [from list](#language-sdk-release-versioning)
like this:

```sh
make generate-golang
```

## Contributing

Contributions are welcome for opening issues, adding features, OpenAPI spec fixes,
SDK generator improvements, examples and documentation.

If you would like to contribute, please read [CONTRIBUTING.md](CONTRIBUTING.md).
