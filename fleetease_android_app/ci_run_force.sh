#!/usr/bin/env bash
set -euo pipefail
# Force the working directory to the Flutter app and execute flutter in the same shell.

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -d "$APP_DIR" ]; then
  echo "[ci_run_force] ERROR: App directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"
export PWD="$(pwd)"

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
    echo "[ci_run_force] Unknown action: $ACTION"
    echo "Usage: bash ci_run_force.sh [analyze|test]"
    exit 2
    ;;
esac

echo "[ci_run_force] $ACTION completed successfully."
