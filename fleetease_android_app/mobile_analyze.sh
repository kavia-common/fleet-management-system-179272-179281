#!/usr/bin/env bash
set -euo pipefail

# Some CI pipelines call 'mobile_analyze.sh' implicitly. Ensure we run from the app dir.
APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"
cd "$APP_DIR"
echo "[mobile_analyze] PWD=$(pwd)"
flutter pub get
flutter analyze
