#!/usr/bin/env sh
set -eu

# Minimal POSIX shell wrapper to run Flutter tests from repo root in CI.

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -d "$APP_DIR" ]; then
  echo "[ci_flutter_test] ERROR: App directory not found: $APP_DIR" >&2
  exit 1
fi

(
  cd "$APP_DIR"
  flutter pub get
  CI=true flutter test -r expanded
)
