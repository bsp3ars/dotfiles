#!/bin/bash

if [ -n "$BASH_VERSION" ]; then
    dotfiles_root_folder="$(cd -- "$(dirname -- "${BASH_SOURCE[0]:-${(%):-%x}}")" && cd .. && pwd -P)"
    timestamp=$(date +%m-%d-%Y_%R)

    mkdir -p -m 777 $dotfiles_root_folder/backup/$timestamp

    # Move all current dotfiles into new folder
    cd ~
    mv -t $dotfiles_root_folder/backup/$timestamp .bash_profile .bashrc .dotfiles_config .gitconfig .gitignore .inputrc .profile 2>/dev/null

    # Create new .dotfiles_config
    echo -e "export DOTFILES_ACTIVE_PROFILES=()\nexport DOTFILES_ROOT_FOLDER=$dotfiles_root_folder" > ~/.dotfiles_config

    echo -e "To set the active profiles, modify the .dotfiles_config in your home directory.\nNote: the values are symbols (no quotes) and use spaces to deliminate"

    # Symlink base
    ln -sv $dotfiles_root_folder/base/.base_loader ~/.bash_profile
    ln -sv $dotfiles_root_folder/base/.base_loader ~/.bashrc
    ln -sv $dotfiles_root_folder/base/.inputrc ~

    # Symlink .gitconfig based on argument
    if [ $# -eq 0 ]; then
        ln -sv $dotfiles_root_folder/custom/tool/git/.base.gitconfig ~/.gitconfig
    elif [ "$1" == "wsl" ]; then
        ln -sv $dotfiles_root_folder/custom/tool/git/.wsl.gitconfig ~/.gitconfig
    else
        echo "Invalid argument provided. Current accepted arguments are: (blank), wsl. Skipping .gitconfig symlink..."
    fi

    unset dotfiles_root_folder timestamp

    bash
else
    echo "Bash was not detected. Verify setup and appropriate script"
fi