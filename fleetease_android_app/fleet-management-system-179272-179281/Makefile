# Repository-level Makefile to run Flutter commands from the correct app directory.
# Usage:
#   make ci-analyze
#   make ci-test
#   make ci-pub-get
#   make ci-build-debug
# Environment:
#   FLUTTER_APP_DIR can override the app directory path if the structure changes.

FLUTTER_APP_DIR ?= fleetease_android_app

.PHONY: ci-analyze
ci-analyze:
	@echo "[ci] Analyzing Flutter app in $(FLUTTER_APP_DIR)"
	@cd $(FLUTTER_APP_DIR) && flutter analyze

.PHONY: ci-test
ci-test:
	@echo "[ci] Testing Flutter app in $(FLUTTER_APP_DIR)"
	@cd $(FLUTTER_APP_DIR) && flutter test

.PHONY: ci-pub-get
ci-pub-get:
	@echo "[ci] flutter pub get in $(FLUTTER_APP_DIR)"
	@cd $(FLUTTER_APP_DIR) && flutter pub get

.PHONY: ci-build-debug
ci-build-debug:
	@echo "[ci] flutter build apk --debug in $(FLUTTER_APP_DIR)"
	@cd $(FLUTTER_APP_DIR) && flutter build apk --debug
