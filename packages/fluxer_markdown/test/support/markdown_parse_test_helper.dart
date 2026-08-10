import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/fluxer_block_document.dart';
import 'package:fluxer_markdown/src/parsing/fluxer_inline_syntaxes.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';
import 'package:markdown/markdown.dart' as md;

class MarkdownParseTestHelper {
  MarkdownParseTestHelper._();

  static FluxerMarkdownFeatures featuresFor(FluxerMarkdownContext context) {
    return FluxerMarkdownFeatures.forContext(context);
  }

  static String preprocess(String input, FluxerMarkdownFeatures features) {
    return preprocessFluxerMarkdown(input, features);
  }

  static List<FluxerMarkdownSegment> parseSegments(
    String input,
    FluxerMarkdownFeatures features,
  ) {
    final String processed = preprocess(input, features);
    return parseFluxerMarkdownSegments(processed, features);
  }

  static FluxerMarkdownFeatures featuresWith({
    bool allowMaskedLinks = true,
    bool allowAutolinks = true,
  }) {
    final FluxerMarkdownFeatures base = featuresFor(
      FluxerMarkdownContext.standardWithJumbo,
    );
    return FluxerMarkdownFeatures(
      allowAlerts: base.allowAlerts,
      allowAutolinks: allowAutolinks,
      allowBlockquotes: base.allowBlockquotes,
      allowChannelMentions: base.allowChannelMentions,
      allowCodeBlocks: base.allowCodeBlocks,
      allowCommandMentions: base.allowCommandMentions,
      allowEveryoneMentions: base.allowEveryoneMentions,
      allowGuildNavigations: base.allowGuildNavigations,
      allowHeadings: base.allowHeadings,
      allowJumboEmoji: base.allowJumboEmoji,
      allowLists: base.allowLists,
      allowMaskedLinks: allowMaskedLinks,
      allowMultilineBlockquotes: base.allowMultilineBlockquotes,
      allowPlainInlineCode: base.allowPlainInlineCode,
      allowRoleMentions: base.allowRoleMentions,
      allowSpoilers: base.allowSpoilers,
      allowSubtext: base.allowSubtext,
      allowTables: base.allowTables,
      allowUserMentions: base.allowUserMentions,
    );
  }

  static md.Document inlineDocument(FluxerMarkdownFeatures features) {
    return md.Document(
      encodeHtml: false,
      withDefaultBlockSyntaxes: false,
      withDefaultInlineSyntaxes: false,
      blockSyntaxes: const [],
      inlineSyntaxes: _inlineSyntaxes(features),
    );
  }

  static md.Document blockDocument(FluxerMarkdownFeatures features) {
    return createFluxerBlockDocument(
      features: features,
      inlineSyntaxes: _inlineSyntaxes(features),
    );
  }

  static List<md.Node> parseInline(
    String input,
    FluxerMarkdownFeatures features,
  ) {
    final String processed = preprocess(input, features);
    return inlineDocument(features).parseInline(processed);
  }

  static List<md.Node> parseBlock(
    String input,
    FluxerMarkdownFeatures features,
  ) {
    final String processed = preprocess(input, features);
    return blockDocument(features).parse(processed);
  }

  static List<String> describeNodes(List<md.Node> nodes) {
    return nodes.map(describeNode).toList();
  }

  static String describeNode(md.Node node) {
    if (node is md.Text) {
      return 'Text:${node.text}';
    }
    if (node is md.Element) {
      final String className = node.attributes['class'] ?? '';
      final String suffix = className.isEmpty ? '' : ':$className';
      final List<String> childDescriptions =
          (node.children ?? const <md.Node>[]).map(describeNode).toList();
      final String childText = childDescriptions.isEmpty
          ? node.textContent
          : childDescriptions.join('|');
      return '${node.tag}$suffix:$childText';
    }
    return node.runtimeType.toString();
  }

  static List<String> describeSegments(List<FluxerMarkdownSegment> segments) {
    return segments.map((FluxerMarkdownSegment segment) {
      return switch (segment) {
        FluxerTextSegment(:final text) => 'TextSegment:$text',
        FluxerAlertSegment(:final type, :final body) => 'Alert:$type:$body',
        FluxerSubtextSegment(:final text) => 'Subtext:$text',
        FluxerBlockSpoilerSegment(:final text) => 'BlockSpoiler:$text',
      };
    }).toList();
  }

  static bool containsTag(List<md.Node> nodes, String tag) {
    for (final md.Node node in nodes) {
      if (node is md.Element) {
        if (node.tag == tag) {
          return true;
        }
        if (containsTag(node.children ?? const <md.Node>[], tag)) {
          return true;
        }
      }
    }
    return false;
  }

  static String collectText(List<md.Node> nodes) {
    final StringBuffer buffer = StringBuffer();
    for (final md.Node node in nodes) {
      if (node is md.Text) {
        buffer.write(node.text);
      } else if (node is md.Element) {
        buffer.write(collectText(node.children ?? const <md.Node>[]));
      }
    }
    return buffer.toString();
  }

  static List<md.InlineSyntax> _inlineSyntaxes(
    FluxerMarkdownFeatures features,
  ) {
    return fluxerInlineSyntaxes(
      features: features,
      resolveEmojiShortcode: _noopEmoji,
    );
  }
}

String? _noopEmoji(String name) => null;
