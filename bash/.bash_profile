for DOTFILE in `find ~/dotfiles/system`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done