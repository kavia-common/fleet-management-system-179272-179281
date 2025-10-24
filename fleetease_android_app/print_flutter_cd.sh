#!/usr/bin/env bash
set -euo pipefail
APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"
if [ -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "cd ${APP_DIR}"
  exit 0
else
  echo "echo 'ERROR: Flutter app not found at ${APP_DIR}' >&2; exit 2"
  exit 2
fi
