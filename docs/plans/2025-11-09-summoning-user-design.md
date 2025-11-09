# Summoning the User Skill - Design Document

**Date:** 2025-11-09
**Skill Name:** `summoning-the-user`

## Overview & Purpose

**Purpose:** Help Claude and subagents identify when to block and request user input rather than proceeding with assumptions or guesses.

**Core Principle:** When uncertain, assess the risk. High-risk decisions require summoning the user. Low-risk decisions can proceed with reasonable defaults.

**When to use this skill:**
- When an agent encounters a blocking decision mid-execution
- Anytime proceeding without user input could lead to wasted work or incorrect implementation

**Announce at start:** "I'm using the summoning-the-user skill to determine if I need your input before proceeding."

## Decision Criteria - When to Summon

### The Risk Assessment

**SUMMON (High Risk - block and wait for user):**
- Multiple valid implementation paths exist, no clear "right" answer
- Decision affects security, data integrity, or user privacy
- Requirements are ambiguous or contradictory
- You're about to make an assumption that could waste significant work if wrong
- The choice has architectural implications (hard to change later)
- You don't have enough context about user's actual needs

**PROCEED (Low Risk - make reasonable choice):**
- One clear best practice or standard approach
- Minor implementation detail (variable name, code style)
- Easily reversible decision
- Following established patterns in the codebase
- User has already provided sufficient context

**Special Case - Running Agents:**
When you're a subagent running in background, default to SUMMON for anything uncertain. The user isn't watching, so making wrong assumptions wastes their time when they return.

## How to Summon Effectively

When you've determined summoning is needed:

**1. Use AskUserQuestion tool**
- Creates a UI prompt that demands attention
- Provides structured options (prevents vague responses)
- Forces explicit choice before proceeding

**2. Be explicit about blocking**
- State clearly: "I need your input before proceeding"
- Explain WHY you're blocked (what decision/ambiguity you're facing)
- Don't hide the question in lots of other text

**3. Provide context**
- Briefly explain what you were doing when you got blocked
- State what information you need
- Explain the consequences of different choices if relevant

**Example:**
```
I'm blocked and need your input.

I was implementing the user authentication system and encountered
an ambiguity: should failed login attempts be logged with the
username included (better for security auditing but potential
privacy concern) or without (more private but harder to trace
attack patterns)?

[Uses AskUserQuestion with options]
```

## External Notification Mechanism

### Sending the Alert

When summoning the user, you must send an external notification since they may not be watching the terminal.

**1. Check user preference**
- Ask user which notification method they prefer (first time using skill)
- Store preference for future use

**2. Notification options**

**Option A: Slack CLI**
- Documentation: https://docs.slack.dev/tools/slack-cli/guides/installing-the-slack-cli-for-mac-and-linux
- Check if installed: `slack version`
- If not installed: Install it following the documentation
- Send notification: `slack chat send --channel @username --text "Claude needs your input"`

**Option B: OSA Script (macOS)**
- Use AppleScript to show system notification
- Command: `osascript -e 'display notification "Claude needs your input" with title "Claude Code"'`
- Works immediately on macOS, no installation needed

**3. Workflow**
- Detect you need to summon user
- Send external notification (Slack or OSA)
- Use AskUserQuestion tool to present the question
- Explicitly state you're blocked and waiting

## Implementation Notes

This skill focuses on the decision framework (WHEN to summon) rather than being a comprehensive workflow. The execution mechanics (HOW to summon) are provided but the primary value is helping Claude make the right call about when user input is truly needed versus when reasonable assumptions can be made.
