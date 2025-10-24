# CI Runbook: Flutter Project Root

Symptom:
Error: Could not determine project root directory for Flutter project

Root Cause:
Flutter must be executed inside the app directory:
fleet-management-system-179272-179281/fleetease_android_app

Use one of the following from the repository root:

Preferred (single command):
- bash ci_entrypoint.sh analyze
- bash ci_entrypoint.sh test

Stable alternatives:
- make -f Makefile.ci analyze
- make -f Makefile.ci test
- bash ci_run.sh analyze
- bash ci_run.sh test
- bash flutter_root.sh analyze
- bash flutter_root.sh test
- bash run_flutter_ci_strict.sh analyze
- bash run_flutter_ci_strict.sh test
- bash run_flutter_with_project_root.sh analyze
- bash run_flutter_with_project_root.sh test

Manual:
- cd fleet-management-system-179272-179281/fleetease_android_app
- flutter pub get && flutter analyze
- CI=true flutter test -r expanded

Note:
The app’s entrypoint and SQLite implementation are under:
fleet-management-system-179272-179281/fleetease_android_app/lib
