#!/usr/bin/env bash
# Prints the Flutter app directory in key=value format for CI parsers.
# Usage:
#   source <(./echo_flutter_app_dir.sh) && cd "$FLUTTER_APP_DIR" && flutter analyze
set -euo pipefail
APP_REL="fleet-management-system-179272-179281/fleetease_android_app"
APP_ABS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$APP_REL"
echo "FLUTTER_APP_DIR=$APP_ABS"
