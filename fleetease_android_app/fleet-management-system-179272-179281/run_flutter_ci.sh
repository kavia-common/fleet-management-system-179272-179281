#!/usr/bin/env bash
set -euo pipefail

# Ensure all Flutter commands run from the app root so tools can discover the project
cd "fleet-management-system-179272-179281/fleetease_android_app"

echo "Running: flutter pub get"
flutter pub get

echo "Running: flutter analyze"
flutter analyze

echo "Running: flutter test"
flutter test
