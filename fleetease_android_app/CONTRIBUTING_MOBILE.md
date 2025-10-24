# Contributing (Mobile)

Flutter app location:
- fleet-management-system-179272-179281/fleetease_android_app

Run from app directory:
  cd fleet-management-system-179272-179281/fleetease_android_app
  flutter pub get
  flutter analyze
  CI=true flutter test -r expanded

From repo root, use one of:
  ./flutterw analyze && CI=true ./flutterw test -r expanded
  bash run_mobile_checks.sh
  bash run_flutter_ci_robust.sh
  bash scripts/ci_mobile.sh
  bash .ci/scripts/run_mobile.sh

If you encounter:
  "Could not determine project root directory for Flutter project"
it means Flutter ran outside the app directory. Ensure the working directory is switched to the app path above.
