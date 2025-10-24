#!/usr/bin/env bash
set -euo pipefail

# Must run inside the Flutter app directory.
if [ ! -f "pubspec.yaml" ] || [ ! -d "android" ]; then
  echo "[clean_and_analyze] ERROR: Must execute from fleet-management-system-179272-179281/fleetease_android_app" >&2
  exit 2
fi

flutter --version || true
flutter clean
flutter pub get
flutter analyze
