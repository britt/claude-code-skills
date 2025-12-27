---
name: setting-up-a-project
description: Use when asked to setup a claude code project
---

# Setting up a Project

## Overview

Help Claude author a CLAUDE.md file that defines a project's purpose, development practices, and tech stack before scaffolding code.

**Core principle:** A well-configured project prevents rework and ensures consistency. Establishing guardrails upfront helps Claude Code work reliably, produce high-quality code, and avoid doom loops where code is written, broken, and rewritten repeatedly.

**Announce at start:** "I'm using the setting-up-a-project skill to establish project configuration before writing code."

## When to Use This Skill

Use this skill when:
- No CLAUDE.md exists in the project directory
- The user asks to set up a new project
- Starting work in a new or empty codebase

## Step 1: Define the Project Purpose

Use the `obra/brainstorming` skill to define the project. Once brainstorming is complete, read its output and extract:

- **Project name** and one-line description
- **Problem being solved** - what pain point or need does this address?

### If obra/brainstorming is not installed

Ask these questions directly:

1. **What should this project be called?** Get a name and brief description.
2. **What problem does this solve?** Understand the pain point, who experiences it, and why existing solutions are inadequate.
3. **How will it work?** Get a high-level explanation of the approach or mechanism.

### Output

Document the answers in CLAUDE.md under a `## Project Overview` section:

```markdown
## Project Overview

**[Project Name]**: [One-line description]

### Problem

[Description of the problem being solved]

### Approach

[High-level explanation of how the project solves the problem]
```

## Step 2: Define the Tech Stack

Ask the user about each of these areas. Even if something was mentioned during brainstorming, confirm it explicitly. Suggest sensible defaults based on the language/runtime.

### Questions to Ask

1. **Language and runtime** - What programming language? What version/runtime?
2. **Deployment target** - Where will this run? (CLI, web server, serverless, container, browser, etc.)
3. **Package manager** - How will dependencies be managed?
4. **Testing framework** - What will be used for TDD?
5. **Build tools** - How will the project be built/compiled?
6. **Linting and formatting** - What tools enforce code style?
7. **Key libraries** - Any specific libraries or frameworks required?
8. **Unique concerns** - Any other technical requirements specific to this project? (e.g., database, auth, external APIs)

### Suggested Defaults

When suggesting defaults, base them on the language:

| Language | Package Manager | Testing | Linting | Build |
|----------|-----------------|---------|---------|-------|
| TypeScript/Node.js | pnpm | Vitest | ESLint + Prettier | esbuild or tsc |
| Python | uv | pytest | Ruff | - |
| Go | go modules | go test | golangci-lint | go build |
| Rust | cargo | cargo test | clippy | cargo build |

Adjust suggestions based on deployment target and project needs.

### Output

Document in CLAUDE.md under a `## Tech Stack` section:

```markdown
## Tech Stack

- **Language**: [Language and version]
- **Runtime**: [Runtime environment]
- **Package Manager**: [Package manager]
- **Testing**: [Testing framework]
- **Linting**: [Linter and formatter]
- **Build**: [Build tool]
- **Key Libraries**: [List of essential libraries]
```

## Step 3: Establish the development practices

- Make sure to use ../../rules/TDD.rules.md for test driven development. Copy it's contents into CLAUDE.md
- Establish a verification plan. Verification is separate from unit testing or integration testing. It is acceptance testing in a real world scenario. This plan should be written to VERIFICATION_PLAN.md and linked in CLAUDE.md.

## Notes

- Use obra/brainstorming to define the project
- Specify the tech stack
- Establish TDD rules and development practices
- Define and write verification strategy