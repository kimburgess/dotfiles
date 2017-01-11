# load in component dotfiles
for file in ~/.{exports,aliases}; do
	[[ -f "$file" ]] && source "$file"
done
unset file

# vi edit mode 
bindkey -v
export KEYTIMEOUT=10

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# oh-my-zsh install path
export ZSH=/home/kim/.oh-my-zsh

# prefs 
ZSH_THEME="geometry/geometry"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyy-mm-dd"

# plugins
plugins=(git vi-mode z npm bower docker node)
source $ZSH/oh-my-zsh.sh

# geometry options
GEOMETRY_PROMPT_PLUGINS=(docker_machine exec_time git)
