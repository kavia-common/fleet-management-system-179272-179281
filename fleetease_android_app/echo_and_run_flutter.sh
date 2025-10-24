#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

CMD="${*:-analyze}"
echo "cd ${APP_DIR} && flutter pub get && flutter ${CMD}"
cd "${APP_DIR}"
flutter pub get
# shellcheck disable=SC2086
flutter ${CMD}
