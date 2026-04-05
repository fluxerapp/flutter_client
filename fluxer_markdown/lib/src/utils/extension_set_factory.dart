import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:markdown/markdown.dart' as md;

md.ExtensionSet buildFluxerMarkdownExtensionSet(
  FluxerMarkdownFeatures features,
) {
  final blockSyntaxes = <md.BlockSyntax>[
    if (features.allowCodeBlocks) const md.FencedCodeBlockSyntax(),
    if (features.allowTables) const md.TableSyntax(),
  ];

  final inlineSyntaxes = <md.InlineSyntax>[
    md.InlineHtmlSyntax(),
    md.StrikethroughSyntax(),
    if (features.allowAutolinks) md.AutolinkExtensionSyntax(),
  ];

  return md.ExtensionSet(
    List<md.BlockSyntax>.unmodifiable(blockSyntaxes),
    List<md.InlineSyntax>.unmodifiable(inlineSyntaxes),
  );
}
