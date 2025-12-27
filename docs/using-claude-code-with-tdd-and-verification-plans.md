# Using TDD and Verification Plans with Claude: My Zero-Compromise Setup

Most code assistants can whip up a function or two. But what does it take for an AI engineer to actually work with discipline—to be trusted letting changes through the door without handholding?

Here’s the system I’ve found that works: combine strict test-driven development (TDD) rules with explicit verification plans, and never let up.

## Why So Strict?

AI models like Claude can code, but they’re only as robust as the rules and feedback you enforce. I don’t want to just generate code: I want proof that it works, the way a human developer might need to demonstrate their changes in production-like conditions. That has two pillars:

- **TDD, with no loopholes**
- **Explicit verification plans that prove real-world behavior**

Here’s how I set this up, and why these pieces fit so well together.

## Starting with a Solid Project Definition

First, I insist on documenting exactly what the project is before any code appears. That means capturing:

- **Project Overview** (What are we building? What’s the problem? How are we approaching it?)
- **Tech Stack** (Language, runtime, test framework, linter, build tool, and key libraries)
- **Development Practices** (What are the non-negotiables like TDD?)

I use a project setup checklist (modeled after my own `setting-up-a-project` skill) to fill out a CLAUDE.md with these sections. The result: everyone—including the AI—knows the project’s purpose and technical rules, in writing.

## TDD Rules: No Tests, No Code

For me, TDD isn’t just a guideline. It’s in writing:

> **The Iron Law**: NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST

Every change—yes, every one—must loop through:
1. Write a failing test for the feature or fix (RED)
2. Run it to watch it fail for the expected reason
3. Write the minimal code to pass (GREEN)
4. Confirm all tests pass
5. Refactor with everything green

If Claude (or a human!) tries to sneak in production work without a failing test, or just says, “I’ll add tests later,” I revert or delete that code. The project includes a `rules/TDD.rules.md` with the full manifesto and hard requirements:

- At least 90% line, function, and statement coverage (85% for branches)
- A matching test file for every production file
- Nothing is "done" until all tests, builds, and linting pass **and** coverage is above threshold
- Developers are to “commit early, commit often,” one cycle at a time

## But I Don’t Stop There: Real-World Verification

Code isn’t done just because the tests pass. Next up is the verification plan—a checklist for proving that new changes behave correctly, in real or production-like environments.

### How the Verification Plan Works

The plan is codified in a `VERIFICATION_PLAN.md`, and it covers:

- **Prerequisites:** What must be set up first (test systems running, accounts, data fixtures, etc.)
- **Scenarios:** Each real-world use case, with steps, expected outcomes, and criteria for success
- **Rules:** Never accept mocks/fakes as “good enough”; use real systems, or at least fully running copies

For example, each scenario is laid out like this:

```markdown
### Scenario: [Name]
Context: The system is in this known state…
Steps: 1. Do this… 2. Do that…
Success Criteria: - [ ] Outcome A; - [ ] Outcome B
If Blocked: When to escalate or ask for human review
```

### Running the Plan

After every feature or fix, Claude runs through the plan:

1. Makes sure everything needed for real-world testing is ready
2. Walks through each scenario—documents every step taken and what was observed
3. Checks off each success criterion, with notes and evidence for both passes and failures
4. Logs results in a detailed verification log (not just “it works!” but specifics: what, how, and whether it really passes, with evidence)

If any scenario fails or gets blocked, the process pauses. No "mostly passes"—all tests and verifications must succeed.

## The Workflow, In Practice

So, putting all this together, the typical flow looks like:

1. **Project starts**: Document everything in CLAUDE.md (purpose, stack, rules)
2. **TDD in action**: For every change, write a failing test, see it fail, code to pass, confirm all green, document progress
3. **Verify for real**: Execute verification scenarios in order; log actions and evidence; flag any failures immediately
4. **Done means proven**: Only when both code/tests and verification steps pass is the work considered complete

## The Payoff

I’ve found that this system—rigid as it sounds—actually gives both the AI engineer and the human reviewer huge confidence. No scary half-tested branches, no “surprise!” bugs, no unverified integrations.

Best of all: Claude (or any code assistant or junior dev) has clear, mechanical steps to follow. It’s almost impossible to drift into bad habits.

If you want AI code you can trust, don’t settle for "tests pass". Demand a documented, reproducible process for real-world success, and check that box every time.