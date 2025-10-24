#!/usr/bin/env bash
set -euo pipefail

cd fleet-management-system-179272-179281/fleetease_android_app
echo "[CI] PWD=$(pwd)"
flutter pub get
flutter analyze
CI=true flutter test -r expanded
