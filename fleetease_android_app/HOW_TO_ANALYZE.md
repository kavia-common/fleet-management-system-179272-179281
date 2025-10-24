# How to Run Flutter Analyze (Monorepo)

Flutter commands must be executed inside the app directory:

App directory:
- fleet-management-system-179272-179281/fleetease_android_app

From repository root, run:
- bash USE_THIS_TO_ANALYZE.sh
- or bash run_app_analyze.sh
- or bash ci_mobile.sh

Directly inside the app:
```bash
cd fleet-management-system-179272-179281/fleetease_android_app
flutter pub get
flutter analyze
```
