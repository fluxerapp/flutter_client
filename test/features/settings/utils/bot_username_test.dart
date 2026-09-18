import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/utils/bot_username.dart';

void main() {
  group('botUsernameRules', () {
    test('treats empty as invalid length and valid characters', () {
      final BotUsernameRules rules = botUsernameRules('');
      expect(rules.validLength, isFalse);
      expect(rules.validCharacters, isTrue);
    });

    test('trims before checking length and characters', () {
      final BotUsernameRules padded = botUsernameRules(' Joi ');
      expect(padded.validLength, isTrue);
      expect(padded.validCharacters, isTrue);

      final BotUsernameRules spaces = botUsernameRules('   ');
      expect(spaces.validLength, isFalse);
      expect(spaces.validCharacters, isTrue);
    });

    test('rejects characters outside letters, numbers, and underscores', () {
      final BotUsernameRules rules = botUsernameRules('joi-bot');
      expect(rules.validLength, isTrue);
      expect(rules.validCharacters, isFalse);
    });
  });
}
