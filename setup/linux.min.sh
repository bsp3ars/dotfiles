#!/bin/bash

if [ -n "$BASH_VERSION" ]; then
    dotfiles_root_folder="$(cd -- "$(dirname -- "${BASH_SOURCE[0]:-${(%):-%x}}")" && cd .. && pwd -P)"
    timestamp=$(date +%m-%d-%Y_%R)

    mkdir -p -m 777 $dotfiles_root_folder/backup/$timestamp

    # Move all current dotfiles into new folder
    cd ~
    mv -t $dotfiles_root_folder/backup/$timestamp .bash_profile .bashrc .gitconfig .gitignore .inputrc .profile 2>/dev/null

    # Symlink bash folder
    for file in ~/dotfiles/base/bash/.*; do
        [ -r "$file" ] && [ -f "$file" ] && mv -t $dotfiles_root_folder/backup/$timestamp ~/$(basename $file) 2>/dev/null
        [ -r "$file" ] && [ -f "$file" ] && ln -sv $file ~ 2>/dev/null
    done;

    # Symlink .gitconfig based on argument
    if [ $# -eq 0 ]; then
        ln -sv $dotfiles_root_folder/custom/tool/git/.base.gitconfig ~/.gitconfig
    elif [ "$1" == "wsl" ]; then
        ln -sv $dotfiles_root_folder/custom/tool/git/.wsl.gitconfig ~/.gitconfig
    else
        echo "Invalid argument provided. Current accepted arguments are: (blank), wsl. Skipping .gitconfig symlink..."
    fi

    unset dotfiles_root_folder timestamp file

    bash
else
    echo "Bash was not detected. Verify setup and appropriate setup script"
fi