# WSL - Windows Subsystem for Linux

## Installation

1. Ensure that you have a version of Windows that supports WSL. 
2. You can install WSL using `wsl --install` or update it using `wsl --update` if it's already installed. You may need to restart after performing the command.
3. Install a distribution that suits your needs. A full list is available using `wsl --list --online`. You can install a distribution using `wsl --install -d <DistroName>`.

## Useful commands

```bash
# Update and Upgrade Packages
sudo apt update
sudo apt upgrade
```