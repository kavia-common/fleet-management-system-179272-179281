#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

# If we are already inside the app directory, just run analyze
if [ -f "pubspec.yaml" ] && [ -d "android" ]; then
  echo "[strict_mobile_analyze] Detected Flutter project at: $(pwd)"
  flutter pub get
  flutter analyze
  exit 0
fi

# Otherwise, enforce changing into the app directory
if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[strict_mobile_analyze] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

echo "[strict_mobile_analyze] Changing directory to ${APP_DIR}"
cd "${APP_DIR}"

flutter pub get
flutter analyze
