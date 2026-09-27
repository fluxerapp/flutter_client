import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_app/core/push/push_notification_reply.dart';

@pragma('vm:entry-point')
void pushNotificationReplyBackground(NotificationResponse response) {
  if (response.actionId != kPushReplyActionId) {
    return;
  }
}
