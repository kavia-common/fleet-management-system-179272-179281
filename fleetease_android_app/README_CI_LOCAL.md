# Local CI/Analyzer Usage (App Directory)

If CI or local scripts run from here (the Flutter app directory), use:

- flutter pub get
- flutter analyze
- flutter test

If you are at the repository root, run one of these to ensure Flutter executes in this directory:
- bash .ci_run.sh
- make ci-analyze
- bash ci_guard_analyze.sh
- bash run_in_app.sh analyze
- dart run tool/ci_run_flutter.dart
