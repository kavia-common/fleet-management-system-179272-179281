import 'dart:io';

/// PUBLIC_INTERFACE
/// For CI systems that only run "dart run" from the repository root,
/// this forwards to Flutter commands executed from the app directory.
///
/// Examples:
///   dart run bin/ci_forward.dart                # runs flutter analyze
///   dart run bin/ci_forward.dart test           # runs flutter test
///   dart run bin/ci_forward.dart "build apk --debug"
Future<void> main(List<String> args) async {
  final appDir = Directory('fleet-management-system-179272-179281/fleetease_android_app');
  if (!File('${appDir.path}/pubspec.yaml').existsSync()) {
    stderr.writeln('[ci_forward] ERROR: Flutter app not found at ${appDir.path}');
    exit(2);
  }

  final cmd = args.isEmpty ? ['analyze'] : args.join(' ').split(' ');

  stdout.writeln('[ci_forward] cd ${appDir.path}');
  Directory.current = appDir;

  final getProc = await Process.start('flutter', ['pub', 'get'], mode: ProcessStartMode.inheritStdio);
  final getExit = await getProc.exitCode;
  if (getExit != 0) {
    stderr.writeln('[ci_forward] flutter pub get failed with code $getExit');
    exit(getExit);
  }

  stdout.writeln('[ci_forward] flutter ${cmd.join(' ')}');
  final proc = await Process.start('flutter', cmd, mode: ProcessStartMode.inheritStdio);
  final code = await proc.exitCode;
  if (code != 0) {
    stderr.writeln('[ci_forward] flutter ${cmd.join(' ')} failed with code $code');
    exit(code);
  }
  stdout.writeln('[ci_forward] Success.');
}
