#!/usr/bin/env bash
# Canonical CI entrypoint for Flutter from repository root.
# Runs: flutter pub get, flutter analyze, flutter test
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="${FLUTTER_APP_DIR:-$ROOT_DIR/fleet-management-system-179272-179281/fleetease_android_app}"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: pubspec.yaml not found in $APP_DIR" >&2
  exit 2
fi

export FLUTTER_APP_DIR="$APP_DIR"
echo "[ci] Using FLUTTER_APP_DIR=$FLUTTER_APP_DIR"

(
  cd "$APP_DIR"
  echo "[ci] PWD: $(pwd)"
  echo "[ci] flutter pub get"
  flutter pub get
  echo "[ci] flutter analyze"
  flutter analyze
  echo "[ci] flutter test"
  flutter test
)
