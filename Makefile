# Labelize — Makefile (AEP validation + build)

.PHONY: spectral-lint aep-validate build serve test

# Build

build: ## Build the labelize binary
	cargo build --features=cli --features=serve --release

serve: ## Start the HTTP server locally
	cargo run --features=cli --features=serve -- serve --port 8080

test: ## Run all tests
	cargo test

#  Help 

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
