#!/usr/bin/env bash
# CI wrapper that uses a Dart tool to discover the Flutter app directory
# and then runs flutter analyze from there.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

if ! command -v dart >/dev/null 2>&1; then
  echo "[ci] ERROR: Dart SDK is not available on PATH."
  exit 2
fi

APP_DIR="$(dart run tools/find_flutter_app.dart)"
echo "[ci] Flutter app detected at: $APP_DIR"
cd "$APP_DIR"

echo "[ci] Running flutter pub get..."
flutter pub get

echo "[ci] Running flutter analyze..."
flutter analyze
