#!/usr/bin/env bash
# Prints the absolute path to the Flutter app directory.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "$ROOT_DIR/fleet-management-system-179272-179281/fleetease_android_app"
