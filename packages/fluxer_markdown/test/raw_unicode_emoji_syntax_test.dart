import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
import 'package:markdown/markdown.dart' as md;

void main() {
  test('matches heart with variation selector', () {
    final RegExp regex = RegExp(r'\u2764(?:\uFE0F)?');
    final md.Document doc = md.Document(
      encodeHtml: false,
      withDefaultBlockSyntaxes: false,
      blockSyntaxes: const [],
      inlineSyntaxes: [FluxerRawUnicodeEmojiSyntax(regex)],
    );
    final nodes = doc.parseInline('❤️❤️❤️❤️');
    final emojiNodes = nodes.whereType<md.Element>().where(
      (e) => e.tag == 'emoji-unicode',
    );
    expect(emojiNodes.length, 4);
  });

  test('matches heart without variation selector', () {
    final RegExp regex = RegExp(r'\u2764(?:\uFE0F)?');
    final md.Document doc = md.Document(
      encodeHtml: false,
      withDefaultBlockSyntaxes: false,
      blockSyntaxes: const [],
      inlineSyntaxes: [FluxerRawUnicodeEmojiSyntax(regex)],
    );
    final nodes = doc.parseInline('❤❤❤❤');
    final emojiNodes = nodes.whereType<md.Element>().where(
      (e) => e.tag == 'emoji-unicode',
    );
    expect(emojiNodes.length, 4);
  });
}
