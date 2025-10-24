#!/usr/bin/env bash
set -euo pipefail

# CI helper: always run Flutter commands from the app directory.
APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "Error: Flutter app directory not found at $APP_DIR"
  exit 1
fi

cd "$APP_DIR"
echo "CI working directory: $(pwd)"

flutter --version
flutter pub get
flutter analyze
flutter test
