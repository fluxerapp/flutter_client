import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/push_notification_sound.dart';

void main() {
  group('resolvePushNotificationAndroidSound', () {
    test('uses bundled message clip for guild messages', () {
      expect(
        resolvePushNotificationAndroidSound(const <String, String>{
          'guild_id': 'guild-1',
        }),
        kPushNotificationMessageAndroidSound,
      );
    });

    test('uses bundled direct message clip for DMs', () {
      expect(
        resolvePushNotificationAndroidSound(const <String, String>{
          'guild_id': '@me',
        }),
        kPushNotificationDirectMessageAndroidSound,
      );
    });

    test('treats missing guild id as a direct message', () {
      expect(
        resolvePushNotificationAndroidSound(const <String, String>{}),
        kPushNotificationDirectMessageAndroidSound,
      );
    });

    test('skips clear payloads', () {
      expect(
        resolvePushNotificationAndroidSound(const <String, String>{
          'type': 'notification_clear',
        }),
        isNull,
      );
    });
  });

  group('resolvePushNotificationDarwinSound', () {
    test('returns guild message caf for community messages', () {
      expect(
        resolvePushNotificationDarwinSound(const <String, String>{
          'guild_id': 'guild-1',
        }),
        kPushNotificationMessageDarwinSound,
      );
    });

    test('returns direct message caf for DMs', () {
      expect(
        resolvePushNotificationDarwinSound(const <String, String>{
          'guild_id': '@me',
        }),
        kPushNotificationDirectMessageDarwinSound,
      );
    });
  });
}
