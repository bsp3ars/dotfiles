# This file is used for non-login shells

for file in ~/dotfiles/config/.*; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;