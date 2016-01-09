# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "/Users/unagoccia/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/unagoccia/.sdkman/bin/sdkman-init.sh"

#Grails
<<<<<<< HEAD:zsh/.zprezto/modules/gvm/init.zsh
sdk default grails 3.0.5
=======
sdk default grails 2.5.1
>>>>>>> 33aea49ff6feb7306536b5e4d5249561ffbaaab2:forCentOS/zsh/.zprezto/modules/gvm/init.zsh
