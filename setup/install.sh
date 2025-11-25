case "$OSTYPE" in
  darwin*)  
    source mac.min.zsh ;; 
  linux*)
    source linux.min.sh ;;
  # msys*)    
  #   source windows.sh ;;
  *)
    echo "Not currently supported: $OSTYPE" ;;
esac