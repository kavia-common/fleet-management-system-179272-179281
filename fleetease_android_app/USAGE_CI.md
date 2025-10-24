# CI Usage with flutterw

This workspace contains the Flutter app in:
- fleet-management-system-179272-179281/fleetease_android_app

Use the provided flutter wrapper from repository root:

Examples:
- ./flutterw pub get
- ./flutterw analyze
- CI=true ./flutterw test -r expanded
- ./flutterw build apk --debug

Alternatively, use:
- make ci
- bash fleet-management-system-179272-179281/ci.sh
- bash fleet-management-system-179272-179281/analyze.sh
- bash fleet-management-system-179272-179281/test.sh
