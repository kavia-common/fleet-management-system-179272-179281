#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -d "$APP_DIR" ]; then
  echo "[Test Shim] App directory not found: $APP_DIR"
  exit 1
fi

cd "$APP_DIR"
echo "[Test Shim] PWD=$(pwd)"
flutter pub get
CI=true flutter test -r expanded
