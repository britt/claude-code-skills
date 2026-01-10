---
title: "Claude Skills"
description: "Claude Skills are reusable instruction sets that give Claude structured workflows, best practices, and domain expertise for specific kinds of work. Instead of writing a new prompt every time, you install a skill once and reuse it whenever you need that capability. Each skill focuses on a concrete workflow, like planning your day, setting up a project, or writing specs and user stories."
---

## Available Skills

| Skill | Description | Claude Code | Claude.ai |
|-------|-------------|:-----------:|:---------:|
| [Daily Planning Ritual](./skills/daily-planning-ritual/) | An interactive morning practice that helps you plan your entire day holistically through a reflective conversation across work and personal life dimensions, including calendar, email, and static commitments. | ✓ | ✓ |
| [Setting Up a Project](./skills/setting-up-a-project/) | Authors a CLAUDE.md file that defines your project's purpose, tech stack, and development practices before any code is written, using brainstorming to clarify goals for tools, TDD rules, and git workflow. | ✓ | |
| [Summoning the User](./skills/summoning-the-user/) | Gets your attention when Claude or background subagents reach a blocking decision, using a decision framework to decide when input is needed and triggering external notifications so you can unblock long-running workflows. | ✓ | |
| [Writing Product Specs](./skills/writing-product-specs/) | Writes comprehensive product specification documents that clearly explain what you are building, why it matters, and how success will be measured, making it easier to align stakeholders around a shared understanding of the work. | ✓ | ✓ |
| [Writing User Stories](./skills/writing-user-stories/) | Writes properly formatted user stories that identify the persona, desired action, and expected benefit so you can turn product ideas into clear, testable work items for implementation. | ✓ | ✓ |
| [Working on an Issue](./skills/working-on-an-issue/) | A structured workflow for implementing GitHub issues with verification, following an Understand → Plan → Verify → Implement → Verify Again loop. | ✓ | |
| [Writing Verification Plans](./skills/writing-verification-plans/) | Creates verification plans for real-world acceptance testing that define concrete scenarios, success criteria, and execution steps so Claude can run checks against actual systems and produce detailed verification logs. | ✓ | |

## Quick Start

### Claude Code (Recommended)

```bash
# Add the marketplace
/plugin marketplace add britt/claude-code-skills
```

### Manual Installation

```bash
# Clone to global skills directory
git clone https://github.com/britt/claude-code-skills.git ~/.claude/skills/claude-code-skills
```

### Claude.ai

Download zip files from the [Releases page](https://github.com/britt/claude-code-skills/releases/) and upload them to your project's knowledge.
