#!/usr/bin/env bash
set -euo pipefail

# Canonical CI entrypoint for the Flutter mobile app in this repository.
# Run from repository root:
#   bash ci_mobile.sh            # analyze + test
#   bash ci_mobile.sh analyze    # analyze only
#   bash ci_mobile.sh test       # test only

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ] || [ ! -d "${APP_DIR}/android" ]; then
  echo "[ci_mobile] ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

ACTION="${1:-all}"

cd "${APP_DIR}"
echo "[ci_mobile] PWD=$(pwd)"
flutter --version || true
flutter pub get

case "${ACTION}" in
  analyze)
    flutter analyze
    ;;
  test)
    CI=true flutter test
    ;;
  all)
    flutter analyze
    CI=true flutter test
    ;;
  *)
    echo "[ci_mobile] Usage: bash ci_mobile.sh [analyze|test|all]" >&2
    exit 1
    ;;
esac
