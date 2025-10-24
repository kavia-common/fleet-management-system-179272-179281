#!/usr/bin/env bash
# Shim to ensure CI runs Flutter commands from the correct project directory.
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[flutter_ci] ERROR: pubspec.yaml not found under ${APP_DIR}" >&2
  exit 1
fi

cd "${APP_DIR}"
echo "[flutter_ci] Running in $(pwd)"
flutter pub get
# Run analyze and tests; allow test environments to set CI=true
flutter analyze
CI=${CI:-false} flutter test
