#!/usr/bin/env bash
set -euo pipefail

# Attempts to locate a Flutter project by searching for pubspec.yaml that contains "flutter:"
# Then runs flutter analyze inside that directory.

search_paths=(
  "."
  "fleetease_android_app"
  "fleet-management-system-179272-179281/fleetease_android_app"
  "fleet-management-system-179272-179281"
)

FOUND_DIR=""
for p in "${search_paths[@]}"; do
  if [ -f "$p/pubspec.yaml" ]; then
    # Quick heuristic to ensure it's a Flutter project (has flutter: section)
    if grep -q "flutter:" "$p/pubspec.yaml"; then
      FOUND_DIR="$p"
      break
    fi
  fi
done

if [ -z "$FOUND_DIR" ]; then
  # Fallback: find any pubspec.yaml under repo that contains flutter:
  FOUND_DIR="$(grep -rl --include="pubspec.yaml" -e '^flutter:' . | xargs -r dirname | head -n1 || true)"
fi

if [ -z "$FOUND_DIR" ]; then
  echo "[discover_and_analyze] Could not locate a Flutter project with a pubspec.yaml containing 'flutter:'" >&2
  echo "[discover_and_analyze] Searched paths: ${search_paths[*]}" >&2
  exit 1
fi

echo "[discover_and_analyze] Found Flutter project at: $FOUND_DIR"
cd "$FOUND_DIR"

echo "[discover_and_analyze] Running flutter pub get..."
flutter pub get

echo "[discover_and_analyze] Running flutter analyze..."
flutter analyze
