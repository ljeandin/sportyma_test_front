DOCKER_COMPOSE = docker-compose

## —— 🎵 🐳 The Symfony Makefile 🐳 🎵 ——————————————————————————————————
default: help

help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

install: ## Install stack, assets and vendors
	bin/composer install
	#php bin/console d:m:m -n
	npm install

start: ## Start the stack (you can access the project on localhost:8080 after that)
	symfony server:start -d --no-tls --port=8080
	@echo "$$TXT_ON_START"

stop: ## Stop all the containers that belongs to the project
	symfony server:stop

build-assets: ## Build assets (minimized) for production
	npm run build

build-assets-watch: ## Build assets for dev in watch mode
	npm run watch

define TXT_ON_START
===================================
===================================

Now you can access :
- App Web http://localhost:8080

===================================
===================================

endef
export TXT_ON_START

