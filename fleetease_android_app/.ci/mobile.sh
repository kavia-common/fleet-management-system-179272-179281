#!/usr/bin/env bash
set -euo pipefail

# .ci/mobile.sh: Conventional CI entry to run Flutter inside the app directory.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
APP_DIR="$REPO_ROOT/fleet-management-system-179272-179281/fleetease_android_app"

echo "[.ci/mobile] REPO_ROOT=$REPO_ROOT"
echo "[.ci/mobile] APP_DIR=$APP_DIR"

if [ ! -d "$APP_DIR" ]; then
  echo "[.ci/mobile] ERROR: App directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"
echo "[.ci/mobile] PWD=$(pwd)"
flutter pub get
flutter analyze
CI=true flutter test -r expanded
echo "[.ci/mobile] Success"
