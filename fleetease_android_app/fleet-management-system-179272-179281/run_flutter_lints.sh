#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -d "$APP_DIR" ]; then
  echo "Error: Flutter app directory not found at $APP_DIR"
  exit 1
fi

cd "$APP_DIR"

# Ensure dependencies are ready (ignore failures in dry CI envs)
flutter pub get >/dev/null 2>&1 || true

# Run analyzer
flutter analyze
