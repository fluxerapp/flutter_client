import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_block_syntaxes.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_fenced_code_block_syntax.dart';
import 'package:markdown/markdown.dart' as md;

md.Document createFluxerBlockDocument({
  required FluxerMarkdownFeatures features,
  required List<md.InlineSyntax> inlineSyntaxes,
}) {
  return md.Document(
    encodeHtml: false,
    withDefaultBlockSyntaxes: false,
    withDefaultInlineSyntaxes: false,
    blockSyntaxes: fluxerBlockSyntaxes(
      allowHeadings: features.allowHeadings,
      allowBlockquotes: features.allowBlockquotes,
      allowLists: features.allowLists,
      allowCodeBlocks: features.allowCodeBlocks,
      allowTables: features.allowTables,
      fencedCodeBlockSyntax: features.allowCodeBlocks
          ? const FluxerFencedCodeBlockSyntax()
          : null,
    ),
    inlineSyntaxes: inlineSyntaxes,
  );
}
