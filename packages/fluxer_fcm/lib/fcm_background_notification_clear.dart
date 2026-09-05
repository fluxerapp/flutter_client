import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_fcm/fcm_background_local_notifications.dart';
import 'package:fluxer_fcm/fcm_notification_clear_hooks.dart';
import 'package:fluxer_fcm/fcm_notification_clear_targets.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';

Future<void> handleFcmBackgroundNotificationClear(
  FcmPushMessage message,
) async {
  await _cancelChannelNotifications(message.payload);
  await _runClearHook(message.payload);
}

Future<void> _cancelChannelNotifications(Map<String, String> payload) async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
    return;
  }
  final String? channelTag = resolveFcmClearChannelTag(payload);
  if (channelTag == null) {
    return;
  }
  try {
    final FlutterLocalNotificationsPlugin plugin =
        await resolveFcmBackgroundNotificationsPlugin();
    final String? literalTag = resolveFcmClearLiteralTag(payload);
    final List<ActiveNotification> active = await plugin
        .getActiveNotifications();
    for (final ActiveNotification notification in active) {
      if (!fcmClearTargetMatches(
        channelTag: channelTag,
        literalTag: literalTag,
        activeTag: notification.tag,
        activeGroupKey: notification.groupKey,
      )) {
        continue;
      }
      final int? id = notification.id;
      if (id == null) {
        continue;
      }
      try {
        await plugin.cancel(id: id, tag: notification.tag);
      } on Object catch (error, stackTrace) {
        if (kDebugMode) {
          debugPrint(
            '[FcmBackgroundClear] cancel failed id=$id: $error\n$stackTrace',
          );
        }
      }
    }
  } on Object catch (error, stackTrace) {
    if (kDebugMode) {
      debugPrint('[FcmBackgroundClear] scan failed: $error\n$stackTrace');
    }
  }
}

Future<void> _runClearHook(Map<String, String> payload) async {
  try {
    await FcmNotificationClearHooks.handleClear(payload);
  } on Object catch (error, stackTrace) {
    if (kDebugMode) {
      debugPrint('[FcmBackgroundClear] hook failed: $error\n$stackTrace');
    }
  }
}
