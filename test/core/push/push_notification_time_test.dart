import 'package:fluxer_app/core/push/push_notification_time.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:test/test.dart';

void main() {
  group('resolvePushNotificationWhenMillis', () {
    test('returns snowflake time from message_id', () {
      const int sentMs = kSnowflakeEpochMs + 5000;
      final String messageId = snowflakeFromDateTime(
        DateTime.fromMillisecondsSinceEpoch(sentMs, isUtc: true),
      );
      final int? when = resolvePushNotificationWhenMillis(<String, String>{
        'message_id': messageId,
      });
      expect(when, sentMs);
    });

    test('matches canonical snowflakeTimestampMsOrNull', () {
      final DateTime utc = DateTime.utc(2026, 5, 6, 12, 34, 56);
      final String messageId = snowflakeFromDateTime(utc);
      expect(
        resolvePushNotificationWhenMillis(<String, String>{
          'message_id': messageId,
        }),
        snowflakeTimestampMsOrNull(messageId),
      );
    });

    test('round-trips snowflakeFromDateTime', () {
      final DateTime utc = DateTime.utc(2026, 9, 24, 10, 15, 30);
      final String messageId = snowflakeFromDateTime(utc);
      expect(
        snowflakeTimestampMsOrNull(messageId),
        utc.millisecondsSinceEpoch,
      );
    });

    test('returns null when message_id is missing', () {
      expect(resolvePushNotificationWhenMillis(<String, String>{}), isNull);
    });

    test('returns null for invalid message_id', () {
      expect(
        resolvePushNotificationWhenMillis(<String, String>{
          'message_id': 'not-a-snowflake',
        }),
        isNull,
      );
    });

    test('uses embedded local notification message id', () {
      const int sentMs = kSnowflakeEpochMs + 5000;
      final String messageId = snowflakeFromDateTime(
        DateTime.fromMillisecondsSinceEpoch(sentMs, isUtc: true),
      );
      final int? when = resolvePushNotificationWhenMillis(<String, String>{
        'message_id': '999',
        '_local_notification_message_id': messageId,
      });
      expect(when, sentMs);
    });

    test('parses large snowflake ids with BigInt', () {
      final String messageId = snowflakeFromDateTime(DateTime.utc(2026, 9, 24));
      expect(snowflakeTimestampMsOrNull(messageId), isNotNull);
      expect(
        resolvePushNotificationWhenMillis(<String, String>{
          'message_id': messageId,
        }),
        snowflakeTimestampMsOrNull(messageId),
      );
    });
  });
}
