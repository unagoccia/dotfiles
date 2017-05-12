
##########
## PATH ##
##########

export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

###########
## PROXY ##
###########

alias setproxy="set_proxy"
alias unsetproxy="unset_proxy"

proxy=xxxxxxxxxxx:18080

function set_proxy() {
  export http_proxy=$proxy
  export HTTP_PROXY=$proxy
  export ftp_proxy=$proxy
  export FTP_PROXY=$proxy
  export all_proxy=$proxy
  export ALL_PROXY=$proxy
  export https_proxy=$proxy
  export HTTPS_PROXY=$proxy

  git config --global http.proxy $proxy
  git config --global https.proxy $proxy
  git config --global url."https://".insteadOf git://
}

function unset_proxy() {
  unset http_proxy
  unset HTTP_PROXY
  unset ftp_proxy
  unset FTP_PROXY
  unset all_proxy
  unset ALL_PROXY
  unset https_proxy
  unset HTTPS_PROXY

  git config --global --unset http.proxy
  git config --global --unset https.proxy
  git config --global --unset url."https://".insteadOf
}

#デフォルト(ON)
setproxy

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

#Grails
gvm default grails 2.5.0

