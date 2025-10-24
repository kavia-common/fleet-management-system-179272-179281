# Repository Layout and CI Execution

This repository contains the Flutter app at:
- fleet-management-system-179272-179281/fleetease_android_app

If your CI runs `flutter analyze` or `flutter test` from the repository root, it will fail with:
- "Could not determine project root directory for Flutter project"

Use one of these from the repository root:
- cd fleet-management-system-179272-179281/fleetease_android_app && flutter pub get && flutter analyze
- ./ci_flutter_analyze_any.sh
- ./flutter_ci_exec.sh analyze
- make -C fleet-management-system-179272-179281 ci-analyze
- ./run_flutter_ci.sh

To run tests from the repo root:
- ./ci_flutter_test.sh
