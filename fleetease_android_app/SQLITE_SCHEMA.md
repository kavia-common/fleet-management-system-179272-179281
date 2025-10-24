SQLite Schema - FleetEase

Database: fleetease.db
Version: 1

Tables:
1) groups
   - id TEXT PRIMARY KEY
   - name TEXT NOT NULL
   - location TEXT NOT NULL
   - createdAt INTEGER NOT NULL
   - updatedAt INTEGER NOT NULL
   - isDeleted INTEGER NOT NULL DEFAULT 0
   - dirty INTEGER NOT NULL DEFAULT 0

2) vehicles
   - id TEXT PRIMARY KEY
   - name TEXT NOT NULL
   - licensePlate TEXT NOT NULL
   - type TEXT NOT NULL
   - status INTEGER NOT NULL                 # enum VehicleStatus.index
   - mileageKm INTEGER NOT NULL
   - groupId TEXT                            # FK -> groups(id)
   - createdAt INTEGER NOT NULL
   - updatedAt INTEGER NOT NULL
   - isDeleted INTEGER NOT NULL DEFAULT 0
   - dirty INTEGER NOT NULL DEFAULT 0
   Foreign Keys:
     - groupId REFERENCES groups(id) ON DELETE SET NULL

3) events
   - id TEXT PRIMARY KEY
   - title TEXT NOT NULL
   - status INTEGER NOT NULL                 # enum EventStatus.index
   - cost REAL
   - color INTEGER NOT NULL                  # ARGB hex int
   - date INTEGER                            # millisSinceEpoch
   - vehicleId TEXT                          # FK -> vehicles(id)
   - createdAt INTEGER NOT NULL
   - updatedAt INTEGER NOT NULL
   - isDeleted INTEGER NOT NULL DEFAULT 0
   - dirty INTEGER NOT NULL DEFAULT 0
   Foreign Keys:
     - vehicleId REFERENCES vehicles(id) ON DELETE SET NULL

Indexes:
- idx_groups_name(name)
- idx_vehicles_groupId(groupId)
- idx_vehicles_status(status)
- idx_events_vehicleId(vehicleId)
- idx_common_isDeleted on vehicles(isDeleted)
- idx_common_isDeleted_groups on groups(isDeleted)
- idx_common_isDeleted_events on events(isDeleted)
- idx_vehicles_updatedAt on vehicles(updatedAt)
- idx_groups_updatedAt on groups(updatedAt)
- idx_events_updatedAt on events(updatedAt)

Migrations:
- Version 1: Base schema creation (tables + indexes)
- Future versions: Use onUpgrade with version checks and ALTER TABLE statements.

Seeding (first launch only when all tables are empty):
- 3 groups (g1, g2, g3)
- 4 vehicles (v1..v4)
- 4 events (e1..e4)
