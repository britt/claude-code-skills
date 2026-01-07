---
title: "summoning-the-user"
description: "Gets user's attention when Claude needs input while running in the background"
---

Gets the user's attention when Claude (or subagents) are running in the background and need user input to proceed.

## Compatibility

| Platform | Supported |
|----------|:---------:|
| Claude Code | ✓ |
| Claude.ai | |

## When to Use

Use this skill when an agent encounters a blocking decision while running in the background.

## Features

- Decision framework for assessing when user input is needed (high-risk vs low-risk)
- External notification support (terminal-notifier, OSA Script, Slack CLI)
- Proper terminal detection and activation

## Installation

```bash
/plugin install summoning-the-user
```
