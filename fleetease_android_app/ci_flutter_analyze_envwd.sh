#!/usr/bin/env bash
# CI runner that sets an explicit working directory environment variable and
# runs flutter analyze from a subshell in that directory. Some CI providers
# struggle with relative paths or ignore cd in composite steps.

set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export FLUTTER_APP_DIR="${FLUTTER_APP_DIR:-$ROOT_DIR/fleet-management-system-179272-179281/fleetease_android_app}"

if [ ! -f "$FLUTTER_APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: pubspec.yaml not found in $FLUTTER_APP_DIR"
  exit 2
fi

(
  cd "$FLUTTER_APP_DIR"
  echo "[ci] PWD: $(pwd)"
  flutter pub get
  flutter analyze
)
