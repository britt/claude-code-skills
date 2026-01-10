---
title: "Working on an Issue"
description: "A structured workflow for implementing GitHub issues with verification"
---

Use this skill when asked to work on, read, or implement a GitHub issue.

The workflow is intentionally repetitive: **Understand → Plan → Verify → Implement → Verify Again**.

## Installation

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
- Provided an issue URL or number

To start, provide the issue URL or number. The skill’s pre-flight checklist requires:
- Issue URL or number obtained
- Repository cloned and on correct branch
- `CLAUDE.md` exists (or run `setting-up-a-project` first)
- Developer available for questions (or async mode agreed)

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

## Features and benefits

**Forces early clarity**
Starts by reading the issue and explicitly clarifying ambiguity, missing acceptance criteria, or unclear scope.

**Plan-first, with explicit approval**
Requires an implementation plan saved to `docs/plans/issue-<number>-plan.md` and developer approval before changes begin.

**Verification is part of the workflow (twice)**
Creates a verification plan up front, then runs verification after implementation.

**Controls risk and scope**
Uses explicit rules like “no assumptions” and “no scope creep” to keep work aligned to the issue.

**Clear stop conditions**
If blocked, stop and use the `summoning-the-user` skill rather than guessing.
