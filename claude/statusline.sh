#!/bin/bash
# Read JSON data that Claude Code sends to stdin
input=$(cat)

# Extract fields using jq
MODEL=$(echo "$input" | jq -r '.model.display_name' | cut -d' ' -f1)
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
# The "// 0" provides a fallback if the field is null
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)

# Extract session cost, defaulting to 0 if not yet available
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
COST_STR=$(printf '%.4f' "$COST")

GREEN='\033[32m'
RED='\033[31m'
GREY='\033[90m'
RESET='\033[0m'

# Git info (empty string if not a git repo)
GIT_BRANCH=$(git -C "$DIR" rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$GIT_BRANCH" ]; then
  STAGED=$(git -C "$DIR" diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
  UNSTAGED=$(git -C "$DIR" diff --numstat 2>/dev/null | wc -l | tr -d ' ')
  GIT_STR=" ${GREY}on${RESET} ${GIT_BRANCH} ${GREY}with${RESET} ${GREEN}+${STAGED}${RESET} ${RED}~${UNSTAGED}${RESET}"
else
  GIT_STR=""
fi

# Output the status line - ${DIR##*/} extracts just the folder name
echo -e "${GREY}in${RESET} ${DIR##*/}${GIT_STR}\n${GREY}using${RESET} ${PCT}% ${GREY}of${RESET} ${MODEL} ${GREY}at${RESET} \$${COST_STR}"
