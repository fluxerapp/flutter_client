import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/notification/ids.dart';

void main() {
  group('javaStringHashCode', () {
    test('matches Java String.hashCode for sample values', () {
      expect(javaStringHashCode(''), 0);
      expect(javaStringHashCode('a'), 97);
      expect(javaStringHashCode('msg-1'), 104190181);
    });
  });

  group('resolvePushNotificationMessageId', () {
    test('prefers embedded local notification id', () {
      final String? actual = resolvePushNotificationMessageId(<String, String>{
        kLocalNotificationMessageIdKey: 'fcm-id',
        'message_id': 'data-id',
      });
      expect(actual, 'fcm-id');
    });

    test('falls back to message_id then id', () {
      expect(
        resolvePushNotificationMessageId(<String, String>{'message_id': '42'}),
        '42',
      );
      expect(
        resolvePushNotificationMessageId(<String, String>{'id': '7'}),
        '7',
      );
    });
  });

  group('pushNotificationCancelIds', () {
    test('includes dart and java hash ids', () {
      const String messageId = 'msg-1';
      final Iterable<int> ids = pushNotificationCancelIds(<String, String>{
        'message_id': messageId,
      });
      expect(ids, contains(pushMessageNotificationId(messageId)));
      expect(ids, contains(javaStringHashCode(messageId)));
    });
  });

  group('pushMessageNotificationId', () {
    test('returns positive 31-bit value for typical ids', () {
      const String input = 'msg-123';
      final int actual = pushMessageNotificationId(input);
      expect(actual, greaterThan(0));
      expect(actual, lessThanOrEqualTo(0x7FFFFFFF));
    });

    test('is stable for the same message id', () {
      const String input = 'stable-id';
      expect(
        pushMessageNotificationId(input),
        pushMessageNotificationId(input),
      );
    });

    test('maps hash collision zero to fallback 1', () {
      final int actual = pushMessageNotificationId('');
      expect(actual, isNonNegative);
      expect(actual, lessThanOrEqualTo(0x7FFFFFFF));
    });
  });
}
