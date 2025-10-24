/// CI Entry Helper
/// This workspace hosts the Flutter app at:
///   fleet-management-system-179272-179281/fleetease_android_app
/// Run Flutter commands inside that directory or use provided scripts/Makefile.

void main() {
  // Print guidance for CI environments that attempt to run dart/flutter from repo root.
  // This is non-fatal and simply aids discovery.
  print('FleetEase Workspace CI Helper');
  print('Use one of the following from repository root:');
  print('- make ci');
  print('- bash fleet-management-system-179272-179281/ci.sh');
  print('- bash fleet-management-system-179272-179281/run_ci_from_root.sh');
  print('- bash fleet-management-system-179272-179281/analyze.sh');
  print('- bash fleet-management-system-179272-179281/test.sh');
  print('Or: cd fleet-management-system-179272-179281/fleetease_android_app');
  print('    flutter pub get && flutter analyze && CI=true flutter test -r expanded');
}
