#!/usr/bin/env bash
# CI wrapper to run flutter analyze with explicit working directory.
# Some CI runners ignore cd; this script uses a subshell to enforce PWD.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$ROOT_DIR/fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: pubspec.yaml not found in $APP_DIR"
  exit 2
fi

# Execute in a subshell with the correct working directory.
(
  cd "$APP_DIR"
  echo "[ci] Working directory: $(pwd)"
  flutter analyze
)
