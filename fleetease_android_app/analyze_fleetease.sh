#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ] || [ ! -d "${APP_DIR}/android" ]; then
  echo "[analyze_fleetease] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

cd "${APP_DIR}"
echo "[analyze_fleetease] PWD=$(pwd)"
flutter pub get
flutter analyze
