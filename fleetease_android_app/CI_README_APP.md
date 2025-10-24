# FleetEase App CI Instructions

If CI logs show:
> Error: Could not determine project root directory for Flutter project

Run Flutter from this app directory (not the repository root).

From repo root, choose any one of the following:
- bash ci_run.sh analyze
- bash ci_run.sh test
- bash run_flutter_ci_strict.sh analyze
- bash run_flutter_ci_strict.sh test
- bash run_flutter_with_project_root.sh analyze
- bash run_flutter_with_project_root.sh test
- make -f Makefile.ci analyze
- make -f Makefile.ci test
- bash flutter_root.sh analyze
- bash flutter_root.sh test

Manual option:
- cd fleet-management-system-179272-179281/fleetease_android_app
- flutter pub get && flutter analyze
- CI=true flutter test -r expanded
