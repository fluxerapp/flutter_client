import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/data/scheduled_maintenance_dismissal_storage.dart';

void main() {
  group('MapScheduledMaintenanceDismissalStorage', () {
    late MapScheduledMaintenanceDismissalStorage storage;

    setUp(() {
      storage = MapScheduledMaintenanceDismissalStorage();
    });

    test('stores dismissal by maintenance id and status', () async {
      await storage.dismiss(maintenanceId: 'abc', status: 'in_progress');

      expect(
        await storage.isDismissed(maintenanceId: 'abc', status: 'in_progress'),
        isTrue,
      );
      expect(
        await storage.isDismissed(maintenanceId: 'abc', status: 'scheduled'),
        isFalse,
      );
    });

    test(
      'accepts legacy scheduled dismissal key without status suffix',
      () async {
        storage.values['abc'] = '1';

        expect(
          await storage.isDismissed(maintenanceId: 'abc', status: 'scheduled'),
          isTrue,
        );
        expect(
          await storage.isDismissed(
            maintenanceId: 'abc',
            status: 'in_progress',
          ),
          isFalse,
        );
      },
    );
  });
}
