import 'dart:io';

/// PUBLIC_INTERFACE
/// Prints the absolute path to the Flutter app directory containing pubspec.yaml
/// and exits with 0. If not found, prints an error to stderr and exits with 2.
///
/// Usage:
///   dart run tools/find_flutter_app.dart
///
/// CI can use:
///   APP_DIR=$(dart run tools/find_flutter_app.dart) && cd "$APP_DIR" && flutter analyze
void main() {
  final repoRoot = Directory.current.path;
  final candidates = <String>[
    'fleet-management-system-179272-179281/fleetease_android_app',
  ];

  for (final rel in candidates) {
    final dir = Directory('${repoRoot}/$rel');
    final pubspec = File('${dir.path}/pubspec.yaml');
    if (pubspec.existsSync()) {
      stdout.writeln(dir.absolute.path);
      exit(0);
    }
  }

  stderr.writeln('[ci] ERROR: Could not locate Flutter app directory (pubspec.yaml not found in known paths).');
  exit(2);
}
