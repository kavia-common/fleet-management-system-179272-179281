#!/usr/bin/env bash
set -euo pipefail

# Run from the Flutter app directory
if [ ! -f "pubspec.yaml" ] || [ ! -d "android" ]; then
  echo "[format_and_analyze] ERROR: Must be executed from the Flutter app directory" >&2
  exit 2
fi

flutter pub get
flutter format lib test
flutter analyze
