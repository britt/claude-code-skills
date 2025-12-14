# Claude Skills

A collection of skills for Claude to enhance AI-assisted development workflows.

## Skills Included

| Skill | Description | Claude Code | Claude.ai |
|-------|-------------|:-----------:|:---------:|
| **daily-planning-ritual** | Interactive daily planning across work and personal life dimensions | * | * |
| **summoning-the-user** | Gets user's attention when Claude needs input while running in the background | * | |
| **writing-product-specs** | Write comprehensive product specification documents | * | * |
| **writing-user-stories** | Write properly formatted user stories for task definition | * | * |

### daily-planning-ritual

Interactive morning practice that helps plan the entire day holistically through a reflective conversation.

**Use when:** You want to plan your day with phrases like "plan the day", "plan my day", or "plan today"

**Features:**
- Gathers context from calendar, emails, and static sections
- Conversational workflow across life dimensions (work, fitness, relationship, social, adventure)
- Creates plans with poetic opening statements
- Iterative refinement before finalizing

**Customization:** See `skills/daily-planning-ritual/README.md` for configuration options.

### summoning-the-user

Gets the user's attention when Claude (or subagents) are running in the background and need user input to proceed.

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

## Installation

### Claude Code: Plugin Marketplace (Recommended)

Add this repository as a plugin marketplace, then install individual skills:

```bash
# Add the marketplace
/plugin marketplace add britt/claude-code-skills

# Install a specific skill
/plugin install summoning-the-user
```

### Claude Code: Manual Installation

Skills can be installed globally or per-project.

**Global installation** (available in all projects):
```bash
# Clone the entire repository
git clone https://github.com/britt/claude-code-skills.git ~/.claude/skills/claude-code-skills

# Or copy individual skills
mkdir -p ~/.claude/skills/summoning-the-user
curl -o ~/.claude/skills/summoning-the-user/SKILL.md \
  https://raw.githubusercontent.com/britt/claude-code-skills/main/skills/summoning-the-user/SKILL.md
```

**Project-specific installation**:
```bash
mkdir -p .claude/skills
curl -o .claude/skills/summoning-the-user/SKILL.md \
  --create-dirs \
  https://raw.githubusercontent.com/britt/claude-code-skills/main/skills/summoning-the-user/SKILL.md
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

## Documentation

- [Contributing Guide](CONTRIBUTING.md) - Repository structure, creating skills, and contribution guidelines
- [Claude Code Skills Documentation](https://docs.claude.com/en/docs/claude-code/skills) - Official documentation

## 🌟 Bonus! 🌟

I also added my [CLAUDE.md for good Test Driven Development](./CLAUDE.tdd.rules.md). There are a few **&lt;angle bracketed sections&gt;** you will want to fill in before using it.
It also relies on IMPLEMENTATION_PLAN.md that outlines how Claude should go about building the project. You can ask Claude to write this for you. The best way I've found is using [Jesse Vincent's brainstorm skill](https://github.com/obra/superpowers-marketplace).

## License

[MIT](LICENSE)
