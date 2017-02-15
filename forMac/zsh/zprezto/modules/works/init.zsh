# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Aliases
#

## eas ##
alias eas='cd ~/svn/eas/eas/trunk && set-tab-title eas_src'
alias easdoc='cd ~/svn/eas/eas_doc/trunk && set-tab-title eas_doc'
alias easshare='cd ~/svn/eas/eas_share/trunk && set-tab-title eas_share'
alias easntts='cd ~/svn/eas/eas_share/trunk && set-tab-title eas_ntts'
alias easwork='cd ~/workspace/05.eas && set-tab-title eas_work'

## dvis  ##
alias dvis='cd ~/workspace/project/dvis && set-tab-title dvis'
alias dvisdoc='cd ~/workspace/project/dvis/01.doc/doc-cache/trunk && set-tab-title dvis_doc_cache'
alias dvisbibd='cd ~/workspace/project/dvis/01.doc/doc-BIBD/trunk && set-tab-title dvis_bibd'
alias dvisprp='cd ~/workspace/project/dvis/01.doc/proper/trunk && set-tab-title dvis_proper'
alias dvisapi='cd ~/workspace/project/dvis/02.src/data-visualization-api && set-tab-title dvis_api'
alias dvisfront='cd ~/workspace/project/dvis/02.src/data-visualization-frontend && set-tab-title dvis_front'

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
