import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';

void main() {
  test('insets the first non-diversity sprite', () {
    expect(
      EmojiSpriteSheet.spriteRect(0, diversity: false),
      const Rect.fromLTWH(1, 1, 62, 62),
    );
  });

  test('advances one 64px column for the next non-diversity sprite', () {
    expect(
      EmojiSpriteSheet.spriteRect(1, diversity: false),
      const Rect.fromLTWH(65, 1, 62, 62),
    );
  });

  test('wraps to the next row after 42 non-diversity sprites', () {
    expect(
      EmojiSpriteSheet.spriteRect(42, diversity: false),
      const Rect.fromLTWH(1, 65, 62, 62),
    );
  });

  test('wraps to the next row after 10 diversity sprites', () {
    expect(
      EmojiSpriteSheet.spriteRect(10, diversity: true),
      const Rect.fromLTWH(1, 65, 62, 62),
    );
  });
}
