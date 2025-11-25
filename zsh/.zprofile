# This file is used for interactive login shells

for file in ~/dotfiles/config/.*; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

for file in ~/dotfiles/config/zsh/.*; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;