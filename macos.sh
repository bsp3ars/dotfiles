#!/bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew tap caskroom/versions
brew install git wget
brew cask install dropbox firefox google-chrome spotify vlc

# macOS Defaults

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable the sound effects on boot
nvram SystemAudioVolume=" "

# Create temp directory for Downloads
mkdir -m 777 temp

# Download packages
wget -O temp/hyper.zip https://releases.hyper.is/download/mac
wget -O temp/vscode.zip https://go.microsoft.com/fwlink/?LinkID=620882

# Install downloaded packages
cd temp
unzip hyper.zip
unzip vscode.zip
rm -rf hyper.zip vscode.zip
cp -R * /Applications 2>/dev/null
cd ..

# Delete folder and packages
rm -rf temp

# Move all current dotfiles into new folder
cd ~
rm -rf tempDotFiles 2>/dev/null
mkdir -m 777 tempDotFiles
mv .bash_profile .bashrc .gitconfig .gitignore .inputrc .profile tempDotFiles 2>/dev/null

# Symlink bash folder
ln -sv ~/dotfiles/bash/.bash_profile ~
ln -sv ~/dotfiles/bash/.gitconfig ~
ln -sv ~/dotfiles/bash/.inputrc ~

# Start using the new .bash_profile
source ~/.bash_profile

# Echo notice
echo "All previous configurations were moved to ~/tempDotFiles"