#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"
cd "$APP_DIR"
echo "[mobile_test] PWD=$(pwd)"
flutter pub get
CI=true flutter test -r expanded
