---
name: using-claude-code-with-tdd-and-verification-plans
description: How to set up Claude Code with strict TDD rules and verification plans so it can work with minimal intervention
---

# How I use Claude Code with TDD and verification plans

This guide explains how to set up Claude Code so it can help with real development work while staying disciplined.

The process relies on three pieces working together:

- A strict TDD rule set in `rules/TDD.rules.md`
- The `setting-up-a-project` skill
- The `writing-verification-plans` skill

The goal is simple: Claude should never ship code without tests first, and it should never call a task complete until it proves the code works in a realistic environment.

## Start by setting up the project

Begin with the `setting-up-a-project` skill.

That skill has one job: help Claude create a CLAUDE.md file that defines what the project is, how it is built and tested, and how Claude is expected to work.

From the skill file:

> Help Claude author a CLAUDE.md file that defines a project's purpose, development practices, and tech stack before scaffolding code.

The skill walks Claude through three main areas:

1. Project overview
2. Tech stack
3. Development practices

### Project overview

Claude asks questions (directly or through `obra/brainstorming`) to fill out a `## Project Overview` section in CLAUDE.md:

```markdown
## Project Overview

**[Project Name]**: [One-line description]

### Problem

[Description of the problem being solved]

### Approach

[High-level explanation of how the project solves the problem]
```

This forces you and Claude to agree on what the project is for before any code exists.

### Tech stack

Next, the skill has Claude confirm the language, runtime, testing tools, build tools, and linting.

From the skill:

> Ask the user about each of these areas. Even if something was mentioned during brainstorming, confirm it explicitly.

Claude then records the answers in a `## Tech Stack` section in CLAUDE.md:

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

This matters because the TDD rules and verification plan both assume there is a clear way to run tests, build the project, and check linting.

## Make TDD non‑negotiable

The `setting-up-a-project` skill makes TDD mandatory by copying the full contents of `rules/TDD.rules.md` into CLAUDE.md:

> Read the contents of `@rules/TDD.rules.md` and copy it verbatim into CLAUDE.md. TDD is non-negotiable for all projects set up with this skill.

The TDD rules file lays out a very strict process.

### The iron law: tests first, always

The rules start with:

> **The Iron Law**: NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST

Every change must follow this loop:

1. RED: Write a failing test first
2. Verify RED: Run the test and watch it fail for the right reason
3. GREEN: Write the minimal code to make the test pass
4. Verify GREEN: Run the test and confirm it passes
5. REFACTOR: Clean up while tests stay green

If any of this is skipped or reversed, the rules say you must delete the code and start again.

The violations section is blunt:

> "I'll add tests later" → DELETE CODE NOW
>
> "Just this once without tests" → NO. DELETE CODE.

### Coverage and file layout

The rules also set hard minimum coverage:

- Lines: 90%+
- Functions: 90%+
- Branches: 85%+
- Statements: 90%+

Coverage “below threshold = Implementation incomplete”.

For structure, every production file must have a matching test file, for example:

- `src/example.ts` → `src/__tests__/example.test.ts`
- `src/another-example.ts` → `src/__tests__/another-example.test.ts`

This keeps Claude from scattering untested files through the tree.

### What “done” means under TDD

The rules define when a task is actually complete:

> **MANDATORY RULE**: NO TASK IS COMPLETE until:
> - ✅ ALL tests pass (100% green)
> - ✅ Build succeeds with ZERO errors
> - ✅ NO linter errors or warnings
> - ✅ Coverage meets minimum thresholds (90%+)
> - ✅ Progress documented in PROGRESS.md

Anything less is considered incomplete work.

There is also a strong push to "COMMIT EARLY, COMMIT OFTEN". Commits are expected after each full TDD cycle, with all tests passing and coverage in place.

This combination keeps Claude from drifting into large, untested changes.

## Add a verification plan for real‑world behavior

Good unit tests are not enough. The core of this setup is an explicit verification plan.

The `setting-up-a-project` skill requires Claude to use the `writing-verification-plans` skill:

