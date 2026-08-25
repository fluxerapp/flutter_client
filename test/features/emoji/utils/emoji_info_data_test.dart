import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/emoji/domain/emoji_info_data.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await EmojiRegistry.preload();
  });

  group('favoriteKeyForCustomEmoji', () {
    test('returns custom favorite key when guild id is available', () {
      expect(
        favoriteKeyForCustomEmoji(
          emojiId: 'emoji-1',
          name: 'party',
          animated: false,
          guildId: 'guild-1',
        ),
        'custom:guild-1:emoji-1',
      );
    });

    test('returns null when guild id is missing', () {
      expect(
        favoriteKeyForCustomEmoji(
          emojiId: 'emoji-1',
          name: 'party',
          animated: false,
          guildId: null,
        ),
        isNull,
      );
    });
  });

  group('EmojiInfoData', () {
    test('builds custom favorite key when guild id is available', () {
      const data = EmojiInfoData(
        id: 'emoji-1',
        name: 'party',
        guildId: 'guild-1',
      );

      expect(data.favoriteKeyForGuild('guild-1'), 'custom:guild-1:emoji-1');
    });

    test('returns null for custom emoji without guild id', () {
      const data = EmojiInfoData(id: 'emoji-1', name: 'party');

      expect(data.favoriteKeyForGuild(null), isNull);
    });

    test('returns unicode favorite key for known surrogate', () {
      final entry = EmojiRegistry.allEmojis.first;
      final data = EmojiInfoData(name: entry.surrogates);

      expect(data.favoriteKeyForGuild(null), 'unicode:${entry.primaryName}');
    });

    test('formats custom emoji display names', () {
      const data = EmojiInfoData(id: 'emoji-1', name: 'party');

      expect(data.displayName, ':party:');
    });

    test('formats unicode emoji display names from surrogates', () {
      final entry = EmojiRegistry.allEmojis.first;
      final data = EmojiInfoData(name: entry.surrogates);

      expect(data.displayName, ':${entry.primaryName}:');
    });
  });
}
