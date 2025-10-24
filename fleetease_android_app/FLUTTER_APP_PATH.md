# Flutter App Path

All Flutter commands must be executed from the app directory:

fleet-management-system-179272-179281/fleetease_android_app

Examples from repository root:
- cd fleet-management-system-179272-179281/fleetease_android_app && flutter pub get && flutter analyze
- bash run_app_analyze.sh
- bash ci_mobile.sh
- bash run_mobile_ci.sh

If you see:
  "Error: Could not determine project root directory for Flutter project"

It means Flutter was invoked from the repository root instead of the Flutter app directory above.
