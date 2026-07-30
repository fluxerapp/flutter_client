import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_name_validation.dart';

void main() {
  group('validateGuildEmojiName', () {
    test('accepts valid emoji names', () {
      expect(validateGuildEmojiName('wave'), isNull);
      expect(validateGuildEmojiName('party_parrot'), isNull);
    });

    test('rejects invalid emoji names', () {
      expect(
        validateGuildEmojiName('a'),
        GuildExpressionNameValidationError.tooShort,
      );
      expect(
        validateGuildEmojiName('a' * 33),
        GuildExpressionNameValidationError.tooLong,
      );
      expect(
        validateGuildEmojiName('bad-name'),
        GuildExpressionNameValidationError.invalidCharacters,
      );
    });
  });

  group('validateGuildStickerName', () {
    test('accepts valid sticker names', () {
      expect(validateGuildStickerName('wave'), isNull);
      expect(validateGuildStickerName('party-parrot'), isNull);
    });

    test('rejects invalid sticker names', () {
      expect(
        validateGuildStickerName(''),
        GuildExpressionNameValidationError.tooShort,
      );
      expect(
        validateGuildStickerName('a'),
        GuildExpressionNameValidationError.tooShort,
      );
      expect(
        validateGuildStickerName('a' * 31),
        GuildExpressionNameValidationError.tooLong,
      );
    });
  });

  group('deriveGuildEmojiNameFromFileName', () {
    test('sanitizes file names and trims length', () {
      expect(
        deriveGuildEmojiNameFromFileName('party-parrot.png'),
        'party_parrot',
      );
      expect(deriveGuildEmojiNameFromFileName('a.png'), 'emoji');
      expect(deriveGuildEmojiNameFromFileName('${'a' * 40}.png').length, 32);
    });
  });
}
