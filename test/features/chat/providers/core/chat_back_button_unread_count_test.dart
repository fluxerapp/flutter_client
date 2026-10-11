import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_back_button_unread_count.dart';

void main() {
  group('countMentionsOutsideChannel', () {
    const Map<String, int> mentions = <String, int>{
      'channel-a': 2,
      'channel-b': 3,
      'dm-1': 4,
    };

    test('sums every channel except the open one', () {
      expect(
        countMentionsOutsideChannel(
          mentionCountByChannel: mentions.entries,
          currentChannelId: 'channel-b',
        ),
        6,
      );
    });

    test('sums everything when the open channel has no mentions', () {
      expect(
        countMentionsOutsideChannel(
          mentionCountByChannel: mentions.entries,
          currentChannelId: 'channel-z',
        ),
        9,
      );
    });
  });
}
