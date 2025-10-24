#!/usr/bin/env bash
set -euo pipefail

# Universal mobile CI runner for the Flutter app in this repo.
# Usage examples (from repo root):
#   bash run_mobile_ci.sh                # defaults to analyze
#   bash run_mobile_ci.sh test
#   bash run_mobile_ci.sh "build apk --debug"

CMD="${*:-analyze}"

# Known app path first
KNOWN="fleet-management-system-179272-179281/fleetease_android_app"
APP_DIR=""
if [ -f "$KNOWN/pubspec.yaml" ] && [ -d "$KNOWN/android" ]; then
  APP_DIR="$KNOWN"
else
  # Fallback detection: look for pubspec.yaml + android folder up to depth 6
  while IFS= read -r -d '' p; do
    d="$(dirname "$p")"
    if [ -d "$d/android" ]; then
      APP_DIR="$d"
      break
    fi
  done < <(find . -maxdepth 6 -name pubspec.yaml -print0)
fi

if [ -z "$APP_DIR" ]; then
  echo "[run_mobile_ci] ERROR: Could not locate Flutter app directory (needs pubspec.yaml and android/)." >&2
  exit 2
fi

echo "[run_mobile_ci] Using Flutter app at: $APP_DIR"
cd "$APP_DIR"

# Ensure dependencies and run requested flutter command
flutter pub get
# shellcheck disable=SC2086
flutter ${CMD}
