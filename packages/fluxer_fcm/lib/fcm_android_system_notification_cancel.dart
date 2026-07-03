import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_fcm/fcm_system_notification_cancel_hooks.dart';

int fcmJavaStringHashCode(String value) {
  int hash = 0;
  for (final int unit in value.codeUnits) {
    hash = hash * 31 + unit;
  }
  return hash;
}

Iterable<String> collectFcmCandidateMessageIds({
  required String messageId,
  Map<String, String> payload = const <String, String>{},
}) {
  final Set<String> ids = <String>{};
  if (messageId.isNotEmpty) {
    ids.add(messageId);
  }
  final String? payloadMessageId = payload['message_id'];
  if (payloadMessageId != null && payloadMessageId.isNotEmpty) {
    ids.add(payloadMessageId);
  }
  final String? payloadId = payload['id'];
  if (payloadId != null && payloadId.isNotEmpty) {
    ids.add(payloadId);
  }
  return ids;
}

Iterable<int> fcmSystemNotificationCancelIds(Iterable<String> messageIds) {
  final Set<int> ids = <int>{};
  for (final String messageId in messageIds) {
    if (messageId.isEmpty) {
      continue;
    }
    final int javaHash = fcmJavaStringHashCode(messageId);
    ids.add(javaHash);
    final int positiveJavaHash = javaHash & 0x7FFFFFFF;
    if (positiveJavaHash != 0) {
      ids.add(positiveJavaHash);
    }
  }
  return ids;
}

Future<void> cancelFcmSystemNotificationDuplicates(
  FlutterLocalNotificationsPlugin plugin, {
  required Iterable<String> messageIds,
  required int excludeNotificationId,
}) async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
    return;
  }
  for (final int id in fcmSystemNotificationCancelIds(messageIds)) {
    if (id == excludeNotificationId) {
      continue;
    }
    try {
      await plugin.cancel(id: id);
    } on Object catch (error, stackTrace) {
      if (kDebugMode) {
        debugPrint(
          '[FcmSystemNotificationCancel] cancel id=$id failed: '
          '$error\n$stackTrace',
        );
      }
    }
  }
}

Future<void> deduplicateFcmSystemNotifications({
  required FlutterLocalNotificationsPlugin plugin,
  required Iterable<String> messageIds,
  required int excludeNotificationId,
  required Future<void> Function() showLocalNotification,
}) async {
  await FcmSystemNotificationCancelHooks.tryCancelDuplicates(
    messageIds: messageIds,
    excludeNotificationId: excludeNotificationId,
  );
  await showLocalNotification();
  await cancelFcmSystemNotificationDuplicates(
    plugin,
    messageIds: messageIds,
    excludeNotificationId: excludeNotificationId,
  );
}
