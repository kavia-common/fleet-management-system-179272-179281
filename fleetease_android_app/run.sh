#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[run.sh] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

echo "[run.sh] Changing directory to ${APP_DIR}"
cd "${APP_DIR}"

echo "[run.sh] flutter pub get"
flutter pub get

echo "[run.sh] flutter analyze"
flutter analyze

echo "[run.sh] flutter test (CI=true)"
CI=true flutter test
