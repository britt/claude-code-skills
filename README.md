# Claude Skills

A collection of skills for Claude to enhance AI-assisted development workflows.

## Skills Included

| Skill | Description | Claude Code | Claude.ai |
|-------|-------------|:-----------:|:---------:|
| **daily-planning-ritual** | Interactive daily planning across work and personal life dimensions | * | * |
| **setting-up-a-project** | Author CLAUDE.md with project purpose, tech stack, and development practices | * | |
| **summoning-the-user** | Gets user's attention when Claude needs input while running in the background | * | |
| **writing-product-specs** | Write comprehensive product specification documents | * | * |
| **writing-user-stories** | Write properly formatted user stories for task definition | * | * |
| **writing-verification-plans** | Acceptance test verification plans (real-world testing, never mocks) | * | * |
| **working-on-an-issue** | Use when asked to work on, read, or implement a GitHub issue. | * | |

### daily-planning-ritual

Interactive morning practice that helps plan the entire day holistically through a reflective conversation.

**Use when:** You want to plan your day with phrases like "plan the day", "plan my day", or "plan today"

**Features:**
- Gathers context from calendar, emails, and static sections
- Conversational workflow across life dimensions (work, fitness, relationship, social, adventure)
- Creates plans with poetic opening statements
- Iterative refinement before finalizing

**Customization:** See `skills/daily-planning-ritual/README.md` for configuration options.

### setting-up-a-project

Author a CLAUDE.md file that defines project purpose, tech stack, and development practices before scaffolding code.

**Use when:** Setting up a new project or when no CLAUDE.md exists

**Features:**
- Uses obra/brainstorming to define project purpose
- Establishes tech stack with sensible defaults
- Copies TDD rules and git practices (commit early, commit often)
- Creates verification plan via writing-verification-plans skill

### summoning-the-user

Gets the user's attention when Claude (or subagents) are running in the background and need user input to proceed.

(_I don't think this one actually works yet. It never uses it. But its a good idea._ 🤷‍♂)

**Use when:** An agent encounters a blocking decision while running in the background

**Features:**
- Decision framework for assessing when user input is needed (high-risk vs low-risk)
- External notification support (terminal-notifier, OSA Script, Slack CLI)
- Proper terminal detection and activation

### writing-product-specs

Write comprehensive product specification documents that clearly communicate what we're building, why, and how we'll know it's successful.

**Use when:** Designing a new feature or asked to write a product spec/PRD

### writing-user-stories

Write properly formatted user stories that identify the persona, desired action, and expected benefit.

**Use when:** Asked to write user stories or planning a feature

### writing-verification-plans

Create verification plans for real-world acceptance testing. Verification uses actual systems, never mocks.

**Use when:** Setting up a new project or when a project needs acceptance testing procedures

**Features:**
- Defines scenarios with concrete success criteria
- Instructions for Claude to execute and validate
- Runs automatically after completing tasks
- Detailed verification logs

## Installation

### Claude Code: Plugin Marketplace (Recommended)

Add this repository as a plugin marketplace:

```bash
/plugin marketplace add britt/claude-code-skills
```

**Install all skills:**

```bash
/plugin install britt/claude-code-skills
```

**Install individual skills:**

```bash
/plugin install britt/daily-planning-ritual
/plugin install britt/setting-up-a-project
/plugin install britt/summoning-the-user
/plugin install britt/writing-product-specs
/plugin install britt/writing-user-stories
/plugin install britt/writing-verification-plans
/plugin install britt/working-on-an-issue
```

### Claude Code: Manual Installation

Skills can be installed globally or per-project.

**Global installation** (available in all projects):

```bash
# Clone the entire repository
git clone https://github.com/britt/claude-code-skills.git ~/.claude/skills/claude-code-skills
```

**Project-specific installation**:

```bash
# Clone the entire repository into the project
git clone https://github.com/britt/claude-code-skills.git .claude/skills/claude-code-skills
```

Restart Claude Code after installation to load new skills.

### Claude.ai (Web and iOS)

Skills can be added to Claude.ai projects as project knowledge:

1. **Download the skill zip file**
   - Go to the [Releases page](https://github.com/britt/claude-code-skills/releases/)
   - Download the zip file for the skill you want (e.g., `writing-product-specs.zip`)

2. **Add to your Claude.ai project**
   - Open [claude.ai](https://claude.ai) and go to your project
   - Click on **Project knowledge** in the sidebar
   - Upload the zip file

3. **Use the skill**
   - The skill will be available in all conversations within that project
   - Claude will automatically use it when the context matches the skill's description

**Note:** Some skills (like `summoning-the-user`) require Claude Code-specific features and won't work in Claude.ai.

## Rules

The `rules/` directory contains reusable rule sets that can be copied into your project's CLAUDE.md.

### TDD.rules.md

Strict Test-Driven Development rules for Claude. Used by the `setting-up-a-project` skill.

**Key rules:**
- No production code without a failing test first (RED-GREEN-REFACTOR)
- 90%+ test coverage required on all metrics
- Violations mean delete and start over
- Commit early, commit often (after every TDD cycle)
- Tasks aren't complete until tests pass, build succeeds, and no linter errors

**Usage:** The `setting-up-a-project` skill copies this file verbatim into your project's CLAUDE.md. You can also copy it manually:

```bash
curl -o CLAUDE.md \
  https://raw.githubusercontent.com/britt/claude-code-skills/main/rules/TDD.rules.md
```

Fill in the placeholder commands (`<test command>`, `<build command>`, etc.) for your tech stack.

## Documentation

- [Contributing Guide](CONTRIBUTING.md) - Repository structure, creating skills, and contribution guidelines
- [Claude Code Skills Documentation](https://docs.claude.com/en/docs/claude-code/skills) - Official documentation

## License

[MIT](LICENSE)
