import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_message_mapper.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';

void main() {
  group('extractFcmCiphertext', () {
    test('reads the data-only ciphertext field', () {
      final RemoteMessage input = RemoteMessage(
        messageId: 'msg-1',
        data: <String, String>{'v': '1', 'p': 'abc'},
        notification: const RemoteNotification(title: 'alice', body: 'hello'),
      );
      expect(extractFcmCiphertext(input.data), 'abc');
      final FcmPushMessage message = mapRemoteMessage(input);
      expect(message.payload['p'], 'abc');
      expect(message.title, isNull);
      expect(message.body, isNull);
    });

    test('ignores messages without ciphertext', () {
      final RemoteMessage input = RemoteMessage(
        data: <String, String>{'title': 'from-data', 'body': 'body-data'},
      );
      expect(extractFcmCiphertext(input.data), isNull);
      expect(mapRemoteMessage(input).payload, isEmpty);
    });
  });
}
