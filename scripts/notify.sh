#!/bin/bash
# Usage: notify.sh <message> <title> <sound>
#
# Notification script that respects the notification mode setting.
# - "smart" mode: Only notify when Claude Code window is NOT focused
# - "always" mode: Always show notifications

MESSAGE="$1"
TITLE="$2"
SOUND="$3"

# Read notification mode (default to "smart")
MODE_FILE="$CLAUDE_PLUGIN_ROOT/.claude/notification-mode"
if [[ -f "$MODE_FILE" ]]; then
    MODE=$(cat "$MODE_FILE")
else
    MODE="smart"
fi

# Function to show notification
show_notification() {
    osascript -e "display notification \"$MESSAGE\" with title \"$TITLE\" sound name \"$SOUND\""
}

if [[ "$MODE" == "always" ]]; then
    # Always mode: show notification immediately
    show_notification
else
    # Smart mode: only notify if project window is not focused
    PROJECT_NAME=$(basename "$CLAUDE_PROJECT_DIR")
    WINDOW_TITLE=$(osascript -e 'tell application "System Events" to get name of first window of (first application process whose frontmost is true)' 2>/dev/null)

    # Case-insensitive check: only notify if project name NOT in window title
    if [[ -z "$PROJECT_NAME" ]] || [[ ! "${WINDOW_TITLE,,}" == *"${PROJECT_NAME,,}"* ]]; then
        show_notification
    fi
fi
