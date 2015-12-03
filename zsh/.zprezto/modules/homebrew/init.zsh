#
# Defines Homebrew aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Aliases
#

# Homebrew
alias brewc='brew cleanup'
alias brewC='brew cleanup --force'
alias brewi='brew install'
alias brewl='brew list'
alias brews='brew search'
alias brewu='brew upgrade'
alias brewU='brew update && brew upgrade'
alias brewx='brew remove'

# Homebrew Cask
alias cask='brew cask'
alias caskc='brew cask cleanup --outdated'
alias caskC='brew cask cleanup'
alias caski='brew cask install'
alias caskl='brew cask list'
alias casks='brew cask search'
alias caskx='brew cask uninstall'

#
# Access Token
#

# brew api token
if [ -f ~/.brew_api_token ];then
  source ~/.brew_api_token
fi

#
# homebrew-cask install directory.
#
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
