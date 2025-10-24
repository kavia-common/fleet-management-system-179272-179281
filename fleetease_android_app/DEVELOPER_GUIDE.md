Developer Guide - FleetEase Android App

Run locally:
1) cd fleet-management-system-179272-179281/fleetease_android_app
2) flutter pub get
3) flutter analyze
4) flutter test
5) flutter run

Switching to SQLite:
- In lib/main.dart, replace:
    final DataSource dataSource = MemoryDataSource();
  with:
    final DataSource dataSource = LocalSqliteDataSource();

- The LocalSqliteDataSource:
  * Creates tables and indexes on first launch
  * Tracks createdAt, updatedAt, isDeleted, dirty
  * Handles migrations starting at v1 (onUpgrade scaffolded)
  * Seeds sample data when all tables are empty
  * Provides CRUD for vehicles, groups, and events

Notes:
- Ensure your device/emulator is running when testing SQLite features.
- If you ever need to reset the DB during development, uninstall the app from the device/emulator to clear app data.
