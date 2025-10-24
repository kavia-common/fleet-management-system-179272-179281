#!/usr/bin/env bash
set -euo pipefail

# Run Flutter analysis from within the Flutter app directory.
if [ ! -f "pubspec.yaml" ]; then
  echo "[analyze_app.sh] ERROR: Not in Flutter app directory (pubspec.yaml missing)" >&2
  exit 2
fi

flutter pub get
flutter analyze
