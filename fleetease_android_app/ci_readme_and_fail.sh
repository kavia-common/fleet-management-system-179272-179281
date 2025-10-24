#!/usr/bin/env bash
# This script intentionally fails with clear instructions if Flutter is run from the repo root.
# Some CI systems call a single script; use this to force the correct working directory.

set -euo pipefail

APP_REL="fleet-management-system-179272-179281/fleetease_android_app"

cat >&2 <<'EOF'
[ci] ERROR: Flutter commands must be run from the Flutter app directory.
[ci] The Flutter app for this repo is located at:
[ci]   fleet-management-system-179272-179281/fleetease_android_app

[ci] From repository root, use any of these:
[ci]   cd fleet-management-system-179272-179281/fleetease_android_app && flutter pub get && flutter analyze
[ci]   ./ci_run_flutter.sh analyze
[ci]   ./ci_flutter_all.sh
[ci]   make analyze
[ci]   ./analyze.sh
[ci]   ./ci_flutter_analyze_any.sh
[ci]   ./ci_dart_run_analyze.sh

[ci] To run tests:
[ci]   cd fleet-management-system-179272-179281/fleetease_android_app && flutter test
[ci]   ./ci_run_flutter.sh test

[ci] Hint: set FLUTTER_APP_DIR env var to override the app path in helper scripts.

EOF

echo "[ci] Detected app path (relative): $APP_REL" >&2
exit 2
