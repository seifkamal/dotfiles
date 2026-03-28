export PROMPT='%F{yellow}→ %f'
export EDITOR='nvim' # Used by some programs, like kitty

# Colored pager (eg. for `man` pages)
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Navigate history using arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# aliases
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gl='git log'
alias ga='git add'
alias ls='ls -l'
alias vim='nvim'
alias editzsh='nvim ~/.zshrc'
alias editvim='nvim ~/.config/nvim/init.lua'
alias editkitty='nvim ~/.config/kitty/kitty.conf'
alias reloadzsh='source ~/.zshrc'

# functions
serve() {
  python3 -m http.server --directory "${1:-.}"
}
copy() {
  [[ -f $1 ]] || { echo "Arg 1 must be a file" && return 1; }
  cat $1 | pbcopy
}

# theme
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'

# my tools
source ~/src/personal/wd/wd.sh
# shell
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# local overrides
[[ -f ~/.zshrc_local ]] && source ~/.zshrc_local
