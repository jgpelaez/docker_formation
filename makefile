.PHONY: help
.DEFAULT_GOAL := help

BOOT2DOCKER_URL?=https://github.com/boot2docker/boot2docker/releases/download
BOOT2DOCKER_VERSION?=v1.12.3
DOCKER_MACHINE_VERSION=v0.9.0-rc2

portainer: ## runs portainer
	@cd samples/portainer; docker-compose up -d
	@curl -H "Content-Type: application/json" -X POST -d '{"password":"admin123"}'  http:///$(shell docker-machine ip default):9000/api/users/admin/init
	@echo "Portainer url: http://$(shell docker-machine ip default):9000"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'