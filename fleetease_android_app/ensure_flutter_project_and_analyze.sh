#!/usr/bin/env bash
set -euo pipefail

# This script ensures Flutter analyze runs from a valid Flutter project directory.
# It should be invoked by CI from the repository root.
APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ -f "pubspec.yaml" ] && [ -d "android" ]; then
  # Running inside a Flutter project already
  echo "[ensure] Detected Flutter project at $(pwd)"
  flutter pub get
  flutter analyze
  exit 0
fi

if [ -f "${APP_DIR}/pubspec.yaml" ] && [ -d "${APP_DIR}/android" ]; then
  echo "[ensure] Changing dir to ${APP_DIR}"
  cd "${APP_DIR}"
  flutter pub get
  flutter analyze
  exit 0
fi

echo "ERROR: Could not determine Flutter project root. Ensure CI executes from ${APP_DIR} or uses this script." >&2
exit 2
