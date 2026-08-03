import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_message_mapper.dart';
import 'package:unifiedpush/unifiedpush.dart' as up;

void main() {
  group('mapUnifiedPushMessage', () {
    test('maps web push nested notification payload with grouping tags', () {
      final up.PushMessage input = up.PushMessage(
        Uint8List.fromList(
          utf8.encode(
            '{"web_push":8030,"tag":"channel:2:1","notification":{'
            '"title":"alice","body":"hello","data":{"message_id":"1",'
            '"channel_id":"2","notification_tag":"channel:2",'
            '"url":"/channels/3/2/1"}}}',
          ),
        ),
        true,
      );
      final PushMessage message = mapUnifiedPushMessage(input);
      expect(message.id, '1');
      expect(message.payload['tag'], 'channel:2:1');
      expect(message.payload['notification_tag'], 'channel:2');
      expect(message.payload['url'], '/channels/3/2/1');
    });

    test('asserts when payload is not decrypted', () {
      final up.PushMessage input = up.PushMessage(
        Uint8List.fromList(<int>[1, 2, 3]),
        false,
      );
      expect(() => mapUnifiedPushMessage(input), throwsAssertionError);
    });
  });
}
