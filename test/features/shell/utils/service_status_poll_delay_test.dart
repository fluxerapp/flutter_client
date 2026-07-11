import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';
import 'package:fluxer_app/features/shell/utils/service_status_poll_delay.dart';

void main() {
  group('computeServiceStatusPollDelay', () {
    test('uses active maintenance interval while work is in progress', () {
      final ServiceStatusMaintenance maintenance = ServiceStatusMaintenance(
        id: 'm1',
        name: 'Maintenance',
        status: ServiceStatusMaintenanceStatus.inProgress,
        start: DateTime.utc(2026, 7, 11, 12),
        durationMinutes: 60,
        url: 'https://status.example',
      );

      final Duration delay = computeServiceStatusPollDelay(
        maintenance,
        random: math.Random(0),
      );

      expect(delay, greaterThanOrEqualTo(kPollActiveMaintenanceInterval));
      expect(
        delay,
        lessThanOrEqualTo(
          kPollActiveMaintenanceInterval + kPollActiveMaintenanceJitter,
        ),
      );
    });

    test('polls soon after scheduled maintenance start time passes', () {
      final ServiceStatusMaintenance maintenance = ServiceStatusMaintenance(
        id: 'm1',
        name: 'Maintenance',
        status: ServiceStatusMaintenanceStatus.scheduled,
        start: DateTime.now().toUtc().subtract(const Duration(seconds: 1)),
        durationMinutes: 30,
        url: 'https://status.example',
      );

      final Duration delay = computeServiceStatusPollDelay(
        maintenance,
        random: math.Random(0),
      );

      expect(delay, kPollMinDelay);
    });

    test('uses default interval when no maintenance is active', () {
      final Duration delay = computeServiceStatusPollDelay(
        null,
        random: math.Random(0),
      );

      expect(delay, greaterThanOrEqualTo(kStatusPagePollInterval));
      expect(
        delay,
        lessThanOrEqualTo(kStatusPagePollInterval + kStatusPagePollJitter),
      );
    });
  });
}
