#!/usr/bin/env bash
set -euo pipefail

# Runs flutter with an explicit --project-root pointing to the Flutter app to avoid
# "Could not determine project root directory for Flutter project" when CI runs from repo root.

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -d "$APP_DIR" ]; then
  echo "[ERROR] App directory not found: $APP_DIR" >&2
  exit 1
fi

ACTION="${1:-analyze}"

case "$ACTION" in
  analyze)
    echo "[RUN] flutter --project-root=\"$APP_DIR\" pub get"
    flutter --project-root="$APP_DIR" pub get
    echo "[RUN] flutter --project-root=\"$APP_DIR\" analyze"
    flutter --project-root="$APP_DIR" analyze
    ;;
  test)
    echo "[RUN] flutter --project-root=\"$APP_DIR\" pub get"
    flutter --project-root="$APP_DIR" pub get
    echo "[RUN] CI=true flutter --project-root=\"$APP_DIR\" test -r expanded"
    CI=true flutter --project-root="$APP_DIR" test -r expanded
    ;;
  *)
    echo "Usage: bash run_flutter_with_project_root.sh [analyze|test]"
    exit 2
    ;;
esac

echo "[RUN] Completed $ACTION successfully."
