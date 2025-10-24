#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ -f "pubspec.yaml" ] && [ -d "android" ]; then
  echo "[strict_mobile_ci] Running inside Flutter app: $(pwd)"
  flutter pub get
  flutter analyze
  CI=true flutter test
  exit 0
fi

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[strict_mobile_ci] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

echo "[strict_mobile_ci] Changing directory to ${APP_DIR}"
cd "${APP_DIR}"
flutter pub get
flutter analyze
CI=true flutter test
