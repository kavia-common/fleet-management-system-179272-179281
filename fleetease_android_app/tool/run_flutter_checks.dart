import 'dart:io';

/// Delegates Flutter analysis and tests into the app directory to avoid
/// "Could not determine project root directory for Flutter project".
Future<void> main() async {
  final appDir = Directory('fleet-management-system-179272-179281/fleetease_android_app');
  if (!File('${appDir.path}/pubspec.yaml').existsSync()) {
    stderr.writeln('[tool] ERROR: Flutter app not found at ${appDir.path}');
    exit(2);
  }
  // Run commands
  final steps = <List<String>>[
    ['flutter', 'pub', 'get'],
    ['flutter', 'analyze'],
    ['flutter', 'test'],
  ];
  for (final cmd in steps) {
    final proc = await Process.start(cmd.first, cmd.skip(1).toList(), workingDirectory: appDir.path);
    stdout.addStream(proc.stdout);
    stderr.addStream(proc.stderr);
    final code = await proc.exitCode;
    if (code != 0) {
      exit(code);
    }
  }
}
