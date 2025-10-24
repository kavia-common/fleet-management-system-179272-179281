#!/usr/bin/env bash
set -euo pipefail

# Attempt to locate the Flutter project root by finding a pubspec.yaml with "flutter:" section.
ROOT_DIR="$(pwd)"

# Prefer known location first
CANDIDATES=(
  "fleet-management-system-179272-179281/fleetease_android_app"
  "."
)

FOUND=""
for c in "${CANDIDATES[@]}"; do
  if [ -f "$c/pubspec.yaml" ]; then
    if grep -q "^flutter:" "$c/pubspec.yaml" || grep -q "^  flutter:" "$c/pubspec.yaml"; then
      FOUND="$c"
      break
    fi
  fi
done

if [ -z "$FOUND" ]; then
  # Fallback: search up to depth 3 for a pubspec with flutter section
  FOUND=$(grep -rl --include="pubspec.yaml" -n "flutter:" . | head -n 1 | xargs dirname || true)
fi

if [ -z "$FOUND" ] || [ ! -f "$FOUND/pubspec.yaml" ]; then
  echo "Error: Could not determine project root directory for Flutter project"
  exit 1
fi

cd "$FOUND"
echo "Detected Flutter project root: $(pwd)"

echo "Fetching dependencies..."
flutter pub get

echo "Running analyzer..."
flutter analyze

echo "Running tests..."
flutter test
