.PHONY: help
.DEFAULT_GOAL := help

slides: ## runs slides
	@docker-compose up

slidesb: ## runs slides 2
	@docker-compose up

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'