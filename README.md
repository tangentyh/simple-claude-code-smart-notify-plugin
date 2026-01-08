# Smart Notify Plugin for Claude Code

A Claude Code plugin that lets you toggle between **smart** (focus-aware) and **always** notification modes on macOS.

## Features

- **Smart mode** (default): Only shows notifications when the Claude Code window is NOT focused
- **Always mode**: Shows notifications regardless of window focus
- Toggle between modes with a simple slash command

## Installation

### Option 1: Load directly

```bash
claude --plugin-dir /path/to/simple-claude-code-smart-notify-plugin
```

### Option 2: Add as marketplace

```bash
/plugin marketplace add tangentyh/simple-claude-code-smart-notify-marketplace
/plugin install smart-notify@simple-claude-code-smart-notify-marketplace
```

## Usage

Toggle notification mode:
```
/smart-notify:notify-toggle
```

Output:
```
Notifications switched to: always mode (notifications will always appear)
```
or
```
Notifications switched to: smart mode (only when Claude Code is unfocused)
```

## Notification Events

The plugin notifies you on these events:

| Event | Title | Sound |
|-------|-------|-------|
| Permission required | Claude Code - Permission | Basso |
| Waiting for input (60s+ idle) | Claude Code - Idle | Glass |
| MCP tool needs input | Claude Code - Input Needed | Purr |
| Task completed | Claude Code - Done | Hero |

## Configuration

The notification mode is stored in `~/.claude/notification-mode` as a single line: either `smart` or `always`.

## Requirements

- macOS (uses `osascript` for notifications)
- Claude Code CLI

## License

MIT
