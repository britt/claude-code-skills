---
title: "Working on an Issue"
description: "A structured workflow for implementing GitHub issues with verification"
---

Implement a GitHub issue with a repeatable, verification-driven workflow.

This skill follows an intentionally repetitive loop: **Understand → Plan → Verify → Implement → Verify Again**. The goal is to reduce ambiguity, keep scope aligned to the issue, and make “done” verifiable.

### Installation

Add the marketplace and install this skill:

```bash
/plugin marketplace add britt/claude-code-skills
/plugin install britt/working-on-an-issue
```

Or install all skills at once:

```bash
/plugin install britt/claude-code-skills
```

## Compatibility

| Platform | Supported |
|----------|:---------:|
| Claude Code | ✓ |
| Claude.ai | |

## How to use it

Use this skill when:

- Asked to work on a GitHub issue
- Asked to implement an issue
- Given an issue URL or issue number

To start, provide the issue URL or number.

Before proceeding, confirm the pre-flight checklist:

- Issue URL or number obtained
- Repository cloned and on the correct branch
- `CLAUDE.md` exists (or run `setting-up-a-project` first)
- A developer is available for questions (or an async mode is explicitly agreed)

## Features

**A plan-first workflow with explicit approval**
Writes an implementation plan and saves it to `docs/plans/issue-<number>-plan.md`, then waits for approval before making changes.

**Verification is part of the process (twice)**
Creates a verification plan up front (via `writing-verification-plans`), then executes the verification plan again after implementation.

**Rules that reduce scope creep**
Requires clarification when requirements, acceptance criteria, or boundaries are ambiguous, and avoids inventing requirements that are not in the issue.

**Clear stop conditions**
When blocked, stops and uses `summoning-the-user` instead of guessing.

## Workflow

### 1. Read and understand the issue

Get the issue content via:

- GitHub CLI: `gh issue view <number>`
- Ask the developer to paste the issue content
- Use GitHub MCP tools if available

Clarify before proceeding:

- If requirements are ambiguous, ask specific questions
- If acceptance criteria are missing, propose them
- If scope is unclear, confirm boundaries

Do not assume or invent requirements not in the issue.

### 2. Write an implementation plan

Create a brief plan covering:

1. What changes are needed
2. Which files will be modified/created
3. Order of implementation
4. Risks or unknowns

Save it to `docs/plans/issue-<number>-plan.md` and get developer approval before proceeding.

### 3. Write a verification plan

Use the `writing-verification-plans` skill to create acceptance tests for the issue.

### 4. Implement

- Follow TDD practices if `TDD.rules.md` is present
- Commit after each logical change
- Pause and ask if unexpected complexity appears

### 5. Execute verification

Run the verification plan and report results using the verification log format from `writing-verification-plans`.
