import 'dart:io';

Future<void> main(List<String> args) async {
  final appDir = Directory('fleet-management-system-179272-179281/fleetease_android_app');
  if (!File('${appDir.path}/pubspec.yaml').existsSync()) {
    stderr.writeln('[tool/ci.dart] ERROR: Flutter app not found at ${appDir.path}');
    exit(2);
  }

  Future<void> run(List<String> cmd) async {
    stdout.writeln('[tool/ci.dart] Running: ${cmd.join(' ')} in ${appDir.path}');
    final proc = await Process.start(cmd.first, cmd.skip(1).toList(), workingDirectory: appDir.path);
    await stdout.addStream(proc.stdout);
    await stderr.addStream(proc.stderr);
    final code = await proc.exitCode;
    if (code != 0) exit(code);
  }

  await run(['flutter', 'pub', 'get']);
  await run(['flutter', 'analyze']);
  // Respect CI flag if set; default to CI=true for deterministic test output.
  final env = Map<String, String>.from(Platform.environment);
  env['CI'] = env['CI'] ?? 'true';
  final test = await Process.start('flutter', ['test'], workingDirectory: appDir.path, environment: env);
  await stdout.addStream(test.stdout);
  await stderr.addStream(test.stderr);
  final code = await test.exitCode;
  if (code != 0) exit(code);
}
