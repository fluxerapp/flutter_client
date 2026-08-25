import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const String kFcmPushNotificationMessageSoundRaw = 'message';
const String kFcmPushNotificationDirectMessageSoundRaw = 'direct_message';

const AndroidNotificationSound kFcmPushNotificationMessageAndroidSound =
    RawResourceAndroidNotificationSound(kFcmPushNotificationMessageSoundRaw);

const AndroidNotificationSound kFcmPushNotificationDirectMessageAndroidSound =
    RawResourceAndroidNotificationSound(
      kFcmPushNotificationDirectMessageSoundRaw,
    );

bool isFcmNotificationClearPayload(Map<String, String> payload) {
  if (_isFcmClearValue(payload['type']) || _isFcmClearValue(payload['action'])) {
    return true;
  }
  return false;
}

bool _isFcmClearValue(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  return value == 'notification_clear' || value == 'clear_channel';
}

bool isFcmDmPushPayload(Map<String, String> payload) {
  final String? guildId = payload['guild_id'];
  if (guildId == null || guildId.isEmpty) {
    return true;
  }
  return guildId == '@me' || guildId == 'null';
}

AndroidNotificationSound? resolveFcmPushNotificationAndroidSound(
  Map<String, String> payload,
) {
  if (isFcmNotificationClearPayload(payload)) {
    return null;
  }
  if (isFcmDmPushPayload(payload)) {
    return kFcmPushNotificationDirectMessageAndroidSound;
  }
  return kFcmPushNotificationMessageAndroidSound;
}
