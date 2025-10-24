import 'package:flutter_test/flutter_test.dart';
import 'package:fleetease_android_app/core/data/data_source.dart';
import 'package:fleetease_android_app/core/data/local_sqlite_data_source.dart';
import 'package:fleetease_android_app/core/models/vehicle.dart';
import 'package:fleetease_android_app/core/models/group.dart';
import 'package:fleetease_android_app/core/models/event.dart';

void main() {
  test('LocalSqliteDataSource implements DataSource API', () async {
    final DataSource ds = LocalSqliteDataSource();

    // Verify methods are callable (no runtime check here; we don't open DB)
    expect(ds is DataSource, isTrue);

    // Dummy objects (not persisted in this test)
    final v = Vehicle(
      id: 'test_v',
      name: 'Test Vehicle',
      licensePlate: 'TEST-000',
      type: 'Sedan',
      status: VehicleStatus.active,
      mileageKm: 0,
    );
    final g = BusinessGroup(id: 'test_g', name: 'Group', location: 'City');
    final e = MaintenanceEvent(
      id: 'test_e',
      title: 'Event',
      status: EventStatus.scheduled,
      color: 0xFF2563EB,
    );

    // Ensure CRUD methods exist and return Futures
    expect(ds.getVehicles(), completes);
    expect(ds.createVehicle(v), completes);
    expect(ds.updateVehicle(v), completes);
    expect(ds.deleteVehicle(v.id), completes);

    expect(ds.getGroups(), completes);
    expect(ds.createGroup(g), completes);
    expect(ds.updateGroup(g), completes);
    expect(ds.deleteGroup(g.id), completes);

    expect(ds.getEvents(), completes);
    expect(ds.createEvent(e), completes);
    expect(ds.updateEvent(e), completes);
    expect(ds.deleteEvent(e.id), completes);
  });
}
