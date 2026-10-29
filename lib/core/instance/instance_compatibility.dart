import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_discovery_service.dart';
import 'package:fluxer_dart/export.dart';

// Shared entry points for instance discovery and well-known validation
// ignore: avoid_classes_with_only_static_members
abstract final class InstanceCompatibility {
  static const String currentInstanceCodename = 'tungsten';

  static void validateDiscoveryPayload(Map<String, dynamic> payload) {
    final Object? reported = payload['codename'];
    if (reported is String && reported.isNotEmpty) {
      if (reported != currentInstanceCodename) {
        throw InstanceDiscoveryException(
          'Instance speaks generation "$reported", which this client does not understand',
          reason: InstanceDiscoveryFailureReason.requiresNewerClient,
          reportedCodename: reported,
        );
      }
    }
  }

  static void validateWellKnownDocument(WellKnownFluxerResponse wellKnown) {
    final String? reported = wellKnown.codename;
    if (reported != null && reported.isNotEmpty) {
      if (reported != currentInstanceCodename) {
        throw InstanceDiscoveryException(
          'Instance speaks generation "$reported", which this client does not understand',
          reason: InstanceDiscoveryFailureReason.requiresNewerClient,
          reportedCodename: reported,
        );
      }
    }
    validateWellKnown(wellKnown);
  }

  static void validateWellKnown(WellKnownFluxerResponse wellKnown) {
    final int instanceVersion = wellKnown.apiCodeVersion;
    if (instanceVersion <= 0 ||
        instanceVersion < InstanceConstants.apiCodeVersion) {
      throw InstanceDiscoveryException(
        'Incompatible server (code version $instanceVersion); '
        'this client requires ${InstanceConstants.apiCodeVersion}.',
        reason: InstanceDiscoveryFailureReason.instanceOutdated,
        reportedApiCodeVersion: instanceVersion,
      );
    }
  }
}
