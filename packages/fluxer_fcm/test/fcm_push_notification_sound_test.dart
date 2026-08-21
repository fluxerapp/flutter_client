import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_push_notification_sound.dart';

void main() {
  group('resolveFcmPushNotificationAndroidSound', () {
    test('uses guild message sound for community pushes', () {
      expect(
        resolveFcmPushNotificationAndroidSound(const <String, String>{
          'guild_id': 'guild-1',
        }),
        kFcmPushNotificationMessageAndroidSound,
      );
    });

    test('uses direct message sound for DMs', () {
      expect(
        resolveFcmPushNotificationAndroidSound(const <String, String>{
          'guild_id': '@me',
        }),
        kFcmPushNotificationDirectMessageAndroidSound,
      );
    });

    test('skips clear payloads', () {
      expect(
        resolveFcmPushNotificationAndroidSound(const <String, String>{
          'type': 'notification_clear',
        }),
        isNull,
      );
    });
  });
}
