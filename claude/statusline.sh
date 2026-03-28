#!/bin/bash
# Read JSON data that Claude Code sends to stdin
input=$(cat)

# Extract fields using jq
MODEL=$(echo "$input" | jq -r '.model.display_name')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
# The "// 0" provides a fallback if the field is null
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)

# Extract session cost, defaulting to 0 if not yet available
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
COST_STR=$(printf '%.4f' "$COST")

# Output the status line - ${DIR##*/} extracts just the folder name
echo "[$MODEL] ${DIR##*/} | ${PCT}% context | \$${COST_STR}"
