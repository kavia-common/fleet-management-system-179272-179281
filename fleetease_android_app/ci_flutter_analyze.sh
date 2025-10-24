#!/usr/bin/env bash
# Simple CI shim to run Flutter analyze from the correct project directory.
# This avoids "Could not determine project root directory for Flutter project".
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$ROOT_DIR/fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: pubspec.yaml not found in $APP_DIR"
  exit 2
fi

cd "$APP_DIR"
echo "[ci] Running flutter analyze in: $(pwd)"
exec flutter analyze
