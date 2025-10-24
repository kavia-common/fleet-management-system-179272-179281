# FleetEase CI - How to Run Flutter Commands

The error "Could not determine project root directory for Flutter project" occurs when `flutter` is invoked from the repository root. Always execute Flutter commands from the Flutter app directory:

App directory:
- fleet-management-system-179272-179281/fleetease_android_app

Recommended single entrypoint from repository root:
- bash run_mobile_ci.sh                # runs `flutter analyze` in the app dir
- bash run_mobile_ci.sh test           # runs `flutter test` in the app dir
- bash run_mobile_ci.sh "build apk --debug"

Alternative entrypoints (also from repo root):
- bash analyze.sh
- bash test.sh
- bash ci_entry.sh
- bash ci_universal.sh

Direct inside the app directory:
```bash
cd fleet-management-system-179272-179281/fleetease_android_app
flutter pub get
flutter analyze
flutter test
```

Note:
- Do not call `flutter` directly at the repository root.
- The app already uses LocalSqliteDataSource by default (with seeding enabled).
