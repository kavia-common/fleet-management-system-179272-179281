#!/usr/bin/env bash
set -euo pipefail

# Auto-detect the FleetEase Flutter app directory relative to repo root.
APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -d "$APP_DIR" ]; then
  echo "Error: Could not find Flutter app directory at: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"

# Default subcommand if not provided
SUBCMD="${1:-analyze}"

case "$SUBCMD" in
  analyze)
    echo "[CI] flutter pub get"
    flutter pub get
    echo "[CI] flutter analyze"
    flutter analyze
    ;;
  test)
    echo "[CI] flutter pub get"
    flutter pub get
    echo "[CI] flutter test (CI=true)"
    CI=true flutter test
    ;;
  pub)
    shift || true
    echo "[CI] flutter pub $*"
    flutter pub "$@"
    ;;
  *)
    echo "Unknown subcommand: $SUBCMD"
    echo "Usage: bash run_flutter_ci.sh [analyze|test|pub <args>]"
    exit 2
    ;;
esac

echo "[CI] Completed $SUBCMD successfully."
