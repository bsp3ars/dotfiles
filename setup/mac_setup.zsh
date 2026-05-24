#!/bin/zsh

if [ -n "$ZSH_VERSION" ]; then
    dotfiles_root_folder="$0:a:h:h"
    timestamp=$(date +%m-%d-%Y_%R:%S)

    mkdir -p -m 777 $dotfiles_root_folder/backup/$timestamp

    cd ~
    mv .gitconfig .wezterm.lua .zprofile .zshrc $dotfiles_root_folder/backups/$timestamp 2>/dev/null

    # Create new .dotfiles_config
    echo -e "export DOTFILES_ACTIVE_PROFILES=()\nexport DOTFILES_ROOT_FOLDER=$dotfiles_root_folder" > ~/.dotfiles_config

    echo -e "To set the active profiles, modify the .dotfiles_config in your home directory.\nNote: the values are symbols (no quotes) and use spaces to deliminate"

    # Symlink base
    ln -sv $dotfiles_root_folder/base/.base_loader ~/.zprofile
    ln -sv $dotfiles_root_folder/base/.base_loader ~/.zshrc
    ln -sv $dotfiles_root_folder/base/.inputrc ~

    # Symlink additional files
    ln -sv $dotfiles_root_folder/config/git/.mac.gitconfig ~/.gitconfig
    ln -sv $dotfiles_root_folder/other/.mac.wezterm.lua ~/.wezterm.lua

    unset dotfiles_root_folder timestamp

    zsh
else
    echo "Z shell was not detected. Verify setup and appropriate script"
fi