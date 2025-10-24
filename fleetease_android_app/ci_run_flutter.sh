#!/usr/bin/env bash
set -euo pipefail

# Universal CI entry to run Flutter commands from the correct directory.
# Usage examples (from repo root):
#   bash ci_run_flutter.sh analyze
#   bash ci_run_flutter.sh "test"
#   bash ci_run_flutter.sh "build apk --debug"

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "ERROR: Flutter app not found at ${APP_DIR}" >&2
  ls -la "${APP_DIR}" || true
  exit 2
fi

cd "${APP_DIR}"

# Default command
CMD="${*:-analyze}"

echo "[ci_run_flutter] In $(pwd)"
echo "[ci_run_flutter] flutter ${CMD}"

# Ensure dependencies first
flutter pub get

# shellcheck disable=SC2086
flutter ${CMD}
