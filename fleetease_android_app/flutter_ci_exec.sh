#!/usr/bin/env bash
# Universal CI exec wrapper for Flutter commands.
# Usage examples from repo root:
#   ./flutter_ci_exec.sh analyze
#   ./flutter_ci_exec.sh test
#   ./flutter_ci_exec.sh pub get
#   ./flutter_ci_exec.sh build apk --debug
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$ROOT_DIR/fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: Could not find pubspec.yaml under: $APP_DIR"
  exit 2
fi

cd "$APP_DIR"
echo "[ci] Running: flutter $*"
exec flutter "$@"
