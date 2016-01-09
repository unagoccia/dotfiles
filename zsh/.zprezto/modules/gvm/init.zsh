# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "/Users/unagoccia/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/unagoccia/.sdkman/bin/sdkman-init.sh"

#Grails
sdk default grails 3.0.5
