# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Aliases
#

alias eas='cd ~/svn/テックキャンバス/eas/trunk && set-tab-title eas_src'
alias easdoc='cd ~/svn/テックキャンバス/eas_doc/trunk && set-tab-title eas_doc'
alias easshare='cd ~/svn/テックキャンバス/eas_share/trunk && set-tab-title eas_share'
alias easntts='cd ~/svn/テックキャンバス/eas_share/trunk && set-tab-title eas_ntts'
alias easwork='cd ~/svn/テックキャンバス/eas_share/trunk && set-tab-title eas_work'

#
# Functions
#

WORKSPACE_DIR=~/workspace
function workspace() {
  NOW_DATE=`date +%Y%m%d`
  CURRENT_DIR=$WORKSPACE_DIR/$NOW_DATE
  if [ ! -e $CURRENT_DIR ]; then
    mkdir $CURRENT_DIR
  fi
  cd $CURRENT_DIR
}
