# Contributing

**English** | [Русский](CONTRIBUTING.ru.md)

Thank you for your interest in contributing to the **Open CU Services Project**!

This guide explains how to contribute to this repository.
It is intended for anyone who wants to open an **Issue** or **Pull Request**.

> [!NOTE]
> Please take some time to read this document. It may save both your time and the
> maintainers' time in the future.
>
> Thank you! 🤝

## Before You Start

Before starting to work on a feature or a bug fix, please comment on a relevant
**Issue**, open a new one or [discuss with us on Telegram](https://t.me/cu_devs_collective_chat).

### Security Vulnerabilities

Do not open a public Issue to report about a security vulnerability.
Please follow our [Security Policy](SECURITY.md) and report responsibly.

### AI-assisted Contributions

If you use AI tools when contributing, please see our [AI Policy](AI_POLICY.md),
this is important.

### Additional Help

If you run any trouble, reach out with our [community on Telegram](https://t.me/cu_devs_collective_chat).

## Opening an Issue

You can choose to use English or Russian to write and comment Issues.

Please use the [Issues search](https://github.com/cu-devs-collective/open-cu-services-sdk/issues?q=is%3Aissue)
functionality to make sure that you are not submitting duplicates, and that a
similar report or request has not already been resolved or rejected.

Create a new issue by using [one of these templates](https://github.com/cu-devs-collective/open-cu-services-sdk/issues/new/choose).

## Setup Development Environment

General development requirements, git validation hooks setup and codegeneration
commands are documented in [Development section](README.md#development).

If you use VS Code as your code editor, it is recommended to open the
project there and install recommended extensions from `.vscode/extensions.json`.

For other code editors, check if `EditorConfig` is [supported by default](https://editorconfig.org/#pre-installed),
or if it [requires a plugin](https://editorconfig.org/#download) for it.
VS Code support is included in the recommended extensions.

Install pre-commit hooks:

```bash
pre-commit install
```

`markdownlint` is used to lint Markdown files, but it requires `Node`,
so its installation is optional. `markdownlint` can be installed automatically
by `pre-commit` when running documentation lints:

```bash
make lint-docs
```

## Making Changes

The project uses [Conventional Commits](https://www.conventionalcommits.org) for
commit messages. Please read its guide if you are not familiar with it.

Please note that `feat` and `fix` commit types are for actual code changes that
affect logic.

### Code Change Guidelines

Only English is allowed in code and comments, specifically American English
spelling (for example "color" and not "colour").

Russian is allowed only when working with data that is Russian by nature, for
example for filtering courses by their Russian names.

Code changes should be scoped to the issue or feature you are working on.

When changing codegen code or templates, you should run generation and review
the generated diff before opening a Pull Request.

Your code must not contain any private university data or personal data.

### Specs Change Guidelines

When editing specifications, follow these rules:

- Use English for descriptions and comments. Russian may be used only for
  example values.
- Versioning metadata like `info.version` should not be changed manually, as it
  is intended to be updated by the releaser.
- Choose stable `operationId` values and component names, as those become
  codegenerated SDK function and type names.
- Schemas should be modeled as precisely as possible to match the backend logic.
  Field order, required fields, nullability, enums and other shapes should be
  specified in the specification.
- Always add useful descriptions for endpoints and responses. For schemas, add
  a description when the object is not obvious.
- [API-RE Standard](https://github.com/API-RE/api-re-standard) should be used
  for adding Reverse Engineering (RE) metadata. RE metadata should be added when
  it explains observations, confidence, or notes about an object.
- Schema shape must be based **ONLY on observations** of seen data, not on
  assumptions. After creating a shape, you should carefully validate it against
  seen responses or test it against multiple responses to confirm that it is valid.

Specifications are carefully crafted to guarantee their observations-based origin,
while also allowing other developers to use them as unofficial documentation.
Because of that, reverse engineering of specs is not a fast process and requires
significant experience.

If you are not an experienced reverse engineer, it is recommended **not** to contribute
to specifications, as there is a high chance that such contributions will not be
accepted.

### Documentation Change Guidelines

Unlike code, some of the documentation is also written separately in Russian.
Russian versions use the `ru.md` extension.

It is worth noting that **not all documentation files are duplicated in Russian**.
The only files that do follow this are the ones found in the project root,
that can be came across by people who are not comfortable reading in English,
(`README.md`, `CONTRIBUTING.md`, `AI_POLICY.md`, but for example not `SECURITY.md`).

All other documentation should be written in English only, as English is the main
language of the project. We understand that this may sound unusual, as most
project users are native Russian speakers. However, this strong decision is made
to keep the repository consistent and easier to maintain.

If you update English documentation and a Russian duplicate exists, please update
the Russian version as well if you can. If not, mention the missing translation
in your Pull Request.

Russian duplicate versions should stay consistent with the original English versions
and should be translated naturally (not machine-translated), so that they can be
understood without reading the original version.

### Submitting Changes

// TODO
