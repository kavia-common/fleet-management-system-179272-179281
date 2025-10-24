#!/usr/bin/env bash
set -euo pipefail

# This script ensures Flutter commands are executed inside the Flutter app directory
# to avoid "Could not determine project root directory for Flutter project" errors
# when CI runs from the repository root.
#
# Usage examples (from repo root):
#   bash fleet-management-system-179272-179281/run_flutter_ci_robust.sh analyze
#   bash fleet-management-system-179272-179281/run_flutter_ci_robust.sh test
#   bash fleet-management-system-179272-179281/run_flutter_ci_robust.sh pub get

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

if [ ! -d "$APP_DIR" ]; then
  echo "Error: App directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"

# Default to `analyze` if no argument provided
CMD="${1:-analyze}"

case "$CMD" in
  analyze)
    echo "Running: flutter pub get"
    flutter pub get
    echo "Running: flutter analyze"
    flutter analyze
    ;;
  test)
    echo "Running: flutter pub get"
    flutter pub get
    echo "Running: flutter test"
    # CI=true ensures non-interactive runs
    CI=true flutter test
    ;;
  pub)
    # Allow: run_flutter_ci_robust.sh pub get / upgrade / outdated
    shift || true
    echo "Running: flutter pub $*"
    flutter pub "$@"
    ;;
  build-apk-debug)
    echo "Running: flutter pub get"
    flutter pub get
    echo "Running: flutter build apk --debug"
    flutter build apk --debug
    ;;
  *)
    echo "Unknown command: $CMD"
    echo "Supported: analyze | test | pub <args> | build-apk-debug"
    exit 2
    ;;
esac

echo "Done."
