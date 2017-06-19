# vi edit mode
bindkey -v
export KEYTIMEOUT=10

# primary editor
export EDITOR="vim"

# highlighting in manpages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# package management
alias pacman="sudo pacman"
alias update="pacman -Syu"

# git shortcuts
alias gs="git status"
alias gc="git commmit"
alias ga="git add"

# make ls a little nicer for humans
alias ls="ls -h --color=auto"

# base file operations
alias mv="mv -v"
alias rm="rm -i -v" # protect against stupid shit
alias cp="cp -v"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

# always enable coloured grep output
alias grep="grep --color=auto"
alias fgrep="grep --color=auto"
alias egrep="grep --color=auto"

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# oh-my-zsh install path
export ZSH=$HOME/.oh-my-zsh

# prefs
ZSH_THEME="geometry/geometry"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# plugins
plugins=(git vi-mode z npm bower docker node)

# geometry options
GEOMETRY_PROMPT_PLUGINS=(exec_time git)
PROMPT_GEOMETRY_COLORIZE_ROOT="true"
GEOMETRY_SYMBOL_GIT_DIRTY="○"
GEOMETRY_SYMBOL_GIT_CLEAN="●"
GEOMETRY_SYMBOL_GIT_BARE="◌"

source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Add .local to path
export PATH="$PATH:$HOME/.local/bin"

export PATH="$HOME/.yarn/bin:$PATH"
