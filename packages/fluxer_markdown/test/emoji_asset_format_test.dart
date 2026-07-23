import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/utils/emoji_asset_format.dart';

void main() {
  group('isWebpEmojiAsset', () {
    test('returns true for RIFF WebP header', () {
      final bytes = Uint8List.fromList([
        0x52,
        0x49,
        0x46,
        0x46,
        0x1A,
        0x00,
        0x00,
        0x00,
        0x57,
        0x45,
        0x42,
        0x50,
        0x56,
        0x50,
        0x38,
        0x4C,
      ]);
      expect(isWebpEmojiAsset(bytes), isTrue);
    });

    test('returns false for non-WebP bytes', () {
      expect(
        isWebpEmojiAsset(Uint8List.fromList('<svg></svg>'.codeUnits)),
        isFalse,
      );
    });
  });

  group('isSvgEmojiAsset', () {
    test('returns true for SVG markup', () {
      expect(
        isSvgEmojiAsset(Uint8List.fromList('<svg></svg>'.codeUnits)),
        isTrue,
      );
    });

    test('returns true with leading whitespace', () {
      expect(
        isSvgEmojiAsset(Uint8List.fromList('  <svg></svg>'.codeUnits)),
        isTrue,
      );
    });

    test('returns true with UTF-8 BOM', () {
      final bytes = Uint8List.fromList([
        0xEF,
        0xBB,
        0xBF,
        ...'<svg></svg>'.codeUnits,
      ]);
      expect(isSvgEmojiAsset(bytes), isTrue);
    });

    test('returns false for unrecognized bytes', () {
      expect(
        isSvgEmojiAsset(Uint8List.fromList('not an image'.codeUnits)),
        isFalse,
      );
    });
  });
}
