#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[run_flutter_analyze] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

cd "${APP_DIR}"
echo "[run_flutter_analyze] PWD=$(pwd)"
flutter pub get
flutter analyze
