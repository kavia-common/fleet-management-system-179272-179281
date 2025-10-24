#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[build.sh] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

echo "[build.sh] Changing directory to ${APP_DIR}"
cd "${APP_DIR}"

echo "[build.sh] flutter pub get"
flutter pub get

echo "[build.sh] flutter analyze"
flutter analyze

echo "[build.sh] flutter test (CI=true)"
CI=true flutter test
