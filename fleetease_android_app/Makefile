# FleetEase workspace Makefile
# Provides CI-friendly targets that run inside the Flutter app directory.

APP_DIR=fleet-management-system-179272-179281/fleetease_android_app

.PHONY: all analyze test build ci
all: analyze

analyze:
	@echo "[Make] Running analyze in $(APP_DIR)"
	cd $(APP_DIR) && flutter pub get && flutter analyze

test:
	@echo "[Make] Running tests in $(APP_DIR)"
	cd $(APP_DIR) && flutter pub get && CI=true flutter test -r expanded

build:
	@echo "[Make] Building debug APK in $(APP_DIR)"
	cd $(APP_DIR) && flutter build apk --debug

ci: analyze test
	@echo "[Make] CI workflow complete."
