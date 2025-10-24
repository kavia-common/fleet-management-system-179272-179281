#!/usr/bin/env bash
set -euo pipefail
# Simple proxy to run flutter commands within the FleetEase app directory.
# Usage examples:
#   bash flutter_root.sh analyze
#   bash flutter_root.sh test
#   bash flutter_root.sh pub get

APP_WRAPPER="fleet-management-system-179272-179281/fleetease_android_app/flutterw"

if [ ! -f "$APP_WRAPPER" ]; then
  echo "[flutter_root] Error: App wrapper not found at $APP_WRAPPER" >&2
  exit 1
fi

bash "$APP_WRAPPER" "$@"
