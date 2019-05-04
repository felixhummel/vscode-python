.PHONY: dev
dev:
	./env/dev/setup.sh

.PHONY: DANGER_destroy_compose_environment
DANGER_destroy_compose_environment:
	./bin/DANGER_destroy_compose_environment.sh
