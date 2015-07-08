# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Aliases
#

alias wine='/usr/local/wine/bin/wine'
alias winmerge='wine %SystemDrive%/Program\ Files/WinMerge/WinMergeU.exe'
