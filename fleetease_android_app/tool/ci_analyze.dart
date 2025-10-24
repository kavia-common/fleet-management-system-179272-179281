import 'dart:io';

/// PUBLIC_INTERFACE
/// Entry point for CI analysis from repo root. It changes directory into the
/// Flutter app before spawning `flutter analyze`.
/// Usage:
///   dart run tool/ci_analyze.dart
Future<void> main() async {
  final appDir = Directory('fleet-management-system-179272-179281/fleetease_android_app');
  if (!File('${appDir.path}/pubspec.yaml').existsSync()) {
    stderr.writeln('ERROR: Flutter app not found at ${appDir.path}');
    exit(2);
  }

  // Change working directory
  Directory.current = appDir;

  // Fetch deps then analyze
  final get = await Process.start('flutter', ['pub', 'get'], mode: ProcessStartMode.inheritStdio);
  final getExit = await get.exitCode;
  if (getExit != 0) {
    stderr.writeln('ERROR: flutter pub get failed with code $getExit');
    exit(getExit);
  }

  final analyze = await Process.start('flutter', ['analyze'], mode: ProcessStartMode.inheritStdio);
  final analyzeExit = await analyze.exitCode;
  if (analyzeExit != 0) {
    stderr.writeln('ERROR: flutter analyze failed with code $analyzeExit');
    exit(analyzeExit);
  }

  stdout.writeln('CI analyze completed successfully.');
}
