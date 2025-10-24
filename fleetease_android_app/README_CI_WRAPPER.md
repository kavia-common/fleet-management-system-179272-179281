# CI Wrapper Usage

Some CI environments invoke `flutter` from the repository root and fail with:
> Error: Could not determine project root directory for Flutter project

Use the provided wrapper:
- bash flutterw analyze
- bash flutterw test
- bash flutterw pub get

These commands automatically locate the Flutter app directory and execute the Flutter command from within it.
