#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

cd "${APP_DIR}"

# Default to analyze if no args provided
if [ "$#" -eq 0 ]; then
  set -- analyze
fi

# Ensure dependencies fetched before any command
flutter pub get

# Run the requested flutter command within the app directory
flutter "$@"
