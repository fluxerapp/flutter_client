import 'dart:math' as math;

import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';

const Duration kStatusPagePollInterval = Duration(seconds: 60);
const Duration kStatusPagePollJitter = Duration(seconds: 15);
const Duration kPollActiveMaintenanceInterval = Duration(seconds: 60);
const Duration kPollActiveMaintenanceJitter = Duration(seconds: 15);
const Duration kPollAfterMaintenanceStart = Duration(seconds: 5);
const Duration kPollMinDelay = Duration(seconds: 10);

Duration computeServiceStatusPollDelay(
  ServiceStatusMaintenance? maintenance, {
  math.Random? random,
}) {
  final math.Random rng = random ?? math.Random();
  if (maintenance?.status == ServiceStatusMaintenanceStatus.inProgress) {
    return kPollActiveMaintenanceInterval +
        Duration(
          milliseconds:
              (rng.nextDouble() * kPollActiveMaintenanceJitter.inMilliseconds)
                  .round(),
        );
  }
  if (maintenance?.status == ServiceStatusMaintenanceStatus.scheduled) {
    final int delayUntilStart =
        maintenance!.start.millisecondsSinceEpoch -
        DateTime.now().millisecondsSinceEpoch;
    if (delayUntilStart <= 0) {
      return kPollMinDelay;
    }
    if (delayUntilStart < kStatusPagePollInterval.inMilliseconds) {
      return Duration(
        milliseconds: math.max(
          kPollMinDelay.inMilliseconds,
          delayUntilStart + kPollAfterMaintenanceStart.inMilliseconds,
        ),
      );
    }
  }
  return kStatusPagePollInterval +
      Duration(
        milliseconds: (rng.nextDouble() * kStatusPagePollJitter.inMilliseconds)
            .round(),
      );
}
