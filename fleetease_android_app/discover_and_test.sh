#!/usr/bin/env bash
set -euo pipefail

search_paths=(
  "."
  "fleetease_android_app"
  "fleet-management-system-179272-179281/fleetease_android_app"
  "fleet-management-system-179272-179281"
)

FOUND_DIR=""
for p in "${search_paths[@]}"; do
  if [ -f "$p/pubspec.yaml" ]; then
    if grep -q "flutter:" "$p/pubspec.yaml"; then
      FOUND_DIR="$p"
      break
    fi
  fi
done

if [ -z "$FOUND_DIR" ]; then
  FOUND_DIR="$(grep -rl --include="pubspec.yaml" -e '^flutter:' . | xargs -r dirname | head -n1 || true)"
fi

if [ -z "$FOUND_DIR" ]; then
  echo "[discover_and_test] Could not locate a Flutter project with a pubspec.yaml containing 'flutter:'" >&2
  exit 1
fi

echo "[discover_and_test] Found Flutter project at: $FOUND_DIR"
cd "$FOUND_DIR"

echo "[discover_and_test] Running flutter pub get..."
flutter pub get

echo "[discover_and_test] Running tests..."
CI=true flutter test -r expanded
