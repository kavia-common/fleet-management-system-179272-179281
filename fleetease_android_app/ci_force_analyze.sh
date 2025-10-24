#!/usr/bin/env bash
set -euo pipefail

# Force run flutter analyze inside the app directory using a login shell.
APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[ci_force_analyze] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

# Ensure scripts are executable for CI
chmod +x "${BASH_SOURCE[0]}" || true

# Execute via bash -lc to simulate CI shell and ensure PATH/env are applied
bash -lc "cd '${APP_DIR}' && flutter pub get && flutter analyze"
