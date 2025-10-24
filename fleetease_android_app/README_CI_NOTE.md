# CI Note: Flutter Project Root

This repository contains the Flutter app at:
- fleet-management-system-179272-179281/fleetease_android_app

Some CI analyzers attempt to run `flutter analyze` from the repository root and fail with:
- "Could not determine project root directory for Flutter project"

Use one of these helpers from the repo root:
- ./ci_flutter_analyze.sh
- ./run_flutter_analyze.sh
- make ci-analyze   (requires make; see fleet-management-system-179272-179281/Makefile)
- fleet-management-system-179272-179281/ci_run_flutter.sh analyze

Or change directory manually:
- cd fleet-management-system-179272-179281/fleetease_android_app && flutter analyze
