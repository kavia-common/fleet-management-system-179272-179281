#!/usr/bin/env bash
set -euo pipefail

# Explicit CI entry that sets and echoes working directory before running Flutter
export FLUTTER_PROJECT_DIR="fleet-management-system-179272-179281/fleetease_android_app"

echo "[ci_mobile_entry] Repository root: $(pwd)"
echo "[ci_mobile_entry] FLUTTER_PROJECT_DIR=${FLUTTER_PROJECT_DIR}"

if [ ! -d "$FLUTTER_PROJECT_DIR" ]; then
  echo "[ci_mobile_entry] ERROR: Directory not found: $FLUTTER_PROJECT_DIR" >&2
  exit 21
fi

cd "$FLUTTER_PROJECT_DIR"
echo "[ci_mobile_entry] PWD=$(pwd)"
echo "[ci_mobile_entry] pubspec.yaml (first 15 lines):"
head -n 15 pubspec.yaml || true

flutter pub get
flutter analyze
CI=true flutter test -r expanded
echo "[ci_mobile_entry] Completed successfully."
