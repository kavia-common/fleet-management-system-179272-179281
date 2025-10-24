import 'dart:io';

Future<void> main() async {
  final appDir = Directory('fleet-management-system-179272-179281/fleetease_android_app');
  if (!File('${appDir.path}/pubspec.yaml').existsSync()) {
    stderr.writeln('[ci_entry.dart] ERROR: Flutter app not found at ${appDir.path}');
    exit(2);
  }

  Future<void> run(List<String> cmd, {Map<String, String>? env}) async {
    stdout.writeln('[ci_entry.dart] Running: ${cmd.join(' ')} in ${appDir.path}');
    final proc = await Process.start(
      cmd.first,
      cmd.skip(1).toList(),
      workingDirectory: appDir.path,
      environment: env,
      mode: ProcessStartMode.inheritStdio,
    );
    final code = await proc.exitCode;
    if (code != 0) {
      stderr.writeln('[ci_entry.dart] Command failed: ${cmd.join(' ')} (exit $code)');
      exit(code);
    }
  }

  await run(['flutter', 'pub', 'get']);
  await run(['flutter', 'analyze']);
  final env = Map<String, String>.from(Platform.environment);
  env['CI'] = env['CI'] ?? 'true';
  await run(['flutter', 'test'], env: env);
}
