import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_message_mapper.dart';

void main() {
  test('server-built notification text is not used', () {
    final RemoteMessage input = RemoteMessage(
      messageId: 'bg-regression',
      data: <String, String>{
        'title': 'Emptiest',
        'body': 'Pong!',
        'channel_id': 'asdfqwer',
        'p': 'ciphertext',
      },
      notification: const RemoteNotification(title: 'Emptiest', body: 'Pong!'),
    );
    expect(mapRemoteMessage(input).title, isNull);
    expect(mapRemoteMessage(input).body, isNull);
    expect(mapRemoteMessage(input).payload, <String, String>{'p': 'ciphertext'});
  });
}
