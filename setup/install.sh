case "$OSTYPE" in
  darwin*)  
    source mac_setup.zsh ;; 
  linux*)
    source linux_setup.sh ;;
  # msys*)    
  #   source windows.sh ;;
  *)
    echo "Not currently supported: $OSTYPE" ;;
esac