#!/usr/bin/env sh
set -eu

# Minimal POSIX shell wrapper for CI environments that call:
#   sh ci_flutter_analyze.sh
# from the repository root. It runs `flutter analyze` inside the
# FleetEase Flutter app directory.

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -d "$APP_DIR" ]; then
  echo "[ci_flutter_analyze] ERROR: App directory not found: $APP_DIR" >&2
  exit 1
fi

# Use subshell to avoid changing parent shell PWD.
(
  cd "$APP_DIR"
  flutter pub get
  flutter analyze
)
