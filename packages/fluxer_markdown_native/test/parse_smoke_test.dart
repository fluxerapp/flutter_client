import 'package:fluxer_markdown_native/fluxer_markdown_native.dart';
import 'package:test/test.dart';

void main() {
  test('inline formatting maps to canonical nodes', () {
    final nodes = parseFluxerMarkdown(
      '**bold** *em* __under__ ~~strike~~ `code`',
    );
    expect(nodes, hasLength(9));
    expect(nodes[0], isA<MdStrong>());
    expect(nodes[2], isA<MdEmphasis>());
    expect(nodes[4], isA<MdUnderline>());
    expect(nodes[6], isA<MdStrikethrough>());
    expect((nodes[8] as MdInlineCode).content, 'code');
  });

  test('single tilde stays literal (canonical rule)', () {
    final nodes = parseFluxerMarkdown('a ~single~ b');
    expect(nodes, hasLength(1));
    expect((nodes[0] as MdText).content, 'a ~single~ b');
  });

  test('blockquote and heading', () {
    expect(parseFluxerMarkdown('> Sweden ??').single, isA<MdBlockquote>());
    final heading = parseFluxerMarkdown('# hello').single as MdHeading;
    expect(heading.level, 1);
    expect((heading.children.single as MdText).content, 'hello');
  });

  test('ordered list keeps written start ordinal', () {
    final list = parseFluxerMarkdown('4. a\n9. b').single as MdList;
    expect(list.ordered, isTrue);
    expect(list.items.first.ordinal, 4);
    expect(list.items.last.ordinal, 5);
  });

  test('spoiler, mention, timestamp', () {
    expect(
      (parseFluxerMarkdown('||secret||').single as MdSpoiler).isBlock,
      isFalse,
    );
    final mention = parseFluxerMarkdown('<@1234>').single as MdMention;
    expect((mention.kind as MdUserMention).id, '1234');
    final timestamp =
        parseFluxerMarkdown('<t:1234567890:R>').single as MdTimestamp;
    expect(timestamp.timestamp, 1234567890);
    expect(timestamp.style, MdTimestampStyle.relativeTime);
  });

  test('code block language rules', () {
    final block =
        parseFluxerMarkdown('```dart\nvoid main() {}\n```').single
            as MdCodeBlock;
    expect(block.language, 'dart');
    expect(block.content, 'void main() {}\n');
  });

  test('feature flags gate constructs', () {
    final nodes = parseFluxerMarkdown(
      '# not a heading',
      flags: FluxerParserFlags.none,
    );
    expect(nodes.single, isA<MdText>());
  });

  test('empty input yields no nodes; lone ZWSP stays a text node', () {
    expect(parseFluxerMarkdown(''), isEmpty);
    final zwsp = parseFluxerMarkdown('\u200b').single as MdText;
    expect(zwsp.content, '\u200b');
  });

  test('masked link with guarded url', () {
    final link =
        parseFluxerMarkdown('[click](https://example.com/a)').single as MdLink;
    expect(link.url, 'https://example.com/a');
    expect(link.escaped, isFalse);
    expect(((link.text!) as MdText).content, 'click');
  });

  test('alerts inside blockquote syntax', () {
    final alert = parseFluxerMarkdown('> [!NOTE]\n> body').single as MdAlert;
    expect(alert.alertType, MdAlertType.note);
  });

  test('emoji context standard record decodes', () {
    final nodes = parseFluxerMarkdown(
      'hi \u{1F600}',
      emojiContextTsv: 'S\t3\t4\t\u{1F600}\tgrinning face\t1f600',
    );
    final emoji = nodes.last as MdEmoji;
    expect((emoji.kind as MdStandardEmoji).name, 'grinning face');
  });
}
