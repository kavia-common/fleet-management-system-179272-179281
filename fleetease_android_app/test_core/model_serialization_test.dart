import 'package:flutter_test/flutter_test.dart';
import 'package:fleetease_android_app/core/models/vehicle.dart';
import 'package:fleetease_android_app/core/models/group.dart';
import 'package:fleetease_android_app/core/models/event.dart';

void main() {
  test('Vehicle toMap/fromMap roundtrip', () {
    final v = Vehicle(
      id: 'v1',
      name: 'Car',
      licensePlate: 'ABC-123',
      type: 'Sedan',
      status: VehicleStatus.active,
      mileageKm: 1000,
      groupId: 'g1',
    );
    final map = v.toMap();
    final round = Vehicle.fromMap(map);
    expect(round.id, v.id);
    expect(round.name, v.name);
    expect(round.licensePlate, v.licensePlate);
    expect(round.type, v.type);
    expect(round.status, v.status);
    expect(round.mileageKm, v.mileageKm);
    expect(round.groupId, v.groupId);
  });

  test('BusinessGroup toMap/fromMap roundtrip', () {
    final g = BusinessGroup(id: 'g1', name: 'Delivery', location: 'City');
    final map = g.toMap();
    final round = BusinessGroup.fromMap(map);
    expect(round.id, g.id);
    expect(round.name, g.name);
    expect(round.location, g.location);
  });

  test('MaintenanceEvent toMap/fromMap roundtrip', () {
    final e = MaintenanceEvent(
      id: 'e1',
      title: 'Oil Change',
      status: EventStatus.scheduled,
      color: 0xFF2563EB,
      cost: 50.0,
      date: DateTime.fromMillisecondsSinceEpoch(1710000000000),
      vehicleId: 'v1',
    );
    final map = e.toMap();
    final round = MaintenanceEvent.fromMap(map);
    expect(round.id, e.id);
    expect(round.title, e.title);
    expect(round.status, e.status);
    expect(round.color, e.color);
    expect(round.cost, e.cost);
    expect(round.date?.millisecondsSinceEpoch, e.date?.millisecondsSinceEpoch);
    expect(round.vehicleId, e.vehicleId);
  });
}
