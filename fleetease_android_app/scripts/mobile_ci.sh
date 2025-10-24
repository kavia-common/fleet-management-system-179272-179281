#!/usr/bin/env bash
set -euo pipefail

# Conventional CI entrypoint: ensures Flutter runs inside the mobile app directory.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="$REPO_ROOT/fleet-management-system-179272-179281/fleetease_android_app"

echo "[scripts/mobile_ci] REPO_ROOT=$REPO_ROOT"
echo "[scripts/mobile_ci] APP_DIR=$APP_DIR"

if [ ! -d "$APP_DIR" ]; then
  echo "[scripts/mobile_ci] ERROR: App directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"
echo "[scripts/mobile_ci] PWD=$(pwd)"
flutter pub get
flutter analyze
CI=true flutter test -r expanded
echo "[scripts/mobile_ci] Success"
