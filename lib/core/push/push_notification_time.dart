import 'package:fluxer_app/core/push/push_notification_ids.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

const int _kMaxFutureSkewMs = 60 * 1000;

/// Event time for the notification shade, from the message snowflake when possible.
int? resolvePushNotificationWhenMillis(Map<String, String> payload) {
  final String? messageId = resolvePushNotificationMessageId(payload);
  final int? ms = snowflakeTimestampMsOrNull(messageId);
  if (ms == null || ms < kSnowflakeEpochMs) {
    return null;
  }
  final int now = DateTime.now().millisecondsSinceEpoch;
  if (ms > now + _kMaxFutureSkewMs) {
    return null;
  }
  return ms;
}
