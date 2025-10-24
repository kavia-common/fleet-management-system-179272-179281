#!/usr/bin/env bash
# Conventional CI entrypoint that runs Flutter analyze from the app directory.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
APP_DIR="$ROOT_DIR/fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: pubspec.yaml not found at $APP_DIR" >&2
  exit 2
fi

cd "$APP_DIR"
echo "[ci] PWD: $(pwd)"
flutter pub get
flutter analyze
