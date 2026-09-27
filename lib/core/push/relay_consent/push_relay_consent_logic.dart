import 'package:fluxer_app/core/push/web_push/web_push_relay.dart';

bool isPushRelayConsentRequired({
  required String relayUrl,
  required bool isConsentGranted,
  required bool isOfficialInstance,
}) {
  if (isOfficialInstance) {
    return false;
  }
  if (!isFluxerPushRelayUrl(relayUrl)) {
    return false;
  }
  return !isConsentGranted;
}

bool shouldPromptForPushRelayConsent({
  required String relayUrl,
  required bool isConsentGranted,
  required bool hasDecision,
  required bool isOfficialInstance,
}) {
  if (!isPushRelayConsentRequired(
    relayUrl: relayUrl,
    isConsentGranted: isConsentGranted,
    isOfficialInstance: isOfficialInstance,
  )) {
    return false;
  }
  return !hasDecision;
}
