import 'package:fluxer_app/core/push/web_push/web_push_relay.dart';

bool isPushRelayConsentRequired({
  required String relayUrl,
  required bool isConsentGranted,
}) {
  if (!isFluxerPushRelayUrl(relayUrl)) {
    return false;
  }
  return !isConsentGranted;
}

bool shouldPromptForPushRelayConsent({
  required String relayUrl,
  required bool isConsentGranted,
  required bool hasDecision,
}) {
  if (!isPushRelayConsentRequired(
    relayUrl: relayUrl,
    isConsentGranted: isConsentGranted,
  )) {
    return false;
  }
  return !hasDecision;
}
