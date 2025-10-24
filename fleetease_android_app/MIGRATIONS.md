SQLite Migrations - FleetEase

Current DB: fleetease.db
Current Version: 1

Base schema (v1):
- Tables: groups, vehicles, events
- Common columns: createdAt, updatedAt, isDeleted, dirty
- Indexes for common queries and ordering
- FK integrity enabled via PRAGMA foreign_keys = ON

Adding a new column (example):
1) Bump _dbVersion in LocalSqliteDataSource.
2) In _migrate(db, oldVersion, newVersion):
   if (oldVersion < 2) {
     await db.execute("ALTER TABLE vehicles ADD COLUMN vin TEXT");
     // For existing rows, set defaults as necessary.
     await db.execute("UPDATE vehicles SET vin = '' WHERE vin IS NULL");
   }

Creating a new table (example):
1) Bump version.
2) In _migrate:
   if (oldVersion < 3) {
     await db.execute("""
       CREATE TABLE event_types (
         id TEXT PRIMARY KEY,
         name TEXT NOT NULL,
         color INTEGER NOT NULL,
         createdAt INTEGER NOT NULL,
         updatedAt INTEGER NOT NULL,
         isDeleted INTEGER NOT NULL DEFAULT 0,
         dirty INTEGER NOT NULL DEFAULT 0
       )
     """);
     await db.execute("CREATE INDEX IF NOT EXISTS idx_event_types_name ON event_types(name)");
   }

Renaming a column:
- SQLite doesn’t support renaming columns directly in older versions.
- Strategy: Create new table with desired schema, copy data, drop old table, rename new one.

Transaction safety:
- Wrap multi-statement migrations in db.transaction(...) to ensure atomicity.

Seeding:
- Seeding only runs on first launch when all tables are empty.
- Avoid seeding in migrations unless explicitly desired.

Testing:
- Add tests to verify new columns/tables exist after migration and CRUD works.
