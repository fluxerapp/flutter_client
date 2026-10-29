import 'package:fluxer_app/features/shell/data/service_status_client.dart';
import 'package:fluxer_app/features/shell/domain/service_status_incident.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_status_incident_provider.g.dart';

@Riverpod(keepAlive: true)
class ServiceStatusIncidentRead extends _$ServiceStatusIncidentRead {
  @override
  ServiceStatusIncident? build() => null;

  Future<void> refresh() async {
    final ServiceStatusClient client = ServiceStatusClient();
    final ServiceStatusIncident? next = await client.fetchActiveIncident();
    state = next;
  }
}
