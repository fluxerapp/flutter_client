const String kLocalNotificationMessageIdKey = '_local_notification_message_id';

int pushGroupSummaryNotificationId(String groupKey) {
  return pushMessageNotificationId('summary:$groupKey');
}

int pushMessageNotificationId(String messageId) {
  const int maxPositiveInt31 = 0x7FFFFFFF;
  final int hash = messageId.hashCode;
  final int masked = hash & maxPositiveInt31;
  if (masked != 0) {
    return masked;
  }
  return 1;
}

int javaStringHashCode(String value) {
  int hash = 0;
  for (final int unit in value.codeUnits) {
    hash = hash * 31 + unit;
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
  final Set<int> ids = <int>{pushMessageNotificationId(messageId)};
  final int javaHash = javaStringHashCode(messageId);
  ids.add(javaHash);
  final int positiveJavaHash = javaHash & 0x7FFFFFFF;
  if (positiveJavaHash != 0) {
    ids.add(positiveJavaHash);
  }
  return ids;
}

String? _nonEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}
