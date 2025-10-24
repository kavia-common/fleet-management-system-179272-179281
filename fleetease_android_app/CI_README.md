# FleetEase Flutter CI Helper

Use the provided wrapper to ensure commands run from the app root:

Examples:
- ./flutterw analyze
- ./flutterw test
- ./flutterw pub get
- ./flutterw build apk --debug

This avoids:
> Error: Could not determine project root directory for Flutter project

From repository root, you can also use:
- bash fleet-management-system-179272-179281/run_flutter_ci_robust.sh analyze
- bash run_flutter_ci.sh analyze
