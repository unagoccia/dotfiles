# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Aliases
#

alias eas='cd ~/svn/eas/trunk'

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
