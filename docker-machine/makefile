.PHONY: help
.DEFAULT_GOAL := help

BOOT2DOCKER_URL?=https://github.com/boot2docker/boot2docker/releases/download
BOOT2DOCKER_VERSION?=v1.12.3
DOCKER_MACHINE_VERSION=v0.9.0-rc2

install: ## install docker machine
	@curl -L https://github.com/docker/machine/releases/download/${DOCKER_MACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine
	@chmod +x /tmp/docker-machine
	@sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
	@sudo wget https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-prompt.bash -O /etc/bash_completion.d/docker-machine-prompt.bash
	@sudo wget https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash -O /etc/bash_completion.d/docker-machine-wrapper.bash
	@sudo wget https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash -O /etc/bash_completion.d/docker-machine.bash
#https://www.digitalocean.com/community/tutorials/how-to-provision-and-manage-remote-docker-hosts-with-docker-machine-on-ubuntu-16-04

install-compose: ## install docker compose
	@curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	@chmod +x /usr/local/bin/docker-compose	
	

create-default: ## create default docker machine
	@docker-machine create --driver virtualbox --virtualbox-boot2docker-url=${BOOT2DOCKER_URL}/${BOOT2DOCKER_VERSION}/boot2docker.iso default 
	@docker-machine use default

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'