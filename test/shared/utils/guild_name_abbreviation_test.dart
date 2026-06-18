import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';

void main() {
  group('abbreviateGuildName', () {
    const cases = <(String, int, String)>[
      ('test one two three', 4, 'tott'),
      ('Test One Two Three', 4, 'TOTT'),
      ('Fluxer', 4, 'F'),
      ('fluxer', 4, 'f'),
      ('one two three four five', 4, 'ottf'),
      ('one two three four five', 2, 'ot'),
      ('   ', 4, '?'),
      ('test one', 0, ''),
      ('test-2🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛v🐛', 4, 't'),
      ('💖tes tes', 4, '💖t'),
    ];

    for (final (input, maxLength, expected) in cases) {
      test('"$input" (max $maxLength) -> "$expected"', () {
        expect(abbreviateGuildName(input, maxLength: maxLength), expected);
      });
    }
  });

  group('guildNameInitialsLength', () {
    test('counts untruncated initials for font sizing', () {
      expect(abbreviateGuildName('one two three four five'), 'ottf');
      expect(guildNameInitialsLength('one two three four five'), 5);
    });
  });
}
