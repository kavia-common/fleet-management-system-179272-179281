# FleetEase CI Guidance

Some CI runners invoke Flutter commands from the repository root and error with:
Error: Could not determine project root directory for Flutter project

Use one of these from repo root:
- bash run_flutter_checks.sh
- make analyze
- make test
- bash flutter_ci.sh
- bash ci_run.sh

Or run commands directly from the app directory:
cd fleet-management-system-179272-179281/fleetease_android_app
flutter pub get
flutter analyze
CI=true flutter test

Notes:
- The Flutter app lives under fleet-management-system-179272-179281/fleetease_android_app
- Helpers provided at repo root will cd into the app directory before running analyze/tests.
