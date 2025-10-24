#!/usr/bin/env bash
set -euo pipefail

# Auto-discover a Flutter project by locating the first pubspec.yaml that contains "flutter:".
# Then cd into that directory and run the requested Flutter command.
# Usage:
#   bash run_flutter_ci_autodiscover.sh analyze
#   bash run_flutter_ci_autodiscover.sh test
#   bash run_flutter_ci_autodiscover.sh pub get

echo "[AutoCI] PWD: $(pwd)"
echo "[AutoCI] Searching for Flutter pubspec.yaml..."

APP_DIR="$(grep -RIl --include='pubspec.yaml' '^flutter:' . | head -n 1 | xargs -I{} dirname "{}" || true)"

if [ -z "${APP_DIR}" ] || [ ! -d "${APP_DIR}" ]; then
  echo "[AutoCI][ERROR] Could not auto-discover Flutter app directory (no pubspec.yaml with 'flutter:' found)." >&2
  echo "[AutoCI] Repository tree (depth=3):" >&2
  find . -maxdepth 3 -type d | sed 's#^\./##' | sort >&2
  exit 1
fi

echo "[AutoCI] Discovered app directory: ${APP_DIR}"
cd "${APP_DIR}"
echo "[AutoCI] Entered: $(pwd)"

SUBCMD="${1:-analyze}"
shift || true

case "$SUBCMD" in
  analyze)
    echo "[AutoCI] flutter pub get"
    flutter pub get
    echo "[AutoCI] flutter analyze"
    flutter analyze
    ;;
  test)
    echo "[AutoCI] flutter pub get"
    flutter pub get
    echo "[AutoCI] CI=true flutter test"
    CI=true flutter test
    ;;
  pub)
    echo "[AutoCI] flutter pub $*"
    flutter pub "$@"
    ;;
  *)
    echo "[AutoCI] Unknown subcommand: $SUBCMD"
    echo "Usage: bash run_flutter_ci_autodiscover.sh [analyze|test|pub <args>]"
    exit 2
    ;;
esac

echo "[AutoCI] Completed $SUBCMD successfully."
