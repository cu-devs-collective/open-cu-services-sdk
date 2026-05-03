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

// TODO

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

// TODO

## Contributing

// TODO
