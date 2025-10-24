#!/usr/bin/env bash
set -euo pipefail

# Standard CI entry for mobile. Many orchestrators auto-detect scripts under scripts/.
# This script ensures Flutter runs inside the app directory.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="$REPO_ROOT/fleet-management-system-179272-179281/fleetease_android_app"

echo "[scripts/ci_mobile] REPO_ROOT=$REPO_ROOT"
echo "[scripts/ci_mobile] APP_DIR=$APP_DIR"

if [ ! -d "$APP_DIR" ]; then
  echo "[scripts/ci_mobile] ERROR: App directory not found at: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"
echo "[scripts/ci_mobile] PWD=$(pwd)"
flutter --version || true
flutter pub get
flutter analyze
CI=true flutter test -r expanded
echo "[scripts/ci_mobile] Success"
