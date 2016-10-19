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
alias brewi='brew file brew install'
alias brewl='brew list'
alias brews='brew search'
alias brewu='brew upgrade'
alias brewU='brew update && brew upgrade'
alias brewx='brew file brew remove'

# Homebrew Cask
alias cask='brew cask'
alias caskc='brew cask cleanup --outdated'
alias caskC='brew cask cleanup'
alias caski='brew file brew cask install'
alias caskl='brew cask list'
alias casks='brew cask search'
alias caskx='brew file brew cask uninstall'
alias casku='brew cask install --force $(brew cask list)'

#
# Access Token
#

# brew api token
if [ -f ~/.brew_api_token ];then
  source ~/.brew_api_token
fi
