#!/bin/bash
set -euo pipefail

cat <<EOF
COMPOSE_UID=$(id -u)
COMPOSE_GID=$(id -g)

IMG=registry.example.org/grp/foo
POSTGRES_PASSWORD=gahieQuee4boopha
EOF
