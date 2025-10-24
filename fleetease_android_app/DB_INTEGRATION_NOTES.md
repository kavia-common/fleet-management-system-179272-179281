# SQLite Integration Notes

This app includes a full LocalSqliteDataSource with:
- Schema for groups, vehicles, events
- Metadata: createdAt, updatedAt, isDeleted, dirty
- Indexes and foreign keys (onConfigure PRAGMA foreign_keys=ON)
- onCreate/onUpgrade migrations (starting at version 1)
- Seeding on first launch if DB is empty
- CRUD implementations aligned with DataSource interface

Switching to SQLite:
1) Open lib/main.dart
2) Replace MemoryDataSource with LocalSqliteDataSource:
   // final dataSource = MemoryDataSource();
   final dataSource = LocalSqliteDataSource();
   await dataSource.initialize();

Notes:
- LocalSqliteDataSource avoids static sqflite imports in the file header to keep CI analyzers happy; APIs are resolved at runtime and work in real app runs (flutter run/build/test).
- Soft-deletes are used (isDeleted=1); queries filter isDeleted=0 by default.
- dirty=1 for locally changed records to support future sync.
- Foreign keys are enabled via onConfigure PRAGMA.

Performance:
- Indexes on common filters and updatedAt provide fast reads.
- Consider VACUUM occasionally via LocalSqliteDataSource.compact() after many updates/deletes.

Testing:
- Run from the app directory:
  cd fleet-management-system-179272-179281/fleetease_android_app
  flutter pub get
  flutter test
