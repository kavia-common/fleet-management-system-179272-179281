#!/usr/bin/env bash
set -euo pipefail

# Single CI entrypoint to run Flutter from the correct directory.
APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[ci_run] ERROR: Flutter app not found at ${APP_DIR}" >&2
  ls -la "${APP_DIR}" || true
  exit 2
fi

cd "${APP_DIR}"
echo "[ci_run] PWD=$(pwd)"
flutter --version || true
flutter pub get
flutter analyze
