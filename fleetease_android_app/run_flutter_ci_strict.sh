#!/usr/bin/env bash
set -euo pipefail

# Strict CI entry to ensure Flutter runs from the correct app directory.
# Provides diagnostics when the directory cannot be found to help fix CI config.

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

echo "[CI] PWD: $(pwd)"
echo "[CI] Listing repo root:"
ls -la

if [ ! -d "$APP_DIR" ]; then
  echo "[CI][ERROR] Could not find app directory at: $APP_DIR" >&2
  echo "[CI] Directories at repo root:" >&2
  find . -maxdepth 3 -type d | sed 's#^\./##' | sort >&2
  exit 1
fi

echo "[CI] Changing directory to: $APP_DIR"
cd "$APP_DIR"
echo "[CI] New PWD: $(pwd)"
echo "[CI] Listing app dir:"
ls -la

SUBCMD="${1:-analyze}"

case "$SUBCMD" in
  analyze)
    echo "[CI] flutter pub get"
    flutter pub get
    echo "[CI] flutter analyze"
    flutter analyze
    ;;
  test)
    echo "[CI] flutter pub get"
    flutter pub get
    echo "[CI] CI=true flutter test"
    CI=true flutter test
    ;;
  *)
    echo "[CI] Unknown subcommand: $SUBCMD"
    echo "[CI] Usage: bash run_flutter_ci_strict.sh [analyze|test]"
    exit 2
    ;;
esac

echo "[CI] Completed $SUBCMD successfully."
