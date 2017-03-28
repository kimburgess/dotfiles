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

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# If not running interactively, don't do anything further
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