> Use the `writing-verification-plans` skill to create a verification plan. This produces a VERIFICATION_PLAN.md file that should be linked in CLAUDE.md.

In CLAUDE.md, that shows up as:

```markdown
## Verification

See @VERIFICATION_PLAN.md for acceptance testing procedures.
```

The `writing-verification-plans` skill then defines what goes into VERIFICATION_PLAN.md and how Claude should use it.

### Verification is not mocks or fakes

The skill opens with a clear definition:

> **Core principle:** Verification is not integration testing. It uses real systems, never mocks or fakes. A test environment is acceptable only if it's a fully running copy of the system being integrated with.

This rule keeps Claude from “verifying” code against fake services or toy setups. Either it runs against real systems (or full copies), or it is not verification.

### Asking for real scenarios

When Claude writes VERIFICATION_PLAN.md, it has to ask about real-world scenarios.

The skill says to gather, for each scenario:

1. What is being tested?
2. What does success look like?
3. What environment is needed?
4. What could go wrong?

The plan format looks like this:

```markdown
# Verification Plan

## Prerequisites

[List everything needed before verification can run]
- Test environment setup instructions
- Required accounts or credentials
- Sample data or test fixtures
- External systems that must be running

## Scenarios

### Scenario 1: [Name]

**Context**: [What state the system should be in before starting]

**Steps**:
1. [Specific action Claude should take]
2. [Next action]
3. [Continue until complete]

**Success Criteria**:
- [ ] [Observable outcome that must be true]
- [ ] [Another required outcome]

**If Blocked**: [When to stop and ask developer for help]
```

Every scenario needs clear, observable success criteria. Claude cannot just say “it seems fine”. It has to check specific outcomes.

### Run verification after every task

The most important rule in this setup is that Claude does not wait for you to ask for verification.

From the skill:

> **Verification runs automatically after completing any task.** Do not wait for the developer to request it.

The process is:

1. Read VERIFICATION_PLAN.md
2. Confirm prerequisites are met
3. Execute each scenario in order
4. For each step, document what was done and what was observed
5. Check every success criterion
6. Produce a detailed verification log

The log format is also defined:

```markdown
## Verification Log - [Timestamp]

### Task Completed
[Brief description of what was just implemented]

### Scenarios Executed

#### Scenario 1: [Name]
**Status**: PASS / FAIL / BLOCKED

**Steps Executed**:
1. [What was done] → [What was observed]
2. [What was done] → [What was observed]

**Success Criteria**:
- [x] [Criterion] - PASSED: [evidence]
- [ ] [Criterion] - FAILED: [what went wrong]

**Notes**: [Any relevant observations]
```

Claude is expected to log what happened, not just say “verification passed”. If a scenario fails, verification fails.

The rules table in the skill summarizes the expectations:

| Rule | Reason |
|------|--------|
| No mocks, ever | Verification must prove real-world behavior |
| Run after every task | Catch issues before moving on |
| Detailed logging | Developer needs to see what was tested |
| Ask when blocked | Wrong assumptions waste time |
| All scenarios must pass | Partial success = failure |

## How these pieces work together

Putting this all together gives Claude a clear workflow.

1. Use `setting-up-a-project` to create CLAUDE.md
   - Define the project overview
   - Lock in the tech stack
   - Embed the full TDD rules
   - Link to VERIFICATION_PLAN.md
2. Use `writing-verification-plans` to create VERIFICATION_PLAN.md
   - Capture realistic scenarios
   - Write concrete steps and success criteria
   - Spell out prerequisites and “ask for help” conditions
3. For every task:
   - Follow the TDD rules: RED → GREEN → REFACTOR, with coverage and progress documented
   - When the code and tests are in place, run the verification plan
   - Execute each scenario against real systems or full copies
   - Record a detailed verification log, including any failures or blocks
   - Only then treat the task as complete

With this setup, Claude does not need constant correction.

The TDD rules keep its code changes small, tested, and documented.

The verification plan forces it to prove that those changes behave correctly in real conditions, and to show you the evidence before it calls the work done.