#!/usr/bin/env bash
set -euo pipefail
# Root-level analyzer entry for CI systems that expect a script at repo root.

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"
if [ ! -d "$APP_DIR" ]; then
  echo "[flutter_analyze.sh] App directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"
echo "[flutter_analyze.sh] PWD=$(pwd)"
flutter pub get
flutter analyze
