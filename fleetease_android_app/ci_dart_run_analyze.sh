#!/usr/bin/env bash
# Repo-root wrapper: cd into the Flutter app and run the Dart analyzer runner.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$ROOT_DIR/fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: pubspec.yaml not found at $APP_DIR" >&2
  exit 2
fi

cd "$APP_DIR"
echo "[ci] PWD: $(pwd)"
exec dart run tool/ci_analyze.dart
