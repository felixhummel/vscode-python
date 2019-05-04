#!/bin/bash
set -euo pipefail

# make sure that we are run from the project root
my_expected_name=./bin/DANGER_destroy_compose_environment.sh
my_actual_name=$0

if [[ "$my_expected_name" != "$my_actual_name" ]]; then
  echo "Please run me from the project root" >&2
  exit 1
fi

get_project_name() {
  local bindir=$(dirname $my_actual_name)
  local project_root=$(readlink -m $bindir/../)
  echo $(basename $project_root)
}
# We need something to find volumes that belong to this compose project.
# If there was something like `compose show project` we would be done here.
# Unfortunately we have to do this ourselves.
#
# Compose supports three ways to set the project name.
# We support two of them, i.e.:
# - [ ] set via `-p` flag
# - [x] COMPOSE_PROJECT_NAME environment variable
# - [x] the project's directory name

project_name=${COMPOSE_PROJECT_NAME:-$(get_project_name)}

docker-compose down --remove-orphans
volumes=$(docker volume ls -q --filter label=com.docker.compose.project=$project_name)
[[ -n $volumes ]] && docker volume rm $volumes
[[ -L docker-compose.override.yml ]] && rm docker-compose.override.yml || true
