#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

echo "[run_flutter_ci] Repository root: $(pwd)"
echo "[run_flutter_ci] Expected Flutter app directory: $APP_DIR"

if [ ! -d "$APP_DIR" ]; then
  echo "[run_flutter_ci] ERROR: Flutter app directory not found at '$APP_DIR'." >&2
  echo "[run_flutter_ci] Available directories at repo root:" >&2
  ls -la >&2
  exit 2
fi

cd "$APP_DIR"
echo "[run_flutter_ci] Changed directory to: $(pwd)"
echo "[run_flutter_ci] pubspec.yaml contents (first 20 lines):"
head -n 20 pubspec.yaml || true

echo "[run_flutter_ci] Running flutter pub get..."
flutter pub get

echo "[run_flutter_ci] Running flutter analyze..."
flutter analyze

echo "[run_flutter_ci] Running flutter tests..."
CI=true flutter test -r expanded
echo "[run_flutter_ci] Success."
