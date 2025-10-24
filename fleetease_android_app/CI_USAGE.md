# CI Usage Notes

To prevent the common error:
> Error: Could not determine project root directory for Flutter project

Ensure Flutter commands are executed inside the FleetEase Flutter app directory.

Options:

1) Use the root helper:
   bash run_flutter_ci.sh analyze
   bash run_flutter_ci.sh test

2) Or call the project-scoped helper:
   bash fleet-management-system-179272-179281/run_flutter_ci_robust.sh analyze

3) Or change directory first:
   cd fleet-management-system-179272-179281/fleetease_android_app
   flutter pub get && flutter analyze
   CI=true flutter test
