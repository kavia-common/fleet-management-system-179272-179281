import 'package:flutter_test/flutter_test.dart';
import 'package:fleetease_android_app/core/core.dart';

void main() {
  test('package import smoke test', () {
    // Ensures the package can be imported and basic symbols are visible.
    expect(AppTheme.primaryColor.value, isNotNull);
  });
}
