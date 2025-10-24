#!/usr/bin/env bash
set -euo pipefail

# Universal CI runner for Flutter in monorepos.
# Auto-detects the Flutter app directory by scanning for pubspec.yaml + android/
# and runs the provided flutter subcommand from there.
#
# Usage (from repo root):
#   bash ci_universal.sh           # defaults to analyze
#   bash ci_universal.sh test
#   bash ci_universal.sh "build apk --debug"

CMD="${*:-analyze}"

# First, prefer known path
KNOWN="fleet-management-system-179272-179281/fleetease_android_app"
if [ -f "$KNOWN/pubspec.yaml" ] && [ -d "$KNOWN/android" ]; then
  APP_DIR="$KNOWN"
else
  # Fallback: scan up to depth 5 for Flutter app dirs
  APP_DIR=""
  while IFS= read -r -d '' pubspec; do
    dir="$(dirname "$pubspec")"
    if [ -d "$dir/android" ]; then
      APP_DIR="$dir"
      break
    fi
  done < <(find . -maxdepth 5 -name pubspec.yaml -print0)

  if [ -z "${APP_DIR}" ]; then
    echo "[ci_universal] ERROR: Could not locate Flutter app (pubspec.yaml + android/) in repository." >&2
    exit 2
  fi
fi

echo "[ci_universal] Using Flutter app at: ${APP_DIR}"
cd "${APP_DIR}"

# Ensure dependencies then run the requested command
flutter pub get
# shellcheck disable=SC2086
flutter ${CMD}
