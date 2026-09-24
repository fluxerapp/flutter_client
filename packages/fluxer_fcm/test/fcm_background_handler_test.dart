import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_message_mapper.dart';

void main() {
  test('background data-only messages expose ciphertext and nothing else', () {
    final RemoteMessage input = RemoteMessage(
      messageId: 'bg-data',
      data: <String, String>{
        'v': '1',
        'p': 'ciphertext',
        'title': 'alice',
        'body': 'hello',
      },
    );
    expect(extractFcmCiphertext(input.data), 'ciphertext');
    expect(mapRemoteMessage(input).payload.keys, <String>['p']);
  });
}
