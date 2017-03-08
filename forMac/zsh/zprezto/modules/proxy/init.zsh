# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Value
#
proxy=xxxxxxxxx:xxxx

#
# Aliases
#

alias setproxy="set_proxy"
alias unsetproxy="unset_proxy"


#
# Functions
#

function set_proxy() {
  export http_proxy=http://$proxy
  export HTTP_PROXY=http://$proxy
  #export ftp_proxy=$proxy
  #export FTP_PROXY=$proxy
  #export all_proxy=$proxy
  #export ALL_PROXY=$proxy
  export https_proxy=$http_proxy
  export HTTPS_PROXY=$http_proxy

  git config --global http.proxy $proxy
  git config --global https.proxy $proxy
  #git config --global url."https://".insteadOf git://

  # 例外設定
  export no_proxy=localhost
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
