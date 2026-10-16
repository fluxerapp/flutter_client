import 'package:fluxer_app/core/push/push_notification_payload.dart';

const String kAndroidPushMessageChannelId = 'fluxer_messages';
const String kAndroidPushDirectMessageChannelId = 'fluxer_direct_messages';
const String kAndroidPushForumThreadCreatedChannelId =
    'fluxer_forum_thread_created';
const String kAndroidPushSilentMessageChannelId = 'fluxer_messages_silent';
const String kAndroidPushSilentDirectMessageChannelId =
    'fluxer_direct_messages_silent';

const String kAndroidPushMessageChannelName = 'Messages';
const String kAndroidPushDirectMessageChannelName = 'Direct messages';
const String kAndroidPushForumThreadCreatedChannelName = 'New forum posts';
const String kAndroidPushSilentMessageChannelName = 'Messages without sound';
const String kAndroidPushSilentDirectMessageChannelName =
    'Direct messages without sound';

const String kAndroidPushChannelDescription = 'Messages and alerts';
const String kAndroidPushNotificationIcon = '@drawable/fluxer_logo_monochrome';

String androidPushChannelId(
  Map<String, String> payload, {
  bool soundEnabled = true,
}) {
  if (isDmPushPayload(payload)) {
    return soundEnabled
        ? kAndroidPushDirectMessageChannelId
        : kAndroidPushSilentDirectMessageChannelId;
  }
  if (!soundEnabled) {
    return kAndroidPushSilentMessageChannelId;
  }
  if (isForumThreadCreatedPushPayload(payload)) {
    return kAndroidPushForumThreadCreatedChannelId;
  }
  return kAndroidPushMessageChannelId;
}

String androidPushChannelName(
  Map<String, String> payload, {
  bool soundEnabled = true,
}) {
  if (isDmPushPayload(payload)) {
    return soundEnabled
        ? kAndroidPushDirectMessageChannelName
        : kAndroidPushSilentDirectMessageChannelName;
  }
  if (!soundEnabled) {
    return kAndroidPushSilentMessageChannelName;
  }
  if (isForumThreadCreatedPushPayload(payload)) {
    return kAndroidPushForumThreadCreatedChannelName;
  }
  return kAndroidPushMessageChannelName;
}
