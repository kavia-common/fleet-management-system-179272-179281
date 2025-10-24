#!/usr/bin/env bash
set -euo pipefail
if [ ! -f "pubspec.yaml" ] || [ ! -d "android" ]; then
  echo "[ci_guard] ERROR: This script must be executed from fleet-management-system-179272-179281/fleetease_android_app" >&2
  exit 2
fi
echo "[ci_guard] OK: In Flutter project root: $(pwd)"
flutter pub get
flutter analyze
