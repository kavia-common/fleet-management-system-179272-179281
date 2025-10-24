#!/usr/bin/env bash
set -euo pipefail

# GitHub-style CI entry that ensures Flutter runs from the app directory.
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")"/../.. && pwd)"
APP_DIR="$REPO_ROOT/fleet-management-system-179272-179281/fleetease_android_app"

echo "[.github/scripts/mobile_ci] REPO_ROOT=$REPO_ROOT"
echo "[.github/scripts/mobile_ci] APP_DIR=$APP_DIR"

if [ ! -d "$APP_DIR" ]; then
  echo "[.github/scripts/mobile_ci] ERROR: App directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"
echo "[.github/scripts/mobile_ci] PWD=$(pwd)"
flutter pub get
flutter analyze
CI=true flutter test -r expanded
echo "[.github/scripts/mobile_ci] Success"
