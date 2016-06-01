# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

export PATH="$HOME/.jenv/bin:$PATH"'
eval "$(jenv init -)"
