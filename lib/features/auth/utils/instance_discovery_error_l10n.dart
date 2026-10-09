import 'package:fluxer_app/core/instance/instance_discovery_service.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String instanceDiscoveryErrorText(
  InstanceSelectorState state,
  FluxerLocalizations l10n,
) {
  if (state.discoveryFailureReason ==
      InstanceDiscoveryFailureReason.invalidDiscoveryResponse) {
    return l10n.instanceInvalidDiscoveryResponse;
  }
  return state.errorMessage ?? l10n.instanceConnectFailed;
}
