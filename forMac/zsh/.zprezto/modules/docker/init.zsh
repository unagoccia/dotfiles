# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# export
#
export no_proxy=$no_proxy,$(docker-machine ip dev-itemmng)

#
# Aliases
#

#
# Set default eval
#
# check if `docker-machine` command exists
if command -v docker-machine > /dev/null; then
  # fetch the first running machine name
  local machine=$(docker-machine ls | grep Running | head -n 1 | awk '{ print $1 }')
  if [ "$machine" != "" ]; then
    eval "$(docker-machine env $machine)"
    export DOCKER_IP=$(docker-machine ip $machine)
  fi
fi
