# FleetEase Local Database

This app uses LocalSqliteDataSource (sqflite) by default.
- Schema includes: createdAt, updatedAt, isDeleted, dirty
- Migrations: onCreate v1, onUpgrade placeholder
- Seeding: inserts default groups, vehicles, and events on first launch if DB is empty

Switch data source via .env:
  DATA_SOURCE=memory   # use in-memory, non-persistent (for quick demos)
  DATA_SOURCE=sqlite   # use local sqlite (default if unset)

Commands:
  flutter pub get
  flutter analyze
  CI=true flutter test -r expanded
