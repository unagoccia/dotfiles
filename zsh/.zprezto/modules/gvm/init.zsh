# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/unagoccia/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/unagoccia/.sdkman/bin/sdkman-init.sh"

#Grails
gvm default grails 2.5.3
