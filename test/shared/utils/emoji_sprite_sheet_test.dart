import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';

void main() {
  test('keeps the outer pixel of the first non-diversity cell', () {
    expect(
      EmojiSpriteSheet.spriteRect(0, diversity: false),
      const Rect.fromLTWH(0, 0, 64, 64),
    );
  });

  test('advances one full 64px column for the next non-diversity sprite', () {
    expect(
      EmojiSpriteSheet.spriteRect(1, diversity: false),
      const Rect.fromLTWH(64, 0, 64, 64),
    );
  });

  test('wraps to the next full 64px row after 42 non-diversity sprites', () {
    expect(
      EmojiSpriteSheet.spriteRect(42, diversity: false),
      const Rect.fromLTWH(0, 64, 64, 64),
    );
  });

  test('wraps to the next full 64px row after 10 diversity sprites', () {
    expect(
      EmojiSpriteSheet.spriteRect(10, diversity: true),
      const Rect.fromLTWH(0, 64, 64, 64),
    );
  });
}
