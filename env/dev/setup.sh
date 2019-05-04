#!/bin/bash
set -euo pipefail

log() { echo "$@" 2>&1; }
warn() { log "WARNING $@"; }

[[ ! -f .env ]] && ./bin/generate_env_file.sh > .env || warn ".env exists. skipping"

[[ -f docker-compose.override.yml ]] || ln -s env/dev/docker-compose.override.yml

docker-compose build

docker-compose up -d postgres

SERVICE=app

docker-compose run --rm $SERVICE ./manage.py wait_for_db --timeout=180

# Setup Django
docker-compose run --rm $SERVICE ./manage.py migrate
docker-compose run --rm $SERVICE ./manage.py loaddata project/fixtures/admin.json

# Run
docker-compose up -d --remove-orphans

# print possible next steps
cat <<'EOF'


http://localhost:8000/
docker-compose logs -f
EOF
