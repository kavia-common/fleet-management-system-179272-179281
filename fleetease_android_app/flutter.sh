#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[flutter.sh] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

cd "${APP_DIR}"

if [ "$#" -eq 0 ]; then
  echo "Usage: bash flutter.sh <flutter args...>" >&2
  echo "Examples:" >&2
  echo "  bash flutter.sh pub get" >&2
  echo "  bash flutter.sh analyze" >&2
  echo "  bash flutter.sh test" >&2
  echo "  bash flutter.sh build apk --debug" >&2
  exit 1
fi

flutter "$@"
