import 'package:fluxer_app/core/instance/instance_discovery_service.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/instance/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_instance_compatibility_provider.g.dart';

class ActiveInstanceCompatibilityIssue {
  const ActiveInstanceCompatibilityIssue({
    required this.reason,
    required this.domain,
  });

  final InstanceDiscoveryFailureReason reason;
  final String domain;
}

@Riverpod(keepAlive: true)
ActiveInstanceCompatibilityIssue? activeInstanceCompatibility(Ref ref) {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  final String domain = ref.watch(activeInstanceDisplayDomainProvider);
  return wellKnown.when(
    data: (_) => null,
    loading: () => null,
    error: (Object error, _) => _issueFromError(error, domain),
  );
}

ActiveInstanceCompatibilityIssue? _issueFromError(Object error, String domain) {
  if (error is! InstanceDiscoveryException) {
    return null;
  }
  final InstanceDiscoveryFailureReason? reason = error.reason;
  if (reason == null) {
    return null;
  }
  if (reason == InstanceDiscoveryFailureReason.invalidDiscoveryResponse) {
    return null;
  }
  return ActiveInstanceCompatibilityIssue(reason: reason, domain: domain);
}

bool isInstanceCompatibilityError(Object? error) {
  if (error is! InstanceDiscoveryException) {
    return false;
  }
  final InstanceDiscoveryFailureReason? reason = error.reason;
  return reason == InstanceDiscoveryFailureReason.instanceOutdated ||
      reason == InstanceDiscoveryFailureReason.requiresNewerClient;
}
