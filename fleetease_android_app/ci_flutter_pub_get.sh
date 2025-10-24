#!/usr/bin/env bash
# CI shim to run Flutter pub get in the correct app directory.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$ROOT_DIR/fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "$APP_DIR/pubspec.yaml" ] ; then
  echo "[ci] ERROR: pubspec.yaml not found at $APP_DIR"
  exit 2
fi

cd "$APP_DIR"
echo "[ci] Running flutter pub get in: $(pwd)"
exec flutter pub get
