# CI Usage for FleetEase Flutter App

To avoid "Could not determine project root directory for Flutter project", always execute Flutter commands from this app directory.

From repository root, call:
- `bash ci_entrypoint.sh analyze`
- `bash ci_entrypoint.sh "pub get"`
- `bash ci_entrypoint.sh test`

Direct usage within this directory:
```bash
flutter pub get
flutter analyze
flutter test
```
