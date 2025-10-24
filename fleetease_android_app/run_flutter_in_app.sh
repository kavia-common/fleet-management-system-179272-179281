#!/usr/bin/env bash
set -euo pipefail

# Dynamically find the Flutter application (directory containing pubspec.yaml and android/)
APP_DIR=""

# Preferred known path first
PREFERRED="fleet-management-system-179272-179281/fleetease_android_app"
if [ -f "$PREFERRED/pubspec.yaml" ] && [ -d "$PREFERRED/android" ]; then
  APP_DIR="$PREFERRED"
else
  # Fallback: search for a pubspec with android folder within repo
  while IFS= read -r -d '' f; do
    dir="$(dirname "$f")"
    if [ -d "$dir/android" ]; then
      APP_DIR="$dir"
      break
    fi
  done < <(find . -maxdepth 4 -name pubspec.yaml -print0)
fi

if [ -z "${APP_DIR}" ]; then
  echo "ERROR: Could not locate Flutter project directory (no pubspec.yaml + android/ found)" >&2
  exit 2
fi

echo "[run] Using Flutter app at: ${APP_DIR}"

cd "${APP_DIR}"

if [ "$#" -eq 0 ]; then
  echo "Usage: ./run_flutter_in_app.sh <flutter args...>" >&2
  echo "Examples:" >&2
  echo "  ./run_flutter_in_app.sh pub get" >&2
  echo "  ./run_flutter_in_app.sh analyze" >&2
  echo "  ./run_flutter_in_app.sh test" >&2
  exit 1
fi

flutter "$@"
