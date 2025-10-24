#!/usr/bin/env bash
# Exports FLUTTER_APP_DIR and runs flutter analyze from that directory.
# Designed for CI environments that can source environment and execute one script.

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="${FLUTTER_APP_DIR:-$ROOT_DIR/fleet-management-system-179272-179281/fleetease_android_app}"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: pubspec.yaml not found in $APP_DIR"
  echo "[ci] You can set FLUTTER_APP_DIR environment variable before calling this script."
  exit 2
fi

export FLUTTER_APP_DIR="$APP_DIR"
echo "[ci] FLUTTER_APP_DIR=$FLUTTER_APP_DIR"

cd "$FLUTTER_APP_DIR"
echo "[ci] Working directory: $(pwd)"

echo "[ci] Running flutter pub get..."
flutter pub get

echo "[ci] Running flutter analyze..."
flutter analyze
