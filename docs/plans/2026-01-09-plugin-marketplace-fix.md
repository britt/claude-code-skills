# Plugin Marketplace Configuration Fix

**Issue:** [#23 - Fix plugin marketplace configuration](https://github.com/britt/claude-code-skills/issues/23)

**Goal:** Enable skills to be installed individually OR all at once from the marketplace.

## Problem Analysis

### Current State

The current `marketplace.json` lists only ONE plugin entry:

```json
{
  "plugins": [
    {
      "name": "claude-code-skills",
      "source": "./",
      "description": "Skills for AI-assisted development..."
    }
  ]
}
```

This means users can only install ALL skills at once via `/plugin install britt/claude-code-skills`. There's no way to install individual skills like `daily-planning-ritual` or `writing-product-specs` separately.

### Desired State

Users should be able to:
1. Install ALL skills: `/plugin install britt/claude-code-skills` (installs everything)
2. Install INDIVIDUAL skills: `/plugin install britt/daily-planning-ritual` (installs just that skill)

## Research Findings

Based on analysis of official Anthropic marketplaces and documentation:

### Marketplace Schema

The `marketplace.json` file supports listing multiple plugins, each with its own `source` path:

```json
{
  "$schema": "https://anthropic.com/claude-code/marketplace.schema.json",
  "name": "marketplace-name",
  "version": "1.0.0",
  "description": "Marketplace description",
  "owner": {
    "name": "Owner Name",
    "email": "email@example.com"
  },
  "plugins": [
    {
      "name": "plugin-one",
      "description": "Description",
      "version": "1.0.0",
      "author": { "name": "Author Name" },
      "source": "./plugins/plugin-one",
      "category": "development",
      "tags": ["tag1", "tag2"]
    },
    {
      "name": "plugin-two",
      "source": "./plugins/plugin-two"
    }
  ]
}
```

### Plugin Structure

Each plugin directory needs:
- `.claude-plugin/plugin.json` - Plugin metadata
- Skills, commands, hooks, agents as needed

### Source Paths

- `"source": "./"` - Entire repo is the plugin
- `"source": "./skills/skill-name"` - Specific subdirectory is the plugin

## Implementation Plan

### Step 1: Create plugin.json for Each Skill

Each skill directory needs its own `.claude-plugin/plugin.json`:

**skills/daily-planning-ritual/.claude-plugin/plugin.json:**
```json
{
  "name": "daily-planning-ritual",
  "description": "Interactive daily planning ritual that guides the user through a reflective conversation across all life dimensions",
  "version": "1.0.0",
  "author": {
    "name": "Britt Crawford",
    "email": "britt@brittcrawford.com"
  },
  "homepage": "https://github.com/britt/claude-code-skills",
  "repository": "https://github.com/britt/claude-code-skills",
  "license": "MIT",
  "keywords": ["planning", "daily", "ritual", "productivity"]
}
```

Repeat for all 6 skills:
- [x] daily-planning-ritual
- [x] setting-up-a-project
- [x] summoning-the-user
- [x] writing-product-specs
- [x] writing-user-stories
- [x] writing-verification-plans

### Step 2: Update marketplace.json

Update `.claude-plugin/marketplace.json` to list each skill as a separate plugin:

```json
{
  "$schema": "https://anthropic.com/claude-code/marketplace.schema.json",
  "name": "britt",
  "version": "1.3.0",
  "description": "A collection of skills for Claude Code to enhance AI-assisted development workflows",
  "owner": {
    "name": "Britt Crawford",
    "email": "britt@brittcrawford.com"
  },
  "plugins": [
    {
      "name": "claude-code-skills",
      "description": "All skills bundled together for AI-assisted development",
      "version": "1.2.0",
      "author": { "name": "Britt Crawford" },
      "source": "./",
      "category": "productivity",
      "tags": ["skills", "tdd", "planning", "specs"]
    },
    {
      "name": "daily-planning-ritual",
      "description": "Interactive daily planning ritual across work and personal life dimensions",
      "version": "1.0.0",
      "author": { "name": "Britt Crawford" },
      "source": "./skills/daily-planning-ritual",
      "category": "productivity",
      "tags": ["planning", "daily", "ritual"]
    },
    {
      "name": "setting-up-a-project",
      "description": "Author CLAUDE.md with project purpose, tech stack, and development practices",
      "version": "1.0.0",
      "author": { "name": "Britt Crawford" },
      "source": "./skills/setting-up-a-project",
      "category": "development",
      "tags": ["setup", "project", "claude-md", "tdd"]
    },
    {
      "name": "summoning-the-user",
      "description": "Gets user attention when Claude needs input while running in background",
      "version": "1.0.0",
      "author": { "name": "Britt Crawford" },
      "source": "./skills/summoning-the-user",
      "category": "productivity",
      "tags": ["notification", "blocking", "user-input"]
    },
    {
      "name": "writing-product-specs",
      "description": "Write comprehensive product specification documents",
      "version": "1.0.0",
      "author": { "name": "Britt Crawford" },
      "source": "./skills/writing-product-specs",
      "category": "documentation",
      "tags": ["specs", "prd", "product", "requirements"]
    },
    {
      "name": "writing-user-stories",
      "description": "Write properly formatted user stories for task definition",
      "version": "1.0.0",
      "author": { "name": "Britt Crawford" },
      "source": "./skills/writing-user-stories",
      "category": "documentation",
      "tags": ["user-stories", "agile", "requirements"]
    },
    {
      "name": "writing-verification-plans",
      "description": "Create real-world acceptance testing procedures",
      "version": "1.0.0",
      "author": { "name": "Britt Crawford" },
      "source": "./skills/writing-verification-plans",
      "category": "testing",
      "tags": ["verification", "testing", "acceptance"]
    }
  ]
}
```

### Step 3: Keep Root plugin.json for "All Skills" Bundle

The existing `.claude-plugin/plugin.json` remains for installing all skills at once. This is what gets used when someone installs `claude-code-skills`.

### Step 4: Update Documentation

Update README.md installation section to show both options:

```markdown
## Installation

### Claude Code: Plugin Marketplace

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
/plugin install britt/writing-product-specs
# etc.
```
```

### Step 5: Update Individual Skill Documentation Pages

Each skill has a documentation page in `site/content/skills/`. Add installation instructions for installing that specific skill individually.

**Files to update:**
- `site/content/skills/daily-planning-ritual.md`
- `site/content/skills/setting-up-a-project.md`
- `site/content/skills/summoning-the-user.md`
- `site/content/skills/writing-product-specs.md`
- `site/content/skills/writing-user-stories.md`
- `site/content/skills/writing-verification-plans.md`

**Add to each skill page:**
```markdown
## Installation

Install this skill individually:

```bash
/plugin marketplace add britt/claude-code-skills
/plugin install britt/<skill-name>
```

Or install all skills at once:

```bash
/plugin install britt/claude-code-skills
```
```

### Step 6: Test Installation

After implementation, verify:
1. `/plugin marketplace add britt/claude-code-skills` works
2. `/plugin install britt/claude-code-skills` installs all skills
3. `/plugin install britt/daily-planning-ritual` installs just that skill
4. Individual skills work correctly when installed alone

## Files to Create/Modify

| File | Action |
|------|--------|
| `.claude-plugin/marketplace.json` | Update with individual plugin entries |
| `skills/daily-planning-ritual/.claude-plugin/plugin.json` | Create |
| `skills/setting-up-a-project/.claude-plugin/plugin.json` | Create |
| `skills/summoning-the-user/.claude-plugin/plugin.json` | Create |
| `skills/writing-product-specs/.claude-plugin/plugin.json` | Create |
| `skills/writing-user-stories/.claude-plugin/plugin.json` | Create |
| `skills/writing-verification-plans/.claude-plugin/plugin.json` | Create |
| `README.md` | Update installation instructions |
| `site/content/skills/daily-planning-ritual.md` | Add installation instructions |
| `site/content/skills/setting-up-a-project.md` | Add installation instructions |
| `site/content/skills/summoning-the-user.md` | Add installation instructions |
| `site/content/skills/writing-product-specs.md` | Add installation instructions |
| `site/content/skills/writing-user-stories.md` | Add installation instructions |
| `site/content/skills/writing-verification-plans.md` | Add installation instructions |

## Risks and Considerations

1. **Path Resolution Bug**: There was a [known bug](https://github.com/anthropics/claude-code/issues/11278) where plugin paths were resolved incorrectly. Verify this is fixed or test carefully.

2. **Version Synchronization**: Each skill now has its own version. Consider whether versions should be kept in sync or managed independently.

3. **Backward Compatibility**: Users who installed the old bundle will need to update. The bundle option remains available.

## References

- [Claude Code Plugin Marketplace Docs](https://code.claude.com/docs/en/plugin-marketplaces)
- [Anthropic Official Marketplace](https://github.com/anthropics/claude-code/blob/main/.claude-plugin/marketplace.json)
- [Ivan Magda Marketplace Example](https://github.com/ivan-magda/claude-code-marketplace)
- [Plugin Path Resolution Bug #11278](https://github.com/anthropics/claude-code/issues/11278)
