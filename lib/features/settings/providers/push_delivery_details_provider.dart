import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/push/push_delivery_display.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_provider.dart';
import 'package:fluxer_app/core/push/services/unified_push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_functions.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_instance_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unifiedpush/unifiedpush.dart' as up;

part 'push_delivery_details_provider.g.dart';

class PushDeliveryDetailsState {
  const PushDeliveryDetailsState({
    required this.pushProvider,
    required this.relayStatus,
    this.selectedDistributorPackageId,
    this.availableDistributors = const <String>[],
    this.gatewayHost,
  });

  final PushProviderKind pushProvider;
  final FluxerRelayDeliveryStatus relayStatus;
  final String? selectedDistributorPackageId;
  final List<String> availableDistributors;
  final String? gatewayHost;

  bool get canPickDistributor => availableDistributors.length > 1;

  bool get showUnifiedPushDetails =>
      pushProvider == PushProviderKind.unifiedPush;
}

@Riverpod(keepAlive: true)
class PushDeliveryDetails extends _$PushDeliveryDetails {
  final FluxerUnifiedPushFunctions _unifiedPushFunctions =
      FluxerUnifiedPushFunctions();

  @override
  Future<PushDeliveryDetailsState> build() async {
    final PushProviderKind pushProvider = AppBuildConfig.pushProvider;
    final bool isOfficialInstance = ref.watch(isActiveInstanceOfficialProvider);
    final bool relayConsentGranted = ref.watch(pushRelayConsentProvider);
    final FluxerRelayDeliveryStatus relayStatus =
        resolveFluxerRelayDeliveryStatus(
          kind: pushProvider,
          isOfficialInstance: isOfficialInstance,
          relayConsentGranted: relayConsentGranted,
        );

    if (!PushProviderGuard.isUnifiedPush) {
      return PushDeliveryDetailsState(
        pushProvider: pushProvider,
        relayStatus: relayStatus,
      );
    }

    final String apiBaseUrl = ref.watch(fluxerBaseUrlProvider);
    final String instanceId = unifiedPushInstanceIdForApiBase(apiBaseUrl);
    final String? selectedDistributor = await _unifiedPushFunctions
        .getDistributor();
    final List<String> availableDistributors = await _unifiedPushFunctions
        .getDistributors();

    String? gatewayHost;
    if (instanceId.isNotEmpty) {
      final up.PushEndpoint? endpoint = UnifiedPushService.instance.endpointFor(
        instanceId,
      );
      gatewayHost = unifiedPushGatewayHost(endpoint?.url);
    }

    return PushDeliveryDetailsState(
      pushProvider: pushProvider,
      relayStatus: relayStatus,
      selectedDistributorPackageId: selectedDistributor,
      availableDistributors: availableDistributors,
      gatewayHost: gatewayHost,
    );
  }
}
