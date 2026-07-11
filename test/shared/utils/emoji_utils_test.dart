import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';

void main() {
  group('emojiToCodePoints', () {
    test('converts simple emoji to code points', () {
      expect(emojiToCodePoints('\u{1F600}'), '1f600');
    });

    test('converts flag emoji to code points', () {
      expect(emojiToCodePoints('\u{1F1FA}\u{1F1F8}'), '1f1fa-1f1f8');
    });

    test('removes variation selector from non-ZWJ emoji', () {
      expect(emojiToCodePoints('\u2764\uFE0F'), '2764');
      expect(emojiToCodePoints('\u2764\uFE0F'), isNot(contains('fe0f')));
    });

    test('preserves ZWJ in sequences', () {
      const String emoji = '\u{1F468}\u200D\u{1F469}\u200D\u{1F467}';
      expect(emojiToCodePoints(emoji).contains('200d'), isTrue);
    });

    test('keeps variation selectors for ZWJ flag sequences', () {
      const String emoji = '\u{1F3F3}\uFE0F\u200D\u26A7\uFE0F';
      expect(emojiToCodePoints(emoji), '1f3f3-fe0f-200d-26a7-fe0f');
    });

    test('handles empty string', () {
      expect(emojiToCodePoints(''), '');
    });

    test('handles single character', () {
      expect(emojiToCodePoints('A'), '41');
    });
  });

  group('getTwemojiUrl', () {
    test('builds CDN URL from unicode emoji', () {
      expect(
        getTwemojiUrl('\u{1F600}'),
        'https://fluxerstatic.com/emoji/1f600.svg',
      );
    });

    test('returns null for empty input', () {
      expect(getTwemojiUrl(''), isNull);
    });
  });
}
