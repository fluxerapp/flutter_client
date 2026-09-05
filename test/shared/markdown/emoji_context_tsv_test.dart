import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/markdown/emoji_context_tsv.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_markdown_native/fluxer_markdown_native.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await EmojiRegistry.preload();
  });

  test('standard records carry utf8 byte offsets and lengths', () {
    final String tsv = buildFluxerEmojiContextTsv('ab \u{1F600} cd');
    expect(tsv, contains('S\t3\t4\t\u{1F600}\tgrinning\t1f600'));
  });

  test('trademark style symbols are skipped', () {
    expect(buildFluxerEmojiContextTsv('\u2122 \u00A9\uFE0F \u00AE'), isEmpty);
  });

  test('shortcode records resolve names and skin tones', () {
    final String tsv = buildFluxerEmojiContextTsv('hi :wave: there');
    expect(tsv, contains('C\twave\t\u{1F44B}\t1f44b'));
    expect(tsv, contains('K\twave\t3\t\u{1F44B}\u{1F3FD}\t1f44b-1f3fd'));
  });

  test('special shortcodes are not emitted', () {
    expect(buildFluxerEmojiContextTsv(':tm: :copyright:'), isEmpty);
  });

  test('round trip: raw unicode emoji becomes a standard emoji node', () {
    const String input = 'before \u{1F600} after';
    final nodes = parseFluxerMarkdownBinary(
      input,
      emojiContextTsv: buildFluxerEmojiContextTsv(input),
    );
    final emoji = nodes.whereType<MdEmoji>().single;
    final kind = emoji.kind as MdStandardEmoji;
    expect(kind.raw, '\u{1F600}');
    expect(kind.name, 'grinning');
  });

  test('round trip: shortcode with skin tone swaps the surrogate', () {
    const String input = ':wave::skin-tone-3:';
    final nodes = parseFluxerMarkdownBinary(
      input,
      emojiContextTsv: buildFluxerEmojiContextTsv(input),
    );
    final emoji = nodes.whereType<MdEmoji>().single;
    final kind = emoji.kind as MdStandardEmoji;
    expect(kind.raw, '\u{1F44B}\u{1F3FD}');
  });

  test('round trip: emoji inside inline code stays literal', () {
    const String input = '`\u{1F600}`';
    final nodes = parseFluxerMarkdownBinary(
      input,
      emojiContextTsv: buildFluxerEmojiContextTsv(input),
    );
    expect(nodes.whereType<MdEmoji>(), isEmpty);
    expect(nodes.whereType<MdInlineCode>().single.content, '\u{1F600}');
  });
}
