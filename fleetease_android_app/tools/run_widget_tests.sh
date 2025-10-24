#!/usr/bin/env bash
set -euo pipefail

# Must run inside the Flutter app directory.
if [ ! -f "pubspec.yaml" ] || [ ! -d "android" ]; then
  echo "[run_widget_tests] ERROR: Must execute from fleet-management-system-179272-179281/fleetease_android_app" >&2
  exit 2
fi

flutter pub get
CI=true flutter test test/widget_test.dart
