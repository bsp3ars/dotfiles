#!/bin/bash

# Move all current dotfiles into new folder
cd ~
rm -rf tempDotFiles
mkdir -m 777 tempDotFiles
mv -t tempDotFiles .bash_profile .bashrc .gitconfig .gitignore .inputrc .profile 2>/dev/null

# Symlink bash folder
ln -sv ~/dotfiles/bash/.bash_profile ~
ln -sv ~/dotfiles/bash/.gitconfig ~
ln -sv ~/dotfiles/bash/.inputrc ~
