.PHONY: help init clean build watch pigeon analyze test test-report check check-unused check-unused-files check-unused-l10n check-unused-code screenshot

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

clean: ## Clean project
	@echo "Cleaning the project..."
	@flutter clean
	@flutter pub get

build: ## Trigger one time code generation
	@echo "Generating code..."
	@dart run build_runner build --delete-conflicting-outputs

watch: ## Watch files and trigger code generation on change
	@echo "Generating code on the fly..."
	@dart run build_runner watch --delete-conflicting-outputs

apk: ## Build prod APK
	@echo "Building prod APK"
	@flutter build apk --flavor prod --target lib/main_prod.dart --no-pub

bundle: ## Build production appbundle
	@echo "Building test bundle"
	@flutter build appbundle --release --flavor prod --target lib/main_prod.dart --no-pub

analyze: ## Analyze the code
	@find lib/* -name "*.dart" ! -name "*.freezed.dart" ! -name "*.g.dart" ! -name "*.gr.dart" ! -name "*.config.dart" ! -path '*/generated/*' | xargs dart --disable-analytics format --line-length 120 $(PARAMS)
	@flutter analyze --no-pub
	@dart run dart_code_metrics:metrics analyze lib $(OUTPUT) --disable-sunset-warning

localization:
	@flutter gen-l10n
