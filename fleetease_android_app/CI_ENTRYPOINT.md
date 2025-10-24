# Canonical CI Entrypoint

Use this from the repository root to run Flutter analysis/tests reliably:

- bash ci_universal.sh           # runs `flutter analyze` within the app dir
- bash ci_universal.sh test      # runs `flutter test` within the app dir
- bash ci_universal.sh "build apk --debug"

The script auto-detects the Flutter app directory by locating a folder that contains both `pubspec.yaml` and `android/` and then executes the passed command from there. This resolves "Could not determine project root directory for Flutter project" errors.
