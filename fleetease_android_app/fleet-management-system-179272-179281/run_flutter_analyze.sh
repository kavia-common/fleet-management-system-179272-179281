#!/usr/bin/env bash
set -euo pipefail

# Ensure we run analysis from the Flutter project root.
cd "$(dirname "$0")/fleetease_android_app"

# Fetch deps if not already fetched (non-interactive).
flutter pub get >/dev/null 2>&1 || true

# Run analyzer.
flutter analyze
