# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

MODULE_DIR=`dirname $0`
CLONE_REPOSITORY='git://github.com/tarruda/zsh-autosuggestions'
CLONE_DIR=${MODULE_DIR}/clone
SOURCE='zsh-autosuggestions.zsh'

function load_source() {
    source ${MODULE_DIR}/${SOURCE}
    # zle-line-init() {
    #     zle autosuggest-start
    # }
    # zle -N zle-line-init
}

if [[ -f "${MODULE_DIR}/${SOURCE}" ]]; then
  load_source
else
  git clone ${CLONE_REPOSITORY} ${CLONE_DIR}
  cp ${CLONE_DIR}/${SOURCE} `dirname $0`/${SOURCE}
  rm -rf ${CLONE_DIR}
  load_source
fi

unfunction load_source
