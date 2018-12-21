case "$OSTYPE" in
  darwin*)  
    source macos.sh ;; 
  linux*)
    source linux.sh ;;
  msys*)    
    source windows.sh ;;
  *)        echo "Not currently supported: $OSTYPE" ;;
esac