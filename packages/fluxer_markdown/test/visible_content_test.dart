import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/utils/visible_content.dart';

void main() {
  group('isInvisibleContentCodePoint', () {
    test('matches web and API invisible ranges', () {
      const List<int> invisibleSamples = <int>[
        0x0000,
        0x00ad,
        0x034f,
        0x061c,
        0x115f,
        0x1160,
        0x17b4,
        0x17b5,
        0x180e,
        0x200b,
        0x200c,
        0x200d,
        0x200e,
        0x200f,
        0x202a,
        0x202e,
        0x2060,
        0x2069,
        0x2800,
        0x3164,
        0xfe00,
        0xfe0f,
        0xfeff,
        0xffa0,
        0xe0100,
        0xe01ef,
      ];

      for (final int codePoint in invisibleSamples) {
        expect(
          isInvisibleContentCodePoint(codePoint),
          isTrue,
          reason: 'U+${codePoint.toRadixString(16).toUpperCase()}',
        );
      }
    });

    test('does not treat visible characters as invisible', () {
      expect(isInvisibleContentCodePoint(0x41), isFalse);
      expect(isInvisibleContentCodePoint(0x1f600), isFalse);
    });
  });

  group('hasVisibleContent', () {
    test('rejects whitespace and invisible-only strings', () {
      expect(hasVisibleContent(''), isFalse);
      expect(hasVisibleContent(' \t\n'), isFalse);
      expect(hasVisibleContent('\u00a0'), isFalse);
      expect(hasVisibleContent('\u200e \u200b\ufeff'), isFalse);
      expect(hasVisibleContent('\u2800\u3164\u{E0100}'), isFalse);
    });

    test('returns false for zero-width space only', () {
      expect(hasVisibleContent('\u200b'), isFalse);
    });

    test('allows any visible character', () {
      expect(hasVisibleContent('hello'), isTrue);
      expect(hasVisibleContent('\u200e hello'), isTrue);
      expect(hasVisibleContent('🙂'), isTrue);
      expect(hasVisibleContent('` `'), isTrue);
      expect(hasVisibleContent('*'), isTrue);
    });

    test('returns true when invisible chars accompany visible text', () {
      expect(hasVisibleContent('a\u200bb'), isTrue);
    });
  });
}
