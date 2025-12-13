# Claude Skills

A collection of skills for Claude to enhance AI-assisted development workflows.

_Some of these skills are for Claude Code and some are just for Claude. Most should work in both but some rely on connections only available in the web version of Claude._

## Skills Included

This repository currently includes:

- **daily-planning-ritual** - Interactive daily planning ritual that guides holistic day planning across work and personal life
- **summoning-the-user** - Gets user's attention when Claude needs input while running in the background
- **writing-product-specs** - Write comprehensive product specification documents for new features or projects
- **writing-user-stories** - Write properly formatted user stories for task definition

### daily-planning-ritual

**Purpose:** Interactive morning practice that helps plan the entire day holistically across work and personal life dimensions through a reflective conversation.

**Use when:**
- Requesting to plan your day with phrases like "plan the day", "plan my day", "plan today", or similar variations
- Need a structured approach to daily planning that considers all life dimensions
- Want to incorporate persistent goals and reflection questions into daily planning

**Key features:**
- Gathers context from calendar, emails, and static sections before planning
- Conversational workflow across life dimensions (work, fitness, relationship, social, adventure)
- Creates plans with poetic opening statements and structured sections
- Uses customizable static sections artifact for persistent goals and questions
- Iterative refinement process before finalizing the plan

**Location:** `skills/daily-planning-ritual/SKILL.md`

**Customization:** See `skills/daily-planning-ritual/README.md` for how to customize the skill using the static sections artifact.

### summoning-the-user

**Purpose:** Gets the user's attention when Claude (or subagents) are running in the background and need user input to proceed.

**Use when:**
- An agent encounters a blocking decision while running in the background
- The user is doing other things and needs to be notified that Claude needs input
- Proceeding without user input could lead to wasted work or incorrect implementation

**Key features:**
- Decision framework for assessing when user input is needed (high-risk vs low-risk)
- External notification support to grab user's attention (terminal-notifier, OSA Script, Slack CLI)
- Proper terminal detection and activation - focuses the correct terminal app and window
- Risk-based criteria to avoid over-summoning for trivial decisions

**Location:** `skills/summoning-the-user/SKILL.md`

### writing-product-specs

**Purpose:** Write comprehensive product specification documents that clearly communicate what we're building, why we're building it, and how we'll know it's successful.

**Use when:**
- Designing a new feature or planning a project that needs clear requirements documentation
- Asked to write a product specification, product spec, or PRD (Product Requirements Document)
- Need to communicate product requirements to stakeholders, engineers, or designers

**Location:** `skills/writing-product-specs/SKILL.md`

### writing-user-stories

**Purpose:** Write properly formatted user stories for task definition that identify the persona, desired action, and expected benefit.

**Use when:**
- Asked to write a user story
- Planning a feature and need to define user requirements

**Location:** `skills/writing-user-stories/SKILL.md`

## Building Skill Archives

To create zip archives of all skills for distribution:

```bash
./package.sh
```

This will create a `dist/` directory containing zip files for each skill (e.g., `dist/daily-planning-ritual.zip`, `dist/summoning-the-user.zip`, `dist/writing-product-specs.zip`, `dist/writing-user-stories.zip`).

## Installing Skills in Claude Code

Skills can be installed in two locations:

**Personal skills (available globally):**
```bash
~/.claude/skills/
```

**Project-specific skills:**
```bash
.claude/skills/
```

### Installation Methods

**Option 1: Clone this repository to your personal skills directory**
```bash
# Install all skills globally
git clone https://github.com/britt/claude-code-skills.git ~/.claude/skills/claude-code-skills
```

**Option 2: Install individual skills**
```bash
# Copy a specific skill to your personal skills directory
mkdir -p ~/.claude/skills/summoning-the-user
cp skills/summoning-the-user/SKILL.md ~/.claude/skills/summoning-the-user/
```

**Option 3: Install for a specific project**
```bash
# Install skills for a single project
mkdir -p .claude/skills
cp -r skills/summoning-the-user .claude/skills/
```

**After installation:** Restart Claude Code to load the new skills.

For more information, see the [official Claude Code Skills documentation](https://docs.claude.com/en/docs/claude-code/skills).

## Repository Structure

```
claude-code-skills/
├── README.md                 # This file
├── docs/
│   └── plans/               # Design documents for skills
│       └── 2025-11-09-summoning-user-design.md
└── skills/
    ├── daily-planning-ritual/
    │   ├── README.md        # Customization guide
    │   └── SKILL.md         # Skill implementation
    ├── summoning-the-user/  # Individual skill directories
    │   └── SKILL.md         # Skill implementation
    ├── writing-product-specs/
    │   └── SKILL.md
    └── writing-user-stories/
        └── SKILL.md
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

[MIT](LICENSE)
