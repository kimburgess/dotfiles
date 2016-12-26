# read in .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# load in component dotfiles
for file in ~/.{exports,aliases}; do
	[ -r "$file" ] && source "$file"
done
unset file
