echo "Installing Dotfiles..."
case "$OSTYPE" in
  darwin*)  echo "OSX" ;; 
  linux*)
    source install_linux.sh ;;
  msys*)    echo "WINDOWS" ;;
  *)        echo "Not currently supported: $OSTYPE" ;;
esac