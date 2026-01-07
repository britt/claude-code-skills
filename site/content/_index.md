---
title: "Claude Skills"
description: "A collection of skills for Claude to enhance AI-assisted development workflows"
---

## What are Claude Skills?

Skills are reusable instructions that enhance Claude's capabilities for specific tasks. They provide Claude with structured workflows, best practices, and domain expertise.

## Available Skills

| Skill | Description | Claude Code | Claude.ai |
|-------|-------------|:-----------:|:---------:|
| [daily-planning-ritual](/skills/daily-planning-ritual/) | Interactive daily planning across work and personal life dimensions | ✓ | ✓ |
| [setting-up-a-project](/skills/setting-up-a-project/) | Author CLAUDE.md with project purpose, tech stack, and development practices | ✓ | |
| [summoning-the-user](/skills/summoning-the-user/) | Gets user's attention when Claude needs input while running in the background | ✓ | |
| [writing-product-specs](/skills/writing-product-specs/) | Write comprehensive product specification documents | ✓ | ✓ |
| [writing-user-stories](/skills/writing-user-stories/) | Write properly formatted user stories for task definition | ✓ | ✓ |
| [writing-verification-plans](/skills/writing-verification-plans/) | Create real-world acceptance testing procedures | ✓ | |

## Quick Start

### Claude Code (Recommended)

```bash
# Add the marketplace
/plugin marketplace add britt/claude-code-skills

# Install a specific skill
/plugin install writing-product-specs
```

### Manual Installation

```bash
# Clone to global skills directory
git clone https://github.com/britt/claude-code-skills.git ~/.claude/skills/claude-code-skills
```

### Claude.ai

Download zip files from the [Releases page](https://github.com/britt/claude-code-skills/releases/) and upload them to your project's knowledge.
