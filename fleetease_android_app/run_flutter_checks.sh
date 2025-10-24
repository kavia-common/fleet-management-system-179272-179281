#!/usr/bin/env bash
# Universal CI entrypoint to run Flutter analyze and tests from the correct app directory.
# It searches for a pubspec.yaml that contains a Flutter app (android/ present) and runs checks there.
set -euo pipefail

# Prefer the known app path if it exists
KNOWN_APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

find_flutter_app_dir() {
  if [ -f "$KNOWN_APP_DIR/pubspec.yaml" ] && [ -d "$KNOWN_APP_DIR/android" ]; then
    echo "$KNOWN_APP_DIR"
    return 0
  fi

  # Fallback: search for pubspec.yaml that also has android/ folder (Flutter app)
  while IFS= read -r -d '' file; do
    dir="$(dirname "$file")"
    if [ -d "$dir/android" ]; then
      echo "$dir"
      return 0
    fi
  done < <(find . -type f -name pubspec.yaml -print0)

  return 1
}

APP_DIR="$(find_flutter_app_dir || true)"

if [ -z "${APP_DIR:-}" ]; then
  echo "[run_flutter_checks] ERROR: Could not locate a Flutter app directory (with pubspec.yaml and android/)" >&2
  exit 2
fi

echo "[run_flutter_checks] Using Flutter app directory: $APP_DIR"
cd "$APP_DIR"

echo "[run_flutter_checks] Running flutter pub get..."
flutter pub get

echo "[run_flutter_checks] Running flutter analyze..."
flutter analyze

echo "[run_flutter_checks] Running widget tests..."
CI=true flutter test
