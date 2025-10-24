#!/usr/bin/env bash
set -euo pipefail

# Single entry point to run Flutter analyze and tests from the correct directory.
APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ] || [ ! -d "${APP_DIR}/android" ]; then
  echo "[run_fleetease_ci] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

cd "${APP_DIR}"
echo "[run_fleetease_ci] PWD=$(pwd)"
flutter --version || true
flutter pub get
flutter analyze
CI=true flutter test
