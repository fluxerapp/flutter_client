import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';

const String kPushNotificationMessageSoundRaw = 'message';
const String kPushNotificationDirectMessageSoundRaw = 'direct_message';
const String kPushNotificationMessageDarwinSound = 'message.caf';
const String kPushNotificationDirectMessageDarwinSound = 'direct_message.caf';

const AndroidNotificationSound kPushNotificationMessageAndroidSound =
    RawResourceAndroidNotificationSound(kPushNotificationMessageSoundRaw);

const AndroidNotificationSound kPushNotificationDirectMessageAndroidSound =
    RawResourceAndroidNotificationSound(kPushNotificationDirectMessageSoundRaw);

bool shouldPlayPushNotificationSound(Map<String, String> payload) {
  return !isNotificationClearPayload(payload);
}

String? resolvePushNotificationDarwinSound(Map<String, String> payload) {
  if (!shouldPlayPushNotificationSound(payload)) {
    return null;
  }
  if (isDmPushPayload(payload)) {
    return kPushNotificationDirectMessageDarwinSound;
  }
  return kPushNotificationMessageDarwinSound;
}

AndroidNotificationSound? resolvePushNotificationAndroidSound(
  Map<String, String> payload,
) {
  if (!shouldPlayPushNotificationSound(payload)) {
    return null;
  }
  if (isDmPushPayload(payload)) {
    return kPushNotificationDirectMessageAndroidSound;
  }
  return kPushNotificationMessageAndroidSound;
}
