import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fleetease_android_app/main.dart';
import 'package:fleetease_android_app/core/services/notification_service.dart';
import 'package:fleetease_android_app/core/services/sync_service.dart';

void main() {
  testWidgets('FleetEase app smoke test', (WidgetTester tester) async {
    // Initialize services for testing
    final notificationService = NotificationService();
    final syncService = SyncService();

    // Build the app
    await tester.pumpWidget(
      FleetEaseApp(
        notificationService: notificationService,
        syncService: syncService,
      ),
    );

    // Let all animations and async operations complete
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Verify that the bottom navigation bar is present
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verify all navigation items are present
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Vehicles'), findsOneWidget);
    expect(find.text('Groups'), findsOneWidget);
    expect(find.text('Events'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('Dashboard displays KPI cards', (WidgetTester tester) async {
    final notificationService = NotificationService();
    final syncService = SyncService();

    await tester.pumpWidget(
      FleetEaseApp(
        notificationService: notificationService,
        syncService: syncService,
      ),
    );

    // Wait for the dashboard to load
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Verify dashboard title is present
    expect(find.text('Fleet Dashboard'), findsOneWidget);
    
    // Verify KPI labels are present
    expect(find.text('Total Vehicles'), findsOneWidget);
    expect(find.text('Active'), findsOneWidget);
  });

  testWidgets('Navigation between tabs works', (WidgetTester tester) async {
    final notificationService = NotificationService();
    final syncService = SyncService();

    await tester.pumpWidget(
      FleetEaseApp(
        notificationService: notificationService,
        syncService: syncService,
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Tap on Vehicles tab using the text in navigation bar
    await tester.tap(find.text('Vehicles').last);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Tap on Settings tab
    await tester.tap(find.text('Settings').last);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify we can navigate back to Dashboard
    await tester.tap(find.text('Dashboard').last);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    
    expect(find.text('Fleet Dashboard'), findsOneWidget);
  });
}
