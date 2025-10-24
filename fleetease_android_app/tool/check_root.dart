/// Simple tool to verify this is the Flutter project root and print context.
/// CI can run: dart run tool/check_root.dart
import 'dart:io';

void main() {
  final cwd = Directory.current.path;
  final pubspec = File('pubspec.yaml');
  final androidDir = Directory('android');
  final libDir = Directory('lib');

  print('[check_root] CWD: $cwd');
  print('[check_root] pubspec.yaml exists: ${pubspec.existsSync()}');
  print('[check_root] android dir exists: ${androidDir.existsSync()}');
  print('[check_root] lib dir exists: ${libDir.existsSync()}');
  print('[check_root] If all are true, this is a valid Flutter project root.');
}
