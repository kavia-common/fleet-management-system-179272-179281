#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ] || [ ! -d "${APP_DIR}/android" ]; then
  echo "[ci_print_and_run_analyze] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

CMD="cd ${APP_DIR} && flutter pub get && flutter analyze"
echo "${CMD}"
# Now execute the printed command to satisfy CI that needs both echo and run
bash -lc "${CMD}"
