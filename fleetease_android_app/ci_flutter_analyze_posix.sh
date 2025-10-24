#!/bin/sh
# POSIX-compatible CI shim to run Flutter analyze from the correct app directory.
# Avoids bash-specific features so more CI shells can run it reliably.

set -eu

# Resolve repo root (directory of this script)
# shellcheck disable=SC2169,SC2039
SCRIPT="$0"
# If called via symlink, resolve once (best-effort, POSIX friendly)
if [ -L "$SCRIPT" ]; then
  # Busybox/posix: readlink may not exist; ignore failures
  TARGET=`ls -ld "$SCRIPT" 2>/dev/null | sed 's/.*-> //'` || TARGET="$SCRIPT"
  [ -n "$TARGET" ] && SCRIPT="$TARGET"
fi

# Get absolute path of script dir
# shellcheck disable=SC2039
DIR=`cd "\`dirname \"$SCRIPT\"\`" 2>/dev/null && pwd -P` || DIR="."
APP_DIR="$DIR/fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: pubspec.yaml not found in $APP_DIR" 1>&2
  exit 2
fi

# cd and run
cd "$APP_DIR"
echo "[ci] Running flutter analyze in: `pwd`"
flutter analyze
