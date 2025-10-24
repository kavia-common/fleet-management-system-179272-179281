import 'dart:io';

/// PUBLIC_INTERFACE
/// Runs Flutter commands from the FleetEase app directory.
///
/// Usage from repo root:
///   dart run tool/ci_run_flutter.dart            # defaults to `analyze`
///   dart run tool/ci_run_flutter.dart test       # runs `flutter test`
///   dart run tool/ci_run_flutter.dart "build apk --debug"
Future<void> main(List<String> args) async {
  final appDir = Directory('fleet-management-system-179272-179281/fleetease_android_app');
  if (!File('${appDir.path}/pubspec.yaml').existsSync()) {
    stderr.writeln('[ci_run_flutter.dart] ERROR: Flutter app not found at ${appDir.path}');
    exit(2);
  }

  final String cmd = args.isEmpty ? 'analyze' : args.join(' ');
  stdout.writeln('[ci_run_flutter.dart] cd ${appDir.path}');
  Directory.current = appDir;

  // Ensure dependencies are fetched
  final getProc = await Process.start('flutter', ['pub', 'get'], mode: ProcessStartMode.inheritStdio);
  final getExit = await getProc.exitCode;
  if (getExit != 0) {
    stderr.writeln('[ci_run_flutter.dart] flutter pub get failed ($getExit)');
    exit(getExit);
  }

  stdout.writeln('[ci_run_flutter.dart] flutter $cmd');
  final parts = cmd.split(' ');
  final proc = await Process.start('flutter', parts, mode: ProcessStartMode.inheritStdio);
  final code = await proc.exitCode;
  if (code != 0) {
    stderr.writeln('[ci_run_flutter.dart] flutter $cmd failed ($code)');
    exit(code);
  }
  stdout.writeln('[ci_run_flutter.dart] Success.');
}
