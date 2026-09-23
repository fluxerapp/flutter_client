import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';
import 'package:fluxer_app/core/push/web_push/web_push_registration.dart';

void main() {
  group('shouldSkipWebPushRegistration', () {
    test('skips when the user, relay url, and public key match', () {
      expect(
        shouldSkipWebPushRegistration(
          currentUserId: 'user',
          relayUrl: 'https://push.fluxer.com/relay/v1/fcm/stable/tok',
          publicKey: 'pub',
          lastRegisteredUserId: 'user',
          lastRegisteredRelayUrl:
              'https://push.fluxer.com/relay/v1/fcm/stable/tok',
          lastRegisteredPublicKey: 'pub',
        ),
        isTrue,
      );
    });

    test('registers again when the account or key changes', () {
      expect(
        shouldSkipWebPushRegistration(
          currentUserId: 'user-b',
          relayUrl: 'https://push.fluxer.com/relay',
          publicKey: 'pub',
          lastRegisteredUserId: 'user-a',
          lastRegisteredRelayUrl: 'https://push.fluxer.com/relay',
          lastRegisteredPublicKey: 'pub',
        ),
        isFalse,
      );
      expect(
        shouldSkipWebPushRegistration(
          currentUserId: 'user',
          relayUrl: 'https://push.fluxer.com/relay',
          publicKey: 'next',
          lastRegisteredUserId: 'user',
          lastRegisteredRelayUrl: 'https://push.fluxer.com/relay',
          lastRegisteredPublicKey: 'pub',
        ),
        isFalse,
      );
    });
  });

  group('unregisterLegacyRawTokenOnce', () {
    late _LegacyFlagStore store;

    setUp(() {
      store = _LegacyFlagStore();
    });

    test('does nothing after the raw token was already cleared', () async {
      store.cleared = true;
      var calls = 0;
      await unregisterLegacyRawTokenOnce(
        keyStore: store,
        platform: 'android_fcm',
        userId: 'user',
        unregister: () async {
          calls++;
        },
      );
      expect(calls, 0);
      expect(store.markCount, 0);
    });

    test('marks the raw token cleared after a successful unregister', () async {
      var calls = 0;
      await unregisterLegacyRawTokenOnce(
        keyStore: store,
        platform: 'ios_apns',
        userId: 'user',
        unregister: () async {
          calls++;
        },
      );
      expect(calls, 1);
      expect(store.cleared, isTrue);
    });

    test('marks the raw token cleared when the server has no row', () async {
      await unregisterLegacyRawTokenOnce(
        keyStore: store,
        platform: 'android_fcm',
        userId: 'user',
        unregister: () {
          return Future<void>.error(
            DioException(
              requestOptions: RequestOptions(path: '/users/@me/mobile-devices'),
              response: Response<Object?>(
                requestOptions: RequestOptions(
                  path: '/users/@me/mobile-devices',
                ),
                statusCode: 404,
              ),
            ),
          );
        },
      );
      expect(store.cleared, isTrue);
    });

    test('leaves the flag unset when unregister fails', () async {
      await unregisterLegacyRawTokenOnce(
        keyStore: store,
        platform: 'android_fcm',
        userId: 'user',
        unregister: () {
          return Future<void>.error(
            DioException(
              requestOptions: RequestOptions(path: '/users/@me/mobile-devices'),
              response: Response<Object?>(
                requestOptions: RequestOptions(
                  path: '/users/@me/mobile-devices',
                ),
                statusCode: 500,
              ),
            ),
          );
        },
      );
      expect(store.cleared, isFalse);
    });
  });
}

class _LegacyFlagStore extends WebPushKeyStore {
  _LegacyFlagStore() : super(storage: const FlutterSecureStorage());

  bool cleared = false;
  int markCount = 0;

  @override
  Future<bool> isLegacyRawCleared({
    required String platform,
    required String userId,
  }) async {
    return cleared;
  }

  @override
  Future<void> markLegacyRawCleared({
    required String platform,
    required String userId,
  }) async {
    cleared = true;
    markCount++;
  }
}
