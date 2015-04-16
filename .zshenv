
##########
## PATH ##
##########

export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

###############
## JAVA_HOME ##
###############

alias java7='setjdk 1.7'
alias java8='setjdk 1.8'
function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}
function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

# デフォルト
setjdk 1.8.0_31

#########
## GVM ##
#########

[[ -s "/Users/hase-tt/.gvm/bin/gvm-init.sh" ]] && source "/Users/hase-tt/.gvm/bin/gvm-init.sh"
