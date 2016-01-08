# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Aliases
#

alias svnlog='svn log --limit 10 -v'
alias svndiffg='svn diff --diff-cmd fmdiff'
