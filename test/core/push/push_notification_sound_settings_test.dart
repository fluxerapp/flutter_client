import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/android_push_channels.dart';
import 'package:fluxer_app/core/push/android_push_conversation_history.dart';
import 'package:fluxer_app/core/push/android_push_conversation_notification.dart';
import 'package:fluxer_app/core/push/push_notification_sound.dart';
import 'package:fluxer_app/core/push/push_notification_sound_settings.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';

const Map<String, String> _guildPush = <String, String>{'guild_id': 'g1'};
const Map<String, String> _dmPush = <String, String>{'guild_id': '@me'};
const Map<String, String> _forumPush = <String, String>{
  'guild_id': 'g1',
  'notif_type_id': '9',
  'parent_id': 'forum-1',
};

AndroidNotificationDetails _details(
  Map<String, String> payload, {
  required bool soundEnabled,
  bool alert = true,
}) {
  return buildAndroidConversationNotificationDetails(
    payload: payload,
    lines: const <PushConversationLine>[
      PushConversationLine(
        messageId: '1',
        senderName: 'Alice',
        senderKey: 'a',
        body: 'hey',
        timestampMs: 1000,
      ),
    ],
    conversationTag: 'channel:1',
    alert: alert,
    soundEnabled: soundEnabled,
  );
}

void main() {
  group('PushNotificationSoundSettings.fromPreferences', () {
    test('defaults keep both message sounds on', () {
      expect(
        PushNotificationSoundSettings.fromPreferences(
          const SoundPreferencesState(),
        ),
        const PushNotificationSoundSettings(message: true, directMessage: true),
      );
    });

    test('disable all sounds turns both off', () {
      expect(
        PushNotificationSoundSettings.fromPreferences(
          const SoundPreferencesState(allSoundsDisabled: true),
        ),
        const PushNotificationSoundSettings(
          message: false,
          directMessage: false,
        ),
      );
    });

    test('per sound toggles map to community and direct messages', () {
      expect(
        PushNotificationSoundSettings.fromPreferences(
          const SoundPreferencesState(
            disabledSounds: <String, bool>{kSoundTypeMessage: true},
          ),
        ),
        const PushNotificationSoundSettings(
          message: false,
          directMessage: true,
        ),
      );
      expect(
        PushNotificationSoundSettings.fromPreferences(
          const SoundPreferencesState(
            disabledSounds: <String, bool>{kSoundTypeDirectMessage: true},
          ),
        ),
        const PushNotificationSoundSettings(
          message: true,
          directMessage: false,
        ),
      );
    });
  });

  group('PushNotificationSoundSettings.allows', () {
    const PushNotificationSoundSettings communityOff =
        PushNotificationSoundSettings(message: false, directMessage: true);

    test('picks the toggle from the payload kind', () {
      expect(communityOff.allows(_guildPush), isFalse);
      expect(communityOff.allows(_forumPush), isFalse);
      expect(communityOff.allows(_dmPush), isTrue);
      expect(communityOff.allows(const <String, String>{}), isTrue);
    });
  });

  group('PushNotificationSoundSettingsMirror', () {
    test('writes per account and skips unchanged settings', () {
      final List<(String, PushNotificationSoundSettings)> writes =
          <(String, PushNotificationSoundSettings)>[];
      final PushNotificationSoundSettingsMirror mirror =
          PushNotificationSoundSettingsMirror((
            String userId,
            PushNotificationSoundSettings settings,
          ) async {
            writes.add((userId, settings));
          });
      const SoundPreferencesState off = SoundPreferencesState(
        allSoundsDisabled: true,
      );
      mirror
        ..sync(userId: null, prefs: off)
        ..sync(userId: 'u1', prefs: off)
        ..sync(userId: 'u1', prefs: off)
        ..sync(userId: 'u2', prefs: off)
        ..sync(userId: 'u2', prefs: const SoundPreferencesState());
      expect(writes, <(String, PushNotificationSoundSettings)>[
        (
          'u1',
          const PushNotificationSoundSettings(
            message: false,
            directMessage: false,
          ),
        ),
        (
          'u2',
          const PushNotificationSoundSettings(
            message: false,
            directMessage: false,
          ),
        ),
        (
          'u2',
          const PushNotificationSoundSettings(
            message: true,
            directMessage: true,
          ),
        ),
      ]);
    });
  });

  group('androidPushChannelId', () {
    test('keeps the sounding channels when sound is on', () {
      expect(androidPushChannelId(_guildPush), kAndroidPushMessageChannelId);
      expect(androidPushChannelId(_dmPush), kAndroidPushDirectMessageChannelId);
      expect(
        androidPushChannelId(_forumPush),
        kAndroidPushForumThreadCreatedChannelId,
      );
    });

    test('uses the silent channels when sound is off', () {
      expect(
        androidPushChannelId(_guildPush, soundEnabled: false),
        kAndroidPushSilentMessageChannelId,
      );
      expect(
        androidPushChannelId(_forumPush, soundEnabled: false),
        kAndroidPushSilentMessageChannelId,
      );
      expect(
        androidPushChannelId(_dmPush, soundEnabled: false),
        kAndroidPushSilentDirectMessageChannelId,
      );
      expect(
        androidPushChannelName(_dmPush, soundEnabled: false),
        kAndroidPushSilentDirectMessageChannelName,
      );
    });
  });

  group('buildAndroidConversationNotificationDetails', () {
    test('plays the message clip when sound is on', () {
      final AndroidNotificationDetails details = _details(
        _guildPush,
        soundEnabled: true,
      );
      expect(details.channelId, kAndroidPushMessageChannelId);
      expect(details.sound, kPushNotificationMessageAndroidSound);
      expect(details.playSound, isTrue);
    });

    test('posts silently on the silent channel when sound is off', () {
      final AndroidNotificationDetails details = _details(
        _dmPush,
        soundEnabled: false,
      );
      expect(details.channelId, kAndroidPushSilentDirectMessageChannelId);
      expect(details.sound, isNull);
      expect(details.playSound, isFalse);
      expect(details.enableVibration, isTrue);
      expect(details.importance, Importance.high);
    });
  });
}
