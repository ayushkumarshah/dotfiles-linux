#!/bin/bash
# restore-dotsync2-paths.sh — Restore dotsync2 paths from saved config
# Usage: ./restore-dotsync2-paths.sh
#
# Reads dotsync2-paths.yml and adds any missing paths to dotsync2.
# Safe to run multiple times (dotsync2 ignores duplicates).

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PATHS_FILE="$SCRIPT_DIR/dotsync2-paths.yml"

if [ ! -f "$PATHS_FILE" ]; then
    echo "Error: $PATHS_FILE not found"
    exit 1
fi

if ! command -v dotsync2 &>/dev/null; then
    echo "Error: dotsync2 not found. Are you on a Meta devserver/OD?"
    exit 1
fi

echo "Restoring dotsync2 paths from $PATHS_FILE"
echo ""

section=""
while IFS= read -r line; do
    # Track which section we're in
    if echo "$line" | grep -q "^include:"; then
        section="include"
        continue
    elif echo "$line" | grep -q "^exclude:"; then
        section="exclude"
        continue
    fi

    # Only process include paths
    [ "$section" = "include" ] || continue

    # Extract path from YAML list item: '  - ".foo"' or '  - ".foo": history'
    path=$(echo "$line" | sed -n 's/^  - "\(.*\)".*$/\1/p')
    [ -z "$path" ] && continue

    # Check if it's a history file
    if echo "$line" | grep -q ": history"; then
        echo "  Adding (history): $path"
        dotsync2 paths add --history "$path" 2>/dev/null || true
    else
        echo "  Adding: $path"
        dotsync2 paths add "$path" 2>/dev/null || true
    fi
done < "$PATHS_FILE"

echo ""
echo "Done. Run 'dotsync2 paths list' to verify."
