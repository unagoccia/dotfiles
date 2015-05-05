# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/hasebe/.gvm/bin/gvm-init.sh" ]] && source "/Users/hasebe/.gvm/bin/gvm-init.sh"

#Grails
gvm default grails 2.5.0
