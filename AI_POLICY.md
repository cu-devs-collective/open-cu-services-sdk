# AI Usage Policy

**English** | [Русский](AI_POLICY.ru.md)

This policy sets clear expectations for AI-assisted contributions. It should
not be interpreted as anti-AI statement: nowadays, most developers use AI tools
in their daily workflows, and we suggest you to do the same. AI can help with
learning, exploring and testing implementation ideas.

**AI-assisted contributions are welcome** - however, the human contributor is
always accountable for every line submitted.

## Why this policy exists

Today, AI tools make it easy for anyone to generate and submit large amounts
of code. Unfortunately, most AI agents do not reliably produce code that meets
this project's quality standards. This is why human review and ownership are
required.

Reviewing contributions is a time-consuming for maintainers, so this policy
exists to protect both maintainers' time and the community's interest in
keeping the project healthy.

## Contribution Guidelines

1. **You must fully understand all content and changes that you submit and**
   **be able to explain them. This rule applies to Issues and Pull Requests.**
    We want that you use AI tools responsibly and understand your changes.
2. **Use a full Human-in-the-Loop approach for contribution to meet**
   **the project's quality standards.**
    It is human contributor's responsibility to submit high-quality contributions.
3. **Disclose significant AI involvement.**
    If AI tools played a major role in producing your contribution, say so in the
    description. **Disclosure is not a penalty**: it provides transparency and helps
    reviewers calibrate their attention. Disclosure will not reduce the likelihood
    of your Issue or Pull Request being accepted.
4. **For any AI-assisted changes to specifications, use `generated` RE metadata.**
    API-RE Standard supports describing AI-generated content.
    Ask the AI agent to set the `components/generators` and use `generated`
    RE metadata for all new schema objects added by AI. This helps identify
    which schema objects have not yet been reviewed by a human.
