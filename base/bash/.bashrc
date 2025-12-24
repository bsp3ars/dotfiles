# This file is used for non-login shells

dotfiles_root_folder="$(cd -- "$(dirname -- "${BASH_SOURCE[0]:-${(%):-%x}}")" && cd ../.. && pwd -P)"

# Profile
source $dotfiles_root_folder/custom/profile/.profile_loader

# Shell
for file in $dotfiles_root_folder/custom/shell/bash/.*; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset dotfiles_root_folder, file