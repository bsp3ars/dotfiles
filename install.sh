case "$OSTYPE" in
  darwin*)  echo "OSX" ;; 
  linux*)
    source linux.sh ;;
  msys*)    
    source windows.sh ;;
  *)        echo "Not currently supported: $OSTYPE" ;;
esac