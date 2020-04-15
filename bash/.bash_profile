#!/usr/bin/env bash

export EDITOR=vim

# History

## Bind arrow keys to history search functions
if [[ $- == *i* ]]; then
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'
fi

## Infinite history
export HISTSIZE=""

## Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# Git

## Load command line auto completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# Nav

if [ -f $(brew --prefix)/bin/nav.sh ]; then source $(brew --prefix)/bin/nav.sh; fi

# Prompt

export PS1="\[\033[1;33m\]>\[\033[0m\] "

# Aliases

## Bash
alias bashrld="source ~/.bash_profile"
alias localip="ipconfig getifaddr en0"
alias loadtest="ab -n 100 -c 20 $1"
alias ddos="ab -n 1000 -c 50 $1"

### Tree
alias lst="tree -C -a -L 1 $1"

## Git
alias gs="git status"
__git_complete gs _git_status
alias gb="git branch"
__git_complete gb _git_branch
alias gc="git checkout $1"
__git_complete gc _git_checkout
alias gcb="git checkout -b $1"
__git_complete gcb _git_checkout
alias gcm="git checkout master"
__git_complete gcm _git_checkout

# Functions

## Bash
path() {
  echo "${PATH//:/$'\n'}"
}

pathmunge() {
  if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)"; then
    if [ "$2" = "before" ]; then
      PATH="$1:$PATH"
    else
      PATH="$PATH:$1"
    fi
  fi
}

cpb() {
  "$@" | pbcopy
}

f() {
  local path
  [[ -z "${1}" ]] && path="." || path="${1}"

  local file
  file="$(find "${path}" -type f | fzf)"

  if [ ! "${file}" = "" ]; then
    vim "${file}"
  fi
}

# Load Local bash profile (Note: This is done last in order to allow overrides)
if [ -f ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi
