import 'dart:io';

/// PUBLIC_INTERFACE
/// Probes for the Flutter app directory and prints its absolute path.
/// Exit code:
///  0 - Found and printed path
///  2 - Not found
///
/// Usage from repo root:
///   dart run tools/ci_probe.dart
///   # Then in CI:
///   # APP_DIR=$(dart run tools/ci_probe.dart) && cd "$APP_DIR" && flutter pub get && flutter analyze
Future<void> main() async {
  final repoRoot = Directory.current.path;
  final candidate = Directory('$repoRoot/fleet-management-system-179272-179281/fleetease_android_app');

  if (File('${candidate.path}/pubspec.yaml').existsSync()) {
    stdout.writeln(candidate.absolute.path);
    exit(0);
  }

  stderr.writeln('[ci] ERROR: Flutter app not found at expected path.');
  stderr.writeln('[ci] Expected: fleet-management-system-179272-179281/fleetease_android_app');
  exit(2);
}
