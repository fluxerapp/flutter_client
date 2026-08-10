import 'package:markdown/markdown.dart' as md;

class FluxerHeaderSyntax extends md.BlockSyntax {
  const FluxerHeaderSyntax();

  static final RegExp _pattern = RegExp(r'^ {0,3}(#{1,4}) +(.*)$');

  @override
  RegExp get pattern => _pattern;

  @override
  md.Node? parse(md.BlockParser parser) {
    final match = pattern.firstMatch(parser.current.content);
    if (match == null) {
      return null;
    }
    final String hashes = match.group(1)!;
    final String content = match.group(2)!.trimRight();
    if (!_hasVisibleContent(content)) {
      return null;
    }
    parser.advance();
    final List<md.Node> children = parser.document.parseInline(content);
    return md.Element('h${hashes.length}', children);
  }

  bool _hasVisibleContent(String value) {
    return value.trim().isNotEmpty;
  }
}

List<md.BlockSyntax> fluxerBlockSyntaxes({
  required bool allowHeadings,
  required bool allowBlockquotes,
  required bool allowLists,
  required bool allowCodeBlocks,
  required bool allowTables,
  required md.BlockSyntax? fencedCodeBlockSyntax,
}) {
  return <md.BlockSyntax>[
    const md.EmptyBlockSyntax(),
    if (allowHeadings) const FluxerHeaderSyntax(),
    if (allowBlockquotes) const md.BlockquoteSyntax(),
    if (allowLists) ...<md.BlockSyntax>[
      const md.UnorderedListSyntax(),
      const md.OrderedListSyntax(),
    ],
    if (allowCodeBlocks && fencedCodeBlockSyntax != null) fencedCodeBlockSyntax,
    if (allowTables) const md.TableSyntax(),
    const md.ParagraphSyntax(),
  ];
}
