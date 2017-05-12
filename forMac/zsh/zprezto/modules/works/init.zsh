# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Aliases
#

## eas ##
alias eassrc='cd ~/workspace/project/eas/02.src/eas/trunk && set-tab-title eas_src'
alias easdoc='cd ~/workspace/project/eas/01.doc/eas_doc/trunk && set-tab-title eas_doc'

## dvis  ##
alias dvis='cd ~/workspace/project/dvis && set-tab-title dvis'
alias dvisdoc='cd ~/workspace/project/dvis/01.doc/doc-cache/trunk && set-tab-title dvis_doc_cache'
alias dvisbibd='cd ~/workspace/project/dvis/01.doc/doc-BIBD/trunk && set-tab-title dvis_bibd'
alias dvisprp='cd ~/workspace/project/dvis/01.doc/proper/trunk && set-tab-title dvis_proper'
alias dvisapi='cd ~/workspace/project/dvis/02.src/data-visualization-api && set-tab-title dvis_api'
alias dvisfront='cd ~/workspace/project/dvis/02.src/data-visualization-frontend && set-tab-title dvis_front'
alias dvisdebian='cd ~/workspace/project/dvis/02.src/debianpackage-dvis-viewer && set-tab-title dvis_debian'

#
# Functions
#

WORKSPACE_DIR=~/workspace
function workspace() {
  NOW_DATE=`date +%Y%m%d`
  CURRENT_DIR="${WORKSPACE_DIR}/daily/${NOW_DATE}"
  if [ ! -e $CURRENT_DIR ]; then
    mkdir $CURRENT_DIR
  fi
  cd $CURRENT_DIR
}
