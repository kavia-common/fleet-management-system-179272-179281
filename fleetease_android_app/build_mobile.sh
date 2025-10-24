#!/usr/bin/env bash
set -euo pipefail

# CI-friendly build/analyze entry for the mobile app.
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$REPO_ROOT/fleet-management-system-179272-179281/fleetease_android_app"

echo "[build_mobile] REPO_ROOT=$REPO_ROOT"
echo "[build_mobile] APP_DIR=$APP_DIR"

cd "$APP_DIR"
flutter pub get
flutter analyze
