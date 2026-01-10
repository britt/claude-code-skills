---
title: "Working on an Issue"
description: "A structured workflow for implementing GitHub issues with verification"
---

A structured workflow for implementing GitHub issues with verification.

**Core Principle:** Understand → Plan → Verify → Implement → Verify Again

## When to Use

- Asked to work on a GitHub issue
- Asked to implement an issue
- Provided an issue URL or number

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

## Pre-flight Checklist

Before starting:
- Issue URL or number obtained
- Repository cloned and on correct branch
- CLAUDE.md exists (or run `setting-up-a-project` first)
- Developer available for questions (or async mode agreed)

## The Process

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

Create a plan that covers:
1. What changes are needed
2. Which files will be modified/created
3. Order of implementation
4. Risks or unknowns

Save to `docs/plans/issue-<number>-plan.md` and get developer approval before proceeding.

### 3. Write a verification plan

Use the `writing-verification-plans` skill to create acceptance tests for the issue.

### 4. Implement

- Follow TDD practices if `TDD.rules.md` is present
- Commit after each logical change
- Pause and ask if unexpected complexity appears

### 5. Execute verification

Run the verification plan and report results using the verification log format from `writing-verification-plans`.

## Absolute Rules

- No assumptions: ask if anything is unclear
- No scope creep: only implement what’s specified
- Verification required: task is incomplete until verification passes or manual verification is confirmed
- Blocked = stop: if blocked, use the `summoning-the-user` skill
