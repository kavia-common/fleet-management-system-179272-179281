#!/usr/bin/env bash
# CI shim to run flutter tests from the correct Flutter app directory.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$ROOT_DIR/fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: pubspec.yaml not found in $APP_DIR"
  exit 2
fi

cd "$APP_DIR"
echo "[ci] Running flutter test in: $(pwd)"
flutter pub get
flutter test
