#!/usr/bin/env bash
set -euo pipefail

# Ensure we run from the Flutter project root
cd "$(dirname "$0")/fleetease_android_app"

# Fetch deps non-interactively if needed
flutter pub get >/dev/null 2>&1 || true

# Run tests in CI-friendly mode
CI=true flutter test -r expanded
