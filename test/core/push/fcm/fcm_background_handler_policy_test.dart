import 'package:fluxer_app/core/push/fcm/fcm_background_handler_policy.dart';
import 'package:test/test.dart';

void main() {
  group('shouldSaveFcmTapPayloadCache', () {
    test('returns true for guild channel payload', () {
      expect(
        shouldSaveFcmTapPayloadCache(<String, String>{
          'guild_id': '1',
          'channel_id': '2',
        }),
        isTrue,
      );
    });

    test('returns true for dm channel payload', () {
      expect(
        shouldSaveFcmTapPayloadCache(<String, String>{
          'channel_id': '2',
          'recipient_id': '3',
        }),
        isTrue,
      );
    });

    test('returns true for url payload', () {
      expect(
        shouldSaveFcmTapPayloadCache(<String, String>{
          'url': '/channels/1/2/3',
        }),
        isTrue,
      );
    });

    test('returns false for generic alert without navigation fields', () {
      expect(
        shouldSaveFcmTapPayloadCache(<String, String>{
          'title': 'Hello',
          'body': 'World',
        }),
        isFalse,
      );
    });

    test('returns false for empty payload', () {
      expect(shouldSaveFcmTapPayloadCache(<String, String>{}), isFalse);
    });
  });
}
