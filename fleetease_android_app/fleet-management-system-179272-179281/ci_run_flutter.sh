#!/usr/bin/env bash
# Repository-root CI wrapper for Flutter commands.
# It cd's into the app directory so tools can detect the Flutter project root.
set -euo pipefail

# Determine the path to the Flutter app relative to this script
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$ROOT_DIR/fleetease_android_app"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: pubspec.yaml not found in $APP_DIR"
  echo "[ci] Ensure the app directory is correct."
  exit 1
fi

cd "$APP_DIR"

# Delegate to the app-local script if present; fallback to direct flutter
if [ -x "./ci_run_flutter.sh" ]; then
  echo "[ci] Delegating to app-local ci_run_flutter.sh from $(pwd)"
  exec ./ci_run_flutter.sh "$@"
fi

# Fallback behavior
case "${1:-}" in
  analyze)
    echo "[ci] Running flutter analyze from: $(pwd)"
    flutter analyze
    ;;
  test)
    echo "[ci] Running flutter test from: $(pwd)"
    flutter test
    ;;
  pub)
    echo "[ci] Running flutter pub ${*:2} from: $(pwd)"
    flutter pub "${@:2}"
    ;;
  build)
    echo "[ci] Running flutter build ${*:2} from: $(pwd)"
    flutter build "${@:2}"
    ;;
  *)
    echo "[ci] Usage: $0 {analyze|test|pub|build} [args...]"
    echo "[ci] Example: $0 analyze"
    echo "[ci] Example: $0 pub get"
    echo "[ci] Example: $0 build apk --debug"
    exit 2
    ;;
esac
