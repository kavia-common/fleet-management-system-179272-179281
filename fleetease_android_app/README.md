# FleetEase Workspace

This repository is a workspace that contains the Flutter app at:
- fleet-management-system-179272-179281/fleetease_android_app

Run Flutter commands inside that directory or use the helper scripts from repo root:

- bash fleet-management-system-179272-179281/ci.sh
- bash fleet-management-system-179272-179281/run_ci_from_root.sh
- bash fleet-management-system-179272-179281/analyze.sh
- bash fleet-management-system-179272-179281/test.sh

Typical usage:
```bash
cd fleet-management-system-179272-179281/fleetease_android_app
flutter pub get
flutter analyze
CI=true flutter test -r expanded
```

The workspace includes a minimal pubspec.yaml at the repository root to accommodate CI tools that require detecting a Dart/Flutter project at root. It is not a Flutter app; do not run `flutter run` here.
