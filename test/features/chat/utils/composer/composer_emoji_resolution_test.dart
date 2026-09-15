import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_emoji_resolution.dart';

void main() {
  String? lookup(String nameLower) =>
      nameLower == 'custom' ? '<:custom:999>' : null;

  group('resolveTypedCustomEmojiShortcodes', () {
    test('resolves an available custom shortcode to its markdown', () {
      expect(
        resolveTypedCustomEmojiShortcodes('hi :custom: there', lookup),
        'hi <:custom:999> there',
      );
    });

    test('leaves an unknown shortcode untouched', () {
      expect(
        resolveTypedCustomEmojiShortcodes('hi :smile: there', lookup),
        'hi :smile: there',
      );
    });

    test('leaves a shortcode inside a URL untouched', () {
      expect(
        resolveTypedCustomEmojiShortcodes(
          'see https://x.com/:custom:/p',
          lookup,
        ),
        'see https://x.com/:custom:/p',
      );
    });

    test('leaves existing custom-emoji markdown untouched', () {
      expect(
        resolveTypedCustomEmojiShortcodes('<:custom:1>', lookup),
        '<:custom:1>',
      );
    });

    test('leaves existing animated custom-emoji markdown untouched', () {
      expect(
        resolveTypedCustomEmojiShortcodes('<a:custom:1>', lookup),
        '<a:custom:1>',
      );
    });

    test('returns content unchanged when no colon is present', () {
      expect(
        resolveTypedCustomEmojiShortcodes('plain text', lookup),
        'plain text',
      );
    });
  });
}
