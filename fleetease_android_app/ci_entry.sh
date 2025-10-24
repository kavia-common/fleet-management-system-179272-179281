#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -d "$APP_DIR" ]; then
  echo "[ci_entry] App directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"
echo "[ci_entry] PWD=$(pwd)"

if [ "$#" -eq 0 ]; then
  echo "[ci_entry] No args provided. Defaulting to: flutter pub get && flutter analyze"
  flutter pub get
  flutter analyze
else
  echo "[ci_entry] Running: flutter $*"
  flutter "$@"
fi
