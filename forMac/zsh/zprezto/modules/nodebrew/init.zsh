# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Path
#
export PATH=$HOME/.nodebrew/current/bin:$PATH
