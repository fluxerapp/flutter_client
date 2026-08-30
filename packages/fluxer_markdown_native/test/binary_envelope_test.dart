import 'dart:typed_data';

import 'package:fluxer_markdown_native/fluxer_markdown_native.dart';
import 'package:fluxer_markdown_native/src/decode_binary.dart';
import 'package:test/test.dart';

void main() {
  test('decodes every inline formatting node with literal content', () {
    final nodes = parseFluxerMarkdownBinary('**b** *e* __u__ ~~s~~ `c`');
    expect(nodes, hasLength(9));
    expect(((nodes[0] as MdStrong).children.single as MdText).content, 'b');
    expect(((nodes[2] as MdEmphasis).children.single as MdText).content, 'e');
    expect(((nodes[4] as MdUnderline).children.single as MdText).content, 'u');
    expect(
      ((nodes[6] as MdStrikethrough).children.single as MdText).content,
      's',
    );
    expect((nodes[8] as MdInlineCode).content, 'c');
  });

  test('decodes block nodes with literal fields', () {
    final heading = parseFluxerMarkdownBinary('## two').single as MdHeading;
    expect(heading.level, 2);
    expect((heading.children.single as MdText).content, 'two');

    final list = parseFluxerMarkdownBinary('7. a\n8. b').single as MdList;
    expect(list.ordered, isTrue);
    expect(list.items.first.ordinal, 7);
    expect(list.items.last.ordinal, 8);

    final block =
        parseFluxerMarkdownBinary('```rust\nfn main() {}\n```').single
            as MdCodeBlock;
    expect(block.language, 'rust');
    expect(block.content, 'fn main() {}\n');

    final alert =
        parseFluxerMarkdownBinary('> [!CAUTION]\n> hot').single as MdAlert;
    expect(alert.alertType, MdAlertType.caution);
  });

  test('decodes link, mention, timestamp, spoiler with literal fields', () {
    final link =
        parseFluxerMarkdownBinary('[go](https://example.com/x)').single
            as MdLink;
    expect(link.url, 'https://example.com/x');
    expect(link.rawUrl, 'https://example.com/x');
    expect(link.escaped, isFalse);
    expect((link.text! as MdText).content, 'go');

    final role = parseFluxerMarkdownBinary('<@&42>').single as MdMention;
    expect((role.kind as MdRoleMention).id, '42');

    final timestamp =
        parseFluxerMarkdownBinary('<t:1234567890:F>').single as MdTimestamp;
    expect(timestamp.timestamp, 1234567890);
    expect(timestamp.style, MdTimestampStyle.longDateTime);

    final spoiler = parseFluxerMarkdownBinary('||hidden||').single as MdSpoiler;
    expect(spoiler.isBlock, isFalse);
    expect((spoiler.children.single as MdText).content, 'hidden');
  });

  test('decodes custom emoji fields', () {
    final emoji =
        parseFluxerMarkdownBinary('<a:party_blob:99>').single as MdEmoji;
    final custom = emoji.kind as MdCustomEmoji;
    expect(custom.name, 'party_blob');
    expect(custom.id, '99');
    expect(custom.animated, isTrue);
  });

  test('binary and JSON paths agree across a mixed corpus', () {
    // Catches encoder/decoder drift; the JSON path is literal-pinned in
    // parse_smoke_test.dart.
    const corpus = [
      '# h\n**b** *e* `c` ||s||',
      '> [!NOTE]\n> body\n\n1. a\n2. b\n\n| x | y |\n|---|---|\n| 1 | 2 |',
      '>>> multi\nline quote with <@1> <#2> <@&3> </cmd:4>',
      '```\nraw\n```\ntrailing [t](https://e.com/a) https://e.com/b',
      '-# subtext\n<t:1:R> <id:guide> @everyone',
      '',
    ];
    for (final input in corpus) {
      expect(
        parseFluxerMarkdownBinary(input).map(describeAst).join('\n'),
        parseFluxerMarkdown(input).map(describeAst).join('\n'),
        reason: 'diverged for input: $input',
      );
    }
  });

  test('rejects unsupported version byte', () {
    expect(
      () => decodeBinaryAst(Uint8List.fromList([9, 0])),
      throwsFormatException,
    );
  });

  test('rejects trailing bytes', () {
    // version 1, zero nodes, one stray byte.
    expect(
      () => decodeBinaryAst(Uint8List.fromList([1, 0, 0xff])),
      throwsFormatException,
    );
  });

  test('rejects unknown node tag', () {
    // version 1, one node, tag 200.
    expect(
      () => decodeBinaryAst(Uint8List.fromList([1, 1, 200])),
      throwsFormatException,
    );
  });
}

String describeAst(MdNode node) {
  String children(List<MdNode> nodes) =>
      '[${nodes.map(describeAst).join(',')}]';
  return switch (node) {
    MdText(:final content) => 'text($content)',
    MdBlockquote(children: final c, :final blankLines) =>
      'quote($blankLines,${children(c)})',
    MdStrong(children: final c) => 'strong(${children(c)})',
    MdEmphasis(children: final c) => 'em(${children(c)})',
    MdUnderline(children: final c) => 'under(${children(c)})',
    MdStrikethrough(children: final c) => 'strike(${children(c)})',
    MdSpoiler(children: final c, :final isBlock) =>
      'spoiler($isBlock,${children(c)})',
    MdHeading(:final level, children: final c) => 'h$level(${children(c)})',
    MdSubtext(children: final c) => 'subtext(${children(c)})',
    MdList(:final ordered, :final items) => () {
      final parts = items
          .map((i) => '${i.ordinal}:${children(i.children)}')
          .join(',');
      return 'list($ordered,$parts)';
    }(),
    MdCodeBlock(:final language, :final content) => 'code($language,$content)',
    MdInlineCode(:final content) => 'inline($content)',
    MdSequence(children: final c) => 'seq(${children(c)})',
    MdLink(:final text, :final url, :final escaped, :final rawUrl) =>
      'link($url,$rawUrl,$escaped,${text == null ? '' : describeAst(text)})',
    MdMention(:final kind) => 'mention(${_describeMention(kind)})',
    MdTimestamp(:final timestamp, :final style) => 'ts($timestamp,$style)',
    MdEmoji(:final kind) => 'emoji(${_describeEmoji(kind)})',
    MdTable(:final header, :final alignments, :final rows) =>
      'table(${describeAst(header)},$alignments,${children(rows)})',
    MdTableRow(:final cells) => 'row(${children(cells)})',
    MdTableCell(children: final c) => 'cell(${children(c)})',
    MdAlert(:final alertType, children: final c) =>
      'alert($alertType,${children(c)})',
  };
}

String _describeMention(MdMentionKind kind) => switch (kind) {
  MdUserMention(:final id) => 'user:$id',
  MdChannelMention(:final id) => 'channel:$id',
  MdRoleMention(:final id) => 'role:$id',
  MdCommandMention(
    :final name,
    :final subcommandGroup,
    :final subcommand,
    :final id,
  ) =>
    'cmd:$name/$subcommandGroup/$subcommand/$id',
  MdGuildNavigationMention(:final navigationType, :final id) =>
    'nav:$navigationType/$id',
  MdEveryoneMention() => 'everyone',
  MdHereMention() => 'here',
};

String _describeEmoji(MdEmojiKind kind) => switch (kind) {
  MdStandardEmoji(:final raw, :final codepoints, :final name) =>
    'std:$raw/$codepoints/$name',
  MdCustomEmoji(:final name, :final id, :final animated) =>
    'custom:$name/$id/$animated',
};
