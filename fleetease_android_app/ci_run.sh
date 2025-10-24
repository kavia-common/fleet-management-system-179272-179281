#!/usr/bin/env bash
set -euo pipefail

# Ensure this script runs from repository root or any location
# It will cd into the Flutter app directory before invoking Flutter commands
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$SCRIPT_DIR"

# Move to the Flutter project directory
cd "$APP_DIR"

echo "[CI] Working directory: $(pwd)"
echo "[CI] Flutter version:"
flutter --version || true

echo "[CI] Fetching packages..."
flutter pub get

echo "[CI] Running analyze..."
flutter analyze

echo "[CI] Running tests..."
# CI=true to avoid any interactive prompts
CI=true flutter test -r expanded
echo "[CI] Done."
