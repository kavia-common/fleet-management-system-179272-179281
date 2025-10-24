import 'dart:async';
import 'package:fleetease_android_app/core/data/local_sqlite_data_source.dart';
import 'package:fleetease_android_app/core/data/data_source.dart';

/// PUBLIC_INTERFACE
/// Simple sanity checker for LocalSqliteDataSource initialization.
/// Run with:
///   dart run tools/db_sanity_check.dart
Future<void> main() async {
  final DataSource ds = LocalSqliteDataSource(enableSeeding: true);
  await ds.initialize();
  final vehicles = await ds.getVehicles();
  final groups = await ds.getGroups();
  final events = await ds.getEvents();
  print('DB sanity check OK -> vehicles=${vehicles.length}, groups=${groups.length}, events=${events.length}');
}
