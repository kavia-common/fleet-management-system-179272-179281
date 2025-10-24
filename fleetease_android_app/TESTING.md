# Testing Instructions

Flutter app root:
  fleet-management-system-179272-179281/fleetease_android_app

Run full test suite:
  cd fleet-management-system-179272-179281/fleetease_android_app
  flutter pub get
  flutter test

Run pure-Dart tests only:
  bash fleet-management-system-179272-179281/run_pure_dart_tests.sh

Tip:
If CI reports "Could not determine project root directory for Flutter project",
ensure the working directory is the app root before invoking Flutter.
