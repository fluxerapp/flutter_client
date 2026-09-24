import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_registration_logic.dart';

void main() {
  group('shouldSkipMobilePushRegistration', () {
    test('skips when the endpoint and secure-storage keys match', () {
      expect(
        shouldSkipMobilePushRegistration(
          currentUserId: 'user',
          persistedUserId: 'user',
          pushSubscriptionId: 'device',
          endpointUrl: 'https://up.example/push',
          encryptionKey: 'pub',
          authSecret: 'auth',
          persistedEndpointUrl: 'https://up.example/push',
          persistedEncryptionKey: 'pub',
          persistedAuthSecret: 'auth',
        ),
        isTrue,
      );
    });

    test('does not skip when the stored keys are empty', () {
      expect(
        shouldSkipMobilePushRegistration(
          currentUserId: 'user',
          persistedUserId: 'user',
          pushSubscriptionId: 'device',
          endpointUrl: 'https://up.example/push',
          encryptionKey: 'pub',
          authSecret: 'auth',
          persistedEndpointUrl: 'https://up.example/push',
          persistedEncryptionKey: '',
          persistedAuthSecret: '',
        ),
        isFalse,
      );
    });
  });

  group('hasUnifiedPushEndpointRotated', () {
    test('is false before anything is stored', () {
      expect(
        hasUnifiedPushEndpointRotated(
          endpointUrl: 'https://up.example/push',
          encryptionKey: 'pub',
          authSecret: 'auth',
          persistedEndpointUrl: null,
          persistedEncryptionKey: null,
          persistedAuthSecret: null,
        ),
        isFalse,
      );
    });

    test('is true when the distributor endpoint changes', () {
      expect(
        hasUnifiedPushEndpointRotated(
          endpointUrl: 'https://up.example/next',
          encryptionKey: 'pub',
          authSecret: 'auth',
          persistedEndpointUrl: 'https://up.example/push',
          persistedEncryptionKey: 'pub',
          persistedAuthSecret: 'auth',
        ),
        isTrue,
      );
    });
  });
}
