#!/usr/bin/env bash
# Runs Flutter commands from the directory specified in ci_flutter_config.json.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$ROOT_DIR/ci_flutter_config.json"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "[ci] ERROR: Missing $CONFIG_FILE"
  exit 2
fi

APP_DIR="$(grep -o '\"flutter_app_dir\"\\s*:\\s*\"[^\"]*\"' "$CONFIG_FILE" | sed 's/.*: *\"//; s/\"$//')"
if [ -z "${APP_DIR:-}" ]; then
  echo "[ci] ERROR: Could not parse flutter_app_dir from $CONFIG_FILE"
  exit 2
fi

FULL_APP_DIR="$ROOT_DIR/$APP_DIR"
if [ ! -f "$FULL_APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: pubspec.yaml not found at $FULL_APP_DIR"
  exit 2
fi

cd "$FULL_APP_DIR"
echo "[ci] Using Flutter app at: $(pwd)"

CMD="${1:-analyze}"
shift || true

case "$CMD" in
  analyze)
    flutter pub get
    exec flutter analyze "$@"
    ;;
  test)
    flutter pub get
    exec flutter test "$@"
    ;;
  pub-get|pub_get|pub)
    exec flutter pub get
    ;;
  build)
    exec flutter build "$@"
    ;;
  *)
    echo "[ci] Unknown command: $CMD"
    echo "[ci] Supported: analyze | test | pub-get | build"
    exit 2
    ;;
esac
