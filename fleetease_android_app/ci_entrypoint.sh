#!/usr/bin/env bash
set -euo pipefail
# Unified CI entrypoint. Always cd into the Flutter app before running Flutter.
# Usage:
#   bash ci_entrypoint.sh analyze
#   bash ci_entrypoint.sh test

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -d "$APP_DIR" ]; then
  echo "[ci_entrypoint] ERROR: App directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"

ACTION="${1:-analyze}"
case "$ACTION" in
  analyze)
    flutter pub get
    flutter analyze
    ;;
  test)
    flutter pub get
    CI=true flutter test -r expanded
    ;;
  *)
    echo "[ci_entrypoint] Unknown action: $ACTION"
    echo "Usage: bash ci_entrypoint.sh [analyze|test]"
    exit 2
    ;;
esac

echo "[ci_entrypoint] $ACTION completed successfully."
