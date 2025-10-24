# CI Maintainers Guide

If you see:
> Error: Could not determine project root directory for Flutter project

It means your CI is running `flutter` from the repository root instead of the Flutter app directory.

Use one of these options in your CI job step:

1) Auto-discover the Flutter app:
   bash run_flutter_ci_autodiscover.sh analyze
   bash run_flutter_ci_autodiscover.sh test

2) Call strict runner with explicit path:
   bash run_flutter_ci_strict.sh analyze
   bash run_flutter_ci_strict.sh test

3) Use Makefile targets (from repo root):
   make analyze
   make test

4) Change directory before running Flutter:
   cd fleet-management-system-179272-179281/fleetease_android_app
   flutter pub get && flutter analyze
   CI=true flutter test

Any of these ensure Flutter runs inside the correct project root.
