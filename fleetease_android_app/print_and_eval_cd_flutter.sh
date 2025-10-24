#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "echo '[pe] ERROR: Flutter app not found at ${APP_DIR}' >&2; exit 2"
  exit 2
fi

CMD="${*:-analyze}"

# Print the exact command for CI to eval and run in one step
echo "cd ${APP_DIR} && flutter pub get && flutter ${CMD}"
