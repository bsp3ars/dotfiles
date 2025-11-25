#!/bin/zsh

ROOT_DOTFILES="$0:a:h:h"
CUSTOM_TIMESTAMP=$(date +%m-%d-%Y_%R:%S)

mkdir -p -m 777 $ROOT_DOTFILES/backups/$CUSTOM_TIMESTAMP

cd ~
mv .gitconfig .wezterm.lua .zprofile .zshrc $ROOT_DOTFILES/backups/$CUSTOM_TIMESTAMP 2>/dev/null

# Symlink bash folder
for FILE in $ROOT_DOTFILES/zsh/.*; do
    [ -r "$FILE" ] && [ -f "$FILE" ] && mv ~/$(basename $FILE) $ROOT_DOTFILES/backups/$CUSTOM_TIMESTAMP 2>/dev/null
	[ -r "$FILE" ] && [ -f "$FILE" ] && ln -sv $FILE ~ 2>/dev/null
done;

# Symlink additional files
ln -sv $ROOT_DOTFILES/config/git/.mac.gitconfig ~/.gitconfig
ln -sv $ROOT_DOTFILES/other/.mac.wezterm.lua ~/.wezterm.lua

unset ROOT_DOTFILES CUSTOM_TIMESTAMP FILE

source ~/.zprofile
