#!/bin/bash

# Request sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run this script with sudo"
  exit
fi

# Add repositories

# Spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list

# qBittorrent
add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y

# Create temp directory for Downloads
mkdir -m 777 temp

# Download packages
wget -O temp/hyper.deb https://releases.hyper.is/download/deb
wget -O temp/nordvpn.deb https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
wget -O temp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868

# Install downloaded packages
dpkg -i temp/hyper.deb
dpkg -i temp/nordvpn.deb
dpkg -i temp/vscode.deb

# Delete folder and packages
rm -rf temp

# Update all packages
apt update
apt upgrade

# Install packages
apt install filezilla nordvpn qbittorrent spotify-client vlc

# Remove Unnecessary packages
apt autoremove

# Move all current dotfiles into new folder
cd ~
mkdir -m 777 tempDotFiles
mv -t tempDotFiles .bash_profile .bashrc .gitconfig .gitignore .inputrc .profile 2>/dev/null

# Symlink bash folder
ln -sv ~/dotfiles/bash/.bash_profile ~
ln -sv ~/dotfiles/bash/.gitconfig ~
ln -sv ~/dotfiles/bash/.inputrc ~