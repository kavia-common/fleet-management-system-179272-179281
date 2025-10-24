#!/usr/bin/env bash
set -euo pipefail

# Ensure we are in the app directory (contains pubspec.yaml)
if [ ! -f "pubspec.yaml" ] || [ ! -d "android" ]; then
  echo "ERROR: run_analyze.sh must be executed from the Flutter app directory" >&2
  exit 2
fi

flutter pub get
flutter analyze
