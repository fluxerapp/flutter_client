const String kFcmLocalNotificationMessageIdKey =
    '_local_notification_message_id';

int fcmPushMessageNotificationId(String messageId) {
  const int maxPositiveInt31 = 0x7FFFFFFF;
  final int hash = messageId.hashCode;
  final int masked = hash & maxPositiveInt31;
  if (masked != 0) {
    return masked;
  }
  return 1;
}
