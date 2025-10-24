#!/usr/bin/env bash
set -euo pipefail

# Always run analysis inside the Flutter app directory
APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -d "$APP_DIR" ]; then
  echo "[Analyzer Shim] App directory not found: $APP_DIR"
  exit 1
fi

cd "$APP_DIR"
echo "[Analyzer Shim] PWD=$(pwd)"
flutter pub get
flutter analyze
