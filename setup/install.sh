PARENT_FOLDER="$(cd "$(dirname "${BASH_SOURCE}")" &>/dev/null && pwd)"

case "$OSTYPE" in
  darwin*)  
    source $PARENT_FOLDER/mac.min.zsh ;; 
  linux*)
    source $PARENT_FOLDER/linux.min.sh ;;
  # msys*)    
  #   source windows.sh ;;
  *)
    echo "Not currently supported: $OSTYPE" ;;
esac

unset PARENT_FOLDER