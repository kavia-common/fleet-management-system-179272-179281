#!/usr/bin/env bash
set -euo pipefail

# Universal CI entry. It attempts multiple strategies to find and analyze the Flutter app.

try_run() {
  local dir="$1"
  if [ -d "$dir" ] && [ -f "$dir/pubspec.yaml" ] && grep -q "^flutter:" "$dir/pubspec.yaml"; then
    echo "[universal] Running in: $dir"
    (cd "$dir" && flutter pub get && flutter analyze && CI=true flutter test -r expanded)
    return 0
  fi
  return 1
}

# Preferred path
if try_run "fleet-management-system-179272-179281/fleetease_android_app"; then exit 0; fi
# Common alternate
if try_run "fleetease_android_app"; then exit 0; fi
# Repository root (in case CI synced only app)
if try_run "."; then exit 0; fi

# Discovery fallback
FOUND="$(grep -rl --include=pubspec.yaml -e '^flutter:' . | xargs -r dirname | head -n1 || true)"
if [ -n "$FOUND" ]; then
  echo "[universal] Discovered Flutter project at: $FOUND"
  (cd "$FOUND" && flutter pub get && flutter analyze && CI=true flutter test -r expanded)
  exit 0
fi

echo "[universal] ERROR: Could not find a Flutter project to analyze/test." >&2
exit 2
