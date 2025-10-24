#!/usr/bin/env bash
set -euo pipefail

# Execute from the Flutter app directory.
if [ ! -f "pubspec.yaml" ] || [ ! -d "android" ]; then
  echo "[run_tests] ERROR: Must run inside the Flutter app directory" >&2
  exit 2
fi

flutter pub get
CI=true flutter test
