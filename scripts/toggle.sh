#!/bin/bash
# Usage: toggle.sh
#
# Toggles notification mode between "smart" and "always"
# Stores mode in plugin directory

# if CLAUDE_PLUGIN_ROOT is not set, set it as ~
if [[ -z "$CLAUDE_PLUGIN_ROOT" ]]; then
    CLAUDE_PLUGIN_ROOT="$(dirname "$(dirname "$0")")"
fi

MODE_FILE="$CLAUDE_PLUGIN_ROOT/.claude/notification-mode"

# Ensure directory exists
mkdir -p "$CLAUDE_PLUGIN_ROOT/.claude"

# Read current mode (default to "smart")
if [[ -f "$MODE_FILE" ]]; then
    CURRENT_MODE=$(cat "$MODE_FILE")
else
    CURRENT_MODE="smart"
fi

# Toggle to opposite mode
if [[ "$CURRENT_MODE" == "smart" ]]; then
    NEW_MODE="always"
    echo "$NEW_MODE" > "$MODE_FILE"
    echo "Notifications switched to: always mode (notifications will always appear)"
else
    NEW_MODE="smart"
    echo "$NEW_MODE" > "$MODE_FILE"
    echo "Notifications switched to: smart mode (only when Claude Code is unfocused)"
fi
