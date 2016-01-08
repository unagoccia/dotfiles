# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

# aliases
alias vmlist='vmrun -T fusion list'
#alias vmstart='vmrun -T fusion start'
alias vmsuspend='vmrun -T fusion suspend'
alias vmshutdown='vmrun -T fusion stop'

vmstart () {
    vmrun -T fusion start "$1" nogui
}
