# CI Maintainers Guide

This repository contains the Flutter app at:
- fleet-management-system-179272-179281/fleetease_android_app

Many CI tools assume the Flutter project is at the repository root. Use one of these entry points to ensure the working directory is correct:

Recommended single entry:
- bash run_mobile_checks.sh

Alternatives from repository root:
- ./flutterw analyze
- ./flutterw test -r expanded
- bash fleet-management-system-179272-179281/ci.sh
- bash fleet-management-system-179272-179281/analyze.sh
- bash fleet-management-system-179272-179281/test.sh
- bash analyze.sh
- bash test.sh
- bash ci_entry.sh
- bash detect_flutter_project.sh
- ./mobile_analyze.sh
- ./mobile_test.sh

Troubleshooting:
- Error: "Could not determine project root directory for Flutter project" means Flutter ran outside the app directory.
- Ensure CI runs commands within fleet-management-system-179272-179281/fleetease_android_app.
- If your CI can only run a single script, use run_mobile_checks.sh from repo root.
