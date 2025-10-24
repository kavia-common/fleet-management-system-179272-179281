#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

echo "[run_mobile_checks] Repository root: $(pwd)"
echo "[run_mobile_checks] Expected Flutter app directory: $APP_DIR"

if [ ! -d "$APP_DIR" ]; then
  echo "[run_mobile_checks] ERROR: Flutter app directory not found at '$APP_DIR'." >&2
  exit 11
fi

# Validate that it's a Flutter project by checking pubspec contains 'flutter:'
if [ ! -f "$APP_DIR/pubspec.yaml" ] || ! grep -q "^flutter:" "$APP_DIR/pubspec.yaml"; then
  echo "[run_mobile_checks] ERROR: '$APP_DIR' does not look like a Flutter project (missing pubspec with flutter:)." >&2
  exit 12
fi

cd "$APP_DIR"
echo "[run_mobile_checks] Changed directory to: $(pwd)"
echo "[run_mobile_checks] Running flutter pub get..."
flutter pub get

echo "[run_mobile_checks] Running flutter analyze..."
flutter analyze

echo "[run_mobile_checks] Running flutter tests..."
CI=true flutter test -r expanded

echo "[run_mobile_checks] All checks passed."
