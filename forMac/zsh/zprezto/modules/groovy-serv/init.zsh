#
# Provides GroovyServ aliases.
#

# Return if requirements are not found.
if (( ! $+commands[groovyclient] )); then
  return 1
fi

# start GroovyServ
groovyserver -t 100

# Source module files.
source "${0:h}/alias.zsh"
