#!/usr/bin/env bash
# CI init hook to ensure the correct Flutter project working directory.
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ -d "$APP_DIR" ]; then
  echo "[.ci-init] Changing directory to: $APP_DIR"
  cd "$APP_DIR" || exit 1
  # Export PWD for subsequent steps that run 'flutter' directly
  export PWD
  echo "[.ci-init] Now in: $PWD"
else
  echo "[.ci-init] WARNING: App directory not found: $APP_DIR"
fi
