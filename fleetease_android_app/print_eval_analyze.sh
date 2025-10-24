#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "echo '[print_eval_analyze] ERROR: Flutter app not found at ${APP_DIR}' >&2; exit 2"
  exit 2
fi

# Print a single command for CI to eval and execute in one step
echo "cd ${APP_DIR} && flutter pub get && flutter analyze"
