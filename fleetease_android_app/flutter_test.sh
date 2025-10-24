#!/usr/bin/env bash
set -euo pipefail
# Root-level test entry for CI systems that expect a script at repo root.

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"
if [ ! -d "$APP_DIR" ]; then
  echo "[flutter_test.sh] App directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"
echo "[flutter_test.sh] PWD=$(pwd)"
flutter pub get
CI=true flutter test -r expanded
