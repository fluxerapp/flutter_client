import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/utils/channel_mention_utils.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

Channel _channel(ChannelType type) {
  return Channel(id: '1', guildId: '2', name: 'channel', type: type);
}

void main() {
  group('isClickableChannelMention', () {
    test('returns true for guild text, voice, and link channels', () {
      expect(
        isClickableChannelMention(_channel(ChannelType.guildText)),
        isTrue,
      );
      expect(
        isClickableChannelMention(_channel(ChannelType.guildVoice)),
        isTrue,
      );
      expect(
        isClickableChannelMention(_channel(ChannelType.guildLink)),
        isTrue,
      );
    });

    test('returns false for category and private channel types', () {
      expect(
        isClickableChannelMention(_channel(ChannelType.guildCategory)),
        isFalse,
      );
      expect(isClickableChannelMention(_channel(ChannelType.dm)), isFalse);
      expect(isClickableChannelMention(_channel(ChannelType.groupDm)), isFalse);
      expect(
        isClickableChannelMention(_channel(ChannelType.dmPersonalNotes)),
        isFalse,
      );
    });
  });

  group('findChannelMentionFallback', () {
    const List<MessageChannelMention> mentions = <MessageChannelMention>[
      MessageChannelMention(id: '100', name: 'rules', type: 0),
      MessageChannelMention(id: '200', name: 'voice', type: 2),
    ];

    test('returns matching mention by id', () {
      expect(
        findChannelMentionFallback(mentions, '200'),
        const MessageChannelMention(id: '200', name: 'voice', type: 2),
      );
    });

    test('returns null when mention is missing', () {
      expect(findChannelMentionFallback(mentions, '999'), isNull);
    });
  });
}
