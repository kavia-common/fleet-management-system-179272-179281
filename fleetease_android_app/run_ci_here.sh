#!/usr/bin/env bash
set -euo pipefail

# Run CI steps from the Flutter app root.
# You can call this script from anywhere: it will cd to this folder and run flutter steps.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Running Flutter CI from: $(pwd)"
flutter pub get
flutter analyze
flutter test
