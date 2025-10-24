#!/usr/bin/env bash
set -euo pipefail

# Wrapper to ensure Flutter commands are executed from the app directory.
APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "ERROR: Flutter app not found at ${APP_DIR}" >&2
  exit 2
fi

cd "${APP_DIR}"

# If no args provided, print usage
if [ "$#" -eq 0 ]; then
  echo "Usage: ./flutterw.sh <flutter-args...>" >&2
  echo "Examples:" >&2
  echo "  ./flutterw.sh pub get" >&2
  echo "  ./flutterw.sh analyze" >&2
  echo "  ./flutterw.sh test" >&2
  echo "  ./flutterw.sh build apk --debug" >&2
  exit 1
fi

# Pass all arguments to flutter
flutter "$@"
