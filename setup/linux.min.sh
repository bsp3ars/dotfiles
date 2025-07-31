#!/bin/bash

START_FOLDER="$(cd "$(dirname "${BASH_SOURCE}")" &>/dev/null && cd .. && pwd)"
CUSTOM_TIMESTAMP=$(date +%m-%d-%Y_%R)

mkdir -p -m 777 $START_FOLDER/backups/$CUSTOM_TIMESTAMP

# Move all current dotfiles into new folder
cd ~
mv -t $START_FOLDER/backups/$CUSTOM_TIMESTAMP .bash_profile .bashrc .gitconfig .gitignore .inputrc .profile 2>/dev/null

# Symlink bash folder
for FILE in ~/dotfiles/bash/.*; do
    [ -r "$FILE" ] && [ -f "$FILE" ] && mv -t $START_FOLDER/backups/$CUSTOM_TIMESTAMP ~/$(basename $FILE) 2>/dev/null
	[ -r "$FILE" ] && [ -f "$FILE" ] && ln -sv $FILE ~ 2>/dev/null
done;

# Symlink .gitconfig based on argument
if [ $# -eq 0 ]; then
    ln -sv $START_FOLDER/config/base/.gitconfig ~
elif [ "$1" == "wsl" ]; then
    ln -sv $START_FOLDER/config/wsl/.gitconfig ~
else
    echo "Invalid argument provided. Current accepted arguments are: (blank), wsl. Skipping .gitconfig symlink..."
fi

unset START_FOLDER CUSTOM_TIMESTAMP FILE

source ~/.bash_profile
