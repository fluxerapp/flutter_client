import 'dart:async';

import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/shell/data/service_status_client.dart';
import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';
import 'package:fluxer_app/features/shell/utils/service_status_poll_delay.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_status_maintenance_provider.g.dart';

@Riverpod(keepAlive: true)
class ServiceStatusMaintenanceRead extends _$ServiceStatusMaintenanceRead {
  Timer? _pollTimer;
  final ServiceStatusClient _client = ServiceStatusClient();

  @override
  ServiceStatusMaintenance? build() {
    ref.onDispose(_cancelPoll);
    ref.listen<AsyncValue<WellKnownFluxerResponse>>(wellKnownProvider, (
      _,
      AsyncValue<WellKnownFluxerResponse> next,
    ) {
      next.whenData((_) => unawaited(refresh()));
    }, fireImmediately: true);
    return null;
  }

  Future<void> refresh() async {
    final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.read(
      wellKnownProvider,
    );
    final bool isSelfHosted = wellKnown.maybeWhen(
      data: (WellKnownFluxerResponse response) => response.features.selfHosted,
      orElse: () => false,
    );
    if (isSelfHosted) {
      _cancelPoll();
      state = null;
      return;
    }
    final ServiceStatusMaintenance? next = await _client
        .fetchScheduledMaintenance();
    state = next;
    _scheduleNextPoll(next);
  }

  void _scheduleNextPoll(ServiceStatusMaintenance? maintenance) {
    _cancelPoll();
    final Duration delay = computeServiceStatusPollDelay(maintenance);
    _pollTimer = Timer(delay, () {
      unawaited(refresh());
    });
  }

  void _cancelPoll() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }
}
