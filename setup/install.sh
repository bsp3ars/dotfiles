case "$OSTYPE" in
  darwin*)  
    source macos.sh ;; 
  linux*)
    source linux.min.sh ;;
  # msys*)    
  #   source windows.sh ;;
  *)        echo "Not currently supported: $OSTYPE" ;;
esac