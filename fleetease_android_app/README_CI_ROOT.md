Flutter CI Root

Run Flutter commands from this directory (contains pubspec.yaml):

  cd fleet-management-system-179272-179281/fleetease_android_app
  flutter pub get
  flutter analyze
  flutter test

Helper scripts:
  - ../../run_ci_from_app.sh
  - ../../detect_and_run_flutter.sh
  - ../../fleet-management-system-179272-179281/run_flutter_ci.sh
  - Makefile target: make ci
