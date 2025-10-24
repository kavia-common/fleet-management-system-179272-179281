#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[check.sh] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

echo "[check.sh] Entering ${APP_DIR}"
cd "${APP_DIR}"

echo "[check.sh] Running flutter pub get"
flutter pub get

echo "[check.sh] Running flutter analyze"
flutter analyze

echo "[check.sh] Running flutter tests"
CI=true flutter test
