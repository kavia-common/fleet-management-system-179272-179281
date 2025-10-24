#!/usr/bin/env bash
set -euo pipefail

# Resolve the absolute path to the Flutter app directory
REL_APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"
APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/${REL_APP_DIR}" && pwd -P)"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

# Default command is 'analyze'
CMD="${*:-analyze}"

echo "[run_flutter_here] App dir: ${APP_DIR}"
echo "[run_flutter_here] Command: flutter ${CMD}"

cd "${APP_DIR}"
flutter pub get
# shellcheck disable=SC2086
flutter ${CMD}
