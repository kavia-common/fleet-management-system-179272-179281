#!/usr/bin/env bash
set -euo pipefail

# Analyze helper to be executed from the Flutter app directory.
if [ ! -f "pubspec.yaml" ] || [ ! -d "android" ]; then
  echo "[analyze_app] ERROR: Must run from the Flutter app directory." >&2
  exit 2
fi

flutter pub get
flutter analyze
