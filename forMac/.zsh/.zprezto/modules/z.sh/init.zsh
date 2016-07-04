# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

Z_MODULE_DIR=`dirname $0`
Z_CLONE_DIR=${Z_MODULE_DIR}/z
if [[ -f "${Z_MODULE_DIR}/z.sh" ]]; then
  source ${Z_MODULE_DIR}/z.sh
else
  git clone https://github.com/rupa/z.git ${Z_CLONE_DIR}
  cp ${Z_CLONE_DIR}/z.sh `dirname $0`/z.sh
  rm -rf ${Z_CLONE_DIR}
  source ${Z_MODULE_DIR}/z.sh
fi

function peco-z-search() {
  which peco z > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco and z"
    return 1
  fi
  local res=$(z | sort -rn | cut -c 12- | peco)
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
}
zle -N peco-z-search
bindkey '^f' peco-z-search
