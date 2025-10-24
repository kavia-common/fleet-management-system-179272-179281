# Workspace Guide

This repository contains the Flutter app at:
fleet-management-system-179272-179281/fleetease_android_app

Fix for CI error:
Error: Could not determine project root directory for Flutter project

Run Flutter commands from the app directory:
cd fleet-management-system-179272-179281/fleetease_android_app
flutter pub get
flutter analyze
CI=true flutter test

Alternatively, from repo root use helpers:
bash ci.sh
# or
bash run.sh
# or
bash build.sh
# or
make analyze
make test
# or
dart run tool/ci.dart
dart run ci_entry.dart
