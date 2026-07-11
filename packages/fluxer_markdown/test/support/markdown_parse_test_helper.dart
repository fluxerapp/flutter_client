import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_fenced_code_block_syntax.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
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

  static md.Document inlineDocument(FluxerMarkdownFeatures features) {
    return md.Document(
      encodeHtml: false,
      withDefaultBlockSyntaxes: false,
      blockSyntaxes: const [],
      inlineSyntaxes: _inlineSyntaxes(features),
    );
  }

  static md.Document blockDocument(FluxerMarkdownFeatures features) {
    return md.Document(
      encodeHtml: false,
      blockSyntaxes: [
        if (features.allowCodeBlocks) const FluxerFencedCodeBlockSyntax(),
        if (features.allowTables) const md.TableSyntax(),
      ],
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
    return [
      FluxerAppLinkSyntax(),
      FluxerBracketedAppLinkSyntax(),
      FluxerUnderlineSyntax(),
      md.StrikethroughSyntax(),
      if (features.allowUserMentions) FluxerUserMentionSyntax(),
      if (features.allowChannelMentions) FluxerChannelMentionSyntax(),
      if (features.allowRoleMentions) FluxerRoleMentionSyntax(),
      if (features.allowEveryoneMentions) FluxerEveryoneMentionSyntax(),
      if (features.allowCommandMentions) FluxerCommandMentionSyntax(),
      if (features.allowGuildNavigations) FluxerGuildNavigationSyntax(),
      FluxerTimestampSyntax(),
      if (features.allowSpoilers) FluxerSpoilerSyntax(),
      FluxerUnicodeEmojiToneSyntax(_noopEmoji),
      FluxerUnicodeEmojiSyntax(_noopEmoji),
      FluxerCustomEmojiSyntax(),
      FluxerLocalhostAutolinkSyntax(),
      md.AutolinkExtensionSyntax(),
    ];
  }
}

String? _noopEmoji(String name) => null;
