#!/usr/bin/env bash
set -euo pipefail

# Run from the Flutter app directory only.
if [ ! -f "pubspec.yaml" ] || [ ! -d "android" ]; then
  echo "[ci_all] ERROR: Must execute from fleet-management-system-179272-179281/fleetease_android_app" >&2
  exit 2
fi

flutter --version || true
flutter pub get
flutter analyze
CI=true flutter test
