# load in component dotfiles
for file in ~/.{exports,aliases}; do
	[[ -f "$file" ]] && source "$file"
done
unset file

# If not running interactively, don't do anything further
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
