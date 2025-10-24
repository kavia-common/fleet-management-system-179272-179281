#!/usr/bin/env bash
set -euo pipefail

# This script can be called from repository root in CI environments.
# It forwards to the Flutter app's CI script which ensures the correct working directory.
APP_SCRIPT="fleet-management-system-179272-179281/fleetease_android_app/ci_run.sh"

if [ ! -f "$APP_SCRIPT" ]; then
  echo "Error: CI script not found at $APP_SCRIPT"
  exit 1
fi

bash "$APP_SCRIPT"
