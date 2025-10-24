#!/usr/bin/env bash
set -euo pipefail

# Ensure we execute Flutter commands from the actual app directory so tools
# can detect the project root correctly.
cd "fleet-management-system-179272-179281/fleetease_android_app"

echo "Current directory: $(pwd)"
echo "Fetching dependencies..."
flutter pub get

echo "Running analyzer..."
flutter analyze

echo "Running tests..."
flutter test
