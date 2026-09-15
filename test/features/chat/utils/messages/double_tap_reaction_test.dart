import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/messages/double_tap_reaction.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';

void main() {
  group('customEmojiAnimated', () {
    test('returns false when id is missing', () {
      expect(customEmojiAnimated(const [], null), isFalse);
      expect(customEmojiAnimated(const [], ''), isFalse);
    });

    test('returns the matching guild emoji animated flag', () {
      final emojis = [
        GuildEmojiEntry(id: '1', name: 'still', animated: false, guildId: 'g'),
        GuildEmojiEntry(id: '2', name: 'spin', animated: true, guildId: 'g'),
      ];
      expect(customEmojiAnimated(emojis, '2'), isTrue);
      expect(customEmojiAnimated(emojis, '1'), isFalse);
      expect(customEmojiAnimated(emojis, 'missing'), isFalse);
    });
  });

  group('doubleTapReactionFromSelected', () {
    test('maps unicode to surrogates without an id', () {
      const emoji = FluxerSelectedEmoji(name: 'thumbsup', surrogates: '👍');
      final mapped = doubleTapReactionFromSelected(emoji);
      expect(mapped.name, '👍');
      expect(mapped.id, isNull);
    });

    test('maps custom emoji to name and id', () {
      const emoji = FluxerSelectedEmoji(
        name: 'pepe',
        surrogates: '<:pepe:123>',
        emojiId: '123',
      );
      final mapped = doubleTapReactionFromSelected(emoji);
      expect(mapped.name, 'pepe');
      expect(mapped.id, '123');
    });
  });
}
