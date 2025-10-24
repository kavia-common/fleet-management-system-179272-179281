#!/usr/bin/env bash
set -euo pipefail

# Ensure we always run Flutter from the app directory to avoid:
# "Could not determine project root directory for Flutter project"
APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "ERROR: Flutter app not found at ${APP_DIR}"
  exit 2
fi

cd "${APP_DIR}"

# Fetch dependencies and analyze
flutter pub get
flutter analyze
