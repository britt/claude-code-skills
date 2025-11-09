# Claude Code Skills

A collection of skills for Claude Code to enhance AI-assisted development workflows.

## What are Skills?

Skills are process documents that guide Claude through specific workflows and best practices. They help Claude make better decisions, follow proven patterns, and avoid common mistakes.

## Available Skills

### summoning-the-user

**Purpose:** Helps Claude identify when to block and request user input rather than proceeding with assumptions or guesses.

**Use when:**
- An agent encounters a blocking decision mid-execution
- Proceeding without user input could lead to wasted work or incorrect implementation

**Key features:**
- Decision framework for assessing when user input is needed
- Risk-based criteria (high-risk = summon, low-risk = proceed)
- External notification support (terminal-notifier, OSA Script, Slack CLI)
- Proper terminal detection and activation

**Location:** `skills/summoning-the-user/SKILL.md`

## Installation

Clone this repository:

```bash
git clone https://github.com/yourusername/claude-code-skills.git
cd claude-code-skills
```

## Using Skills

Skills are referenced in Claude Code's system context. To use a skill, Claude will:

1. Read the skill file
2. Announce usage: "I'm using the [skill-name] skill to [purpose]"
3. Follow the skill's process exactly

## Repository Structure

```
claude-code-skills/
├── README.md                 # This file
├── docs/
│   └── plans/               # Design documents for skills
│       └── 2025-11-09-summoning-user-design.md
└── skills/
    └── summoning-the-user/  # Individual skill directories
        └── SKILL.md         # Skill implementation
```

## Contributing

Skills should follow this structure:

1. **Design Document** in `docs/plans/YYYY-MM-DD-topic-design.md`
   - Overview and purpose
   - Decision criteria or workflow
   - Implementation details
   - Examples

2. **Skill File** in `skills/skill-name/SKILL.md`
   - YAML frontmatter with name and description
   - Overview and core principles
   - When to use the skill
   - Step-by-step process
   - Key principles table
   - Anti-patterns

## License

MIT
