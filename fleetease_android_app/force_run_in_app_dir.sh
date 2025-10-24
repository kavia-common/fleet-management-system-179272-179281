#!/usr/bin/env bash
set -euo pipefail

# Resolve repository root absolute path
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$REPO_ROOT/fleet-management-system-179272-179281/fleetease_android_app"

echo "[force_run_in_app_dir] REPO_ROOT=$REPO_ROOT"
echo "[force_run_in_app_dir] APP_DIR=$APP_DIR"

if [ ! -d "$APP_DIR" ]; then
  echo "[force_run_in_app_dir] ERROR: App directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"
echo "[force_run_in_app_dir] PWD=$(pwd)"

flutter pub get
flutter analyze
CI=true flutter test -r expanded
echo "[force_run_in_app_dir] Completed successfully."
