# Customizing the Daily Planning Ritual

The Daily Planning Ritual skill reads from a **static sections artifact** (`references/static-sections-template.md`) to include persistent content in every daily plan. Edit this file to customize what appears in your plans.

## How It Works

The skill automatically copies these sections from the artifact into each daily plan:

- **Climbing Goals** - Your ongoing climbing objectives
- **Life Projects** - Personal projects and initiatives  
- **Work Priorities** - Current work focus areas
- **Work Questions** - Reflective questions about work
- **Life Questions** - Broader life reflection questions

These sections are copied exactly as-is, so you can customize the skill's output by editing the artifact file.

## Creating the Static Sections Artifact

Create `references/static-sections-template.md` with this structure:

```markdown
Climbing Goals
[Your climbing goals here]

Life Projects
[Your life projects here]

Work Priorities
[Your work priorities here]

Work Questions
[Your work reflection questions here]

Life Questions
[Your life reflection questions here]
```

## Customization Examples

### Change Section Names

You can rename sections in the artifact to match your priorities:

```markdown
Fitness Goals
[Instead of Climbing Goals]

Creative Projects
[Instead of Life Projects]

Career Priorities
[Instead of Work Priorities]
```

**Important:** If you change section names, you **must** also update `skills/daily-planning-ritual/SKILL.md`:

1. Update **Step 1** - Change references to the section names when reading the artifact
2. Update **Step 3** - Modify the plan format to use your new section names
3. Update **Step 2** - If you renamed "Life Questions", update the reference in the closing questions section

The skill looks for exact section headers, so both the artifact and SKILL.md must match. Alternatively, keep the original section names and customize only the content.

### Customize Reflection Questions

The skill selects one question from your **Life Questions** section during the planning conversation. Customize this section to control what questions get asked:

```markdown
Life Questions
- What am I avoiding that needs attention?
- Where am I creating unnecessary friction?
- What would make today feel complete?
- How can I be more present with others?
```

Add, remove, or reorder questions to match your reflection style.

### Update Priorities Over Time

Edit the artifact whenever your priorities change:

- **Weekly:** Update Work Priorities as projects shift
- **Monthly:** Refresh Life Projects as initiatives evolve
- **Seasonally:** Adjust Climbing Goals or fitness objectives

Changes take effect immediately—the next planning session will use the updated content.

### Add New Sections

To include additional persistent sections in your plans:

1. Add the section to `references/static-sections-template.md`
2. Update `skills/daily-planning-ritual/SKILL.md`:
   - **Step 1** - Add the new section name to the list of sections read from the artifact
   - **Step 3** - Add the new section to the plan format template

Example: Add a "Learning Goals" section:

```markdown
Learning Goals
[Your learning objectives]
```

Then update SKILL.md to reference "Learning Goals" in both Step 1 and Step 3.

## Relationship to the Skill

The skill is **read-only** regarding static sections—it copies content but never modifies the artifact. However, if you change section names or add new sections, you must update the skill itself:

- **Content changes** - Edit the artifact file directly (no skill changes needed)
- **Section name changes** - Update both the artifact AND `SKILL.md` Step 1 and Step 3
- **New sections** - Add to the artifact AND update `SKILL.md` Step 1 and Step 3

The artifact acts as a configuration file, but the skill must know which sections to look for. Keep them in sync when customizing section structure.
