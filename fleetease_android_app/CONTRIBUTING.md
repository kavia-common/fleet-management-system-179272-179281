# Contributing & CI Guidance

This mono-repo contains the Flutter app at:
fleet-management-system-179272-179281/fleetease_android_app

IMPORTANT: Many CI runners invoke `flutter` from the repository root, which fails with:
Error: Could not determine project root directory for Flutter project

Run Flutter commands from the app directory:
cd fleet-management-system-179272-179281/fleetease_android_app
flutter pub get
flutter analyze
CI=true flutter test

Convenient root helpers (use one of):
- bash ci.sh
- bash run.sh
- bash build.sh
- bash run_flutter_checks.sh
- make analyze
- make test
- dart run tool/ci.dart
- dart run ci_entry.dart

Environment:
- You may set DATA_SOURCE=sqlite to use the persistent SQLite data source
- Defaults to memory if not set (development/CI friendly)

Troubleshooting:
- Ensure working directory is fleet-management-system-179272-179281/fleetease_android_app
- Ensure Flutter SDK is available in PATH
- Run flutter doctor for environment validation
