import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_logic.dart';
import 'package:fluxer_app/core/push/web_push/web_push_relay.dart';

const String _kNtfyEndpoint = 'https://ntfy.sh/UP0123456789abcdef';
const String _kSelfHostedEndpoint =
    'https://push.example.org/UP?instance=fluxer';

void main() {
  final String relayEndpoint = fcmRelayUrl(
    appId: 'stable',
    deviceToken: 'device-token',
  );
  final String voipRelayEndpoint = apnsVoipRelayUrl(
    appId: 'stable',
    environment: 'production',
    deviceTokenHex: 'ab',
  );

  group('isPushRelayConsentRequired', () {
    test('requires consent for a relay endpoint without consent', () {
      expect(
        isPushRelayConsentRequired(
          relayUrl: relayEndpoint,
          isConsentGranted: false,
        ),
        isTrue,
      );
      expect(
        isPushRelayConsentRequired(
          relayUrl: voipRelayEndpoint,
          isConsentGranted: false,
        ),
        isTrue,
      );
    });

    test('allows a relay endpoint once consent is granted', () {
      expect(
        isPushRelayConsentRequired(
          relayUrl: relayEndpoint,
          isConsentGranted: true,
        ),
        isFalse,
      );
    });

    test('never requires consent for a unified push endpoint', () {
      expect(
        isPushRelayConsentRequired(
          relayUrl: _kNtfyEndpoint,
          isConsentGranted: false,
        ),
        isFalse,
      );
      expect(
        isPushRelayConsentRequired(
          relayUrl: _kSelfHostedEndpoint,
          isConsentGranted: false,
        ),
        isFalse,
      );
    });
  });

  group('shouldPromptForPushRelayConsent', () {
    test('prompts once for a relay endpoint with no decision', () {
      expect(
        shouldPromptForPushRelayConsent(
          relayUrl: relayEndpoint,
          isConsentGranted: false,
          hasDecision: false,
        ),
        isTrue,
      );
    });

    test('does not prompt again after consent was declined', () {
      expect(
        shouldPromptForPushRelayConsent(
          relayUrl: relayEndpoint,
          isConsentGranted: false,
          hasDecision: true,
        ),
        isFalse,
      );
    });

    test('does not prompt once consent is granted', () {
      expect(
        shouldPromptForPushRelayConsent(
          relayUrl: relayEndpoint,
          isConsentGranted: true,
          hasDecision: true,
        ),
        isFalse,
      );
    });

    test('never prompts for a unified push endpoint', () {
      expect(
        shouldPromptForPushRelayConsent(
          relayUrl: _kNtfyEndpoint,
          isConsentGranted: false,
          hasDecision: false,
        ),
        isFalse,
      );
      expect(
        shouldPromptForPushRelayConsent(
          relayUrl: _kSelfHostedEndpoint,
          isConsentGranted: false,
          hasDecision: false,
        ),
        isFalse,
      );
    });
  });
}
