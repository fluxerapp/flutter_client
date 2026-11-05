const String kLocalNotificationMessageIdKey = '_local_notification_message_id';

int pushGroupSummaryNotificationId(String groupKey) {
  return pushMessageNotificationId('summary:$groupKey');
}

int pushMessageNotificationId(String messageId) {
  const int maxPositiveInt31 = 0x7FFFFFFF;
  final int masked = javaStringHashCode(messageId) & maxPositiveInt31;
  if (masked != 0) {
    return masked;
  }
  return 1;
}

int javaStringHashCode(String value) {
  int hash = 0;
  for (final int unit in value.codeUnits) {
    hash = (hash * 31 + unit).toSigned(32);
  }
  return hash;
}

String? resolvePushNotificationMessageId(Map<String, String> payload) {
  final String? embedded = _nonEmpty(payload[kLocalNotificationMessageIdKey]);
  if (embedded != null) {
    return embedded;
  }
  return _nonEmpty(payload['message_id']) ?? _nonEmpty(payload['id']);
}

Iterable<int> pushNotificationCancelIds(Map<String, String> payload) {
  final String? messageId = resolvePushNotificationMessageId(payload);
  if (messageId == null) {
    return const <int>[];
  }
  return <int>{
    pushMessageNotificationId(messageId),
    javaStringHashCode(messageId),
  };
}

String? _nonEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}
