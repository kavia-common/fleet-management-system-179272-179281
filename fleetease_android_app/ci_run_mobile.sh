#!/usr/bin/env bash
set -euo pipefail

# Absolute path to repo root
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$REPO_ROOT/fleet-management-system-179272-179281/fleetease_android_app"

echo "[ci_run_mobile] REPO_ROOT=$REPO_ROOT"
echo "[ci_run_mobile] APP_DIR=$APP_DIR"

if [ ! -d "$APP_DIR" ]; then
  echo "[ci_run_mobile] ERROR: Flutter app directory not found: $APP_DIR" >&2
  exit 4
fi

cd "$APP_DIR"
echo "[ci_run_mobile] PWD=$(pwd)"

flutter pub get
flutter analyze
CI=true flutter test -r expanded

echo "[ci_run_mobile] OK"
