# Claude Code Skills

A collection of skills for Claude Code to enhance AI-assisted development workflows.

## Skills Included

This repository currently includes:

- **summoning-the-user** - Gets user's attention when Claude needs input while running in the background

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

[MIT](LICENSE)
