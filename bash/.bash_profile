# This file is used when Bash is invoked as a interactive login shell

for file in ~/dotfiles/config/.*; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;