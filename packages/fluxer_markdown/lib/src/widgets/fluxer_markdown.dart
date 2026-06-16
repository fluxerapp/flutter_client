import 'package:flutter/material.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';
import 'package:fluxer_markdown/src/parsing/message_line_parser.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
import 'package:fluxer_markdown/src/utils/highlight_languages.dart';
import 'package:markdown/markdown.dart' as md;

final MarkdownParseCache<(String, FluxerMarkdownFeatures), List<md.Node>>
_blockNodeCache =
    MarkdownParseCache<(String, FluxerMarkdownFeatures), List<md.Node>>();

class FluxerMarkdown extends StatelessWidget {
  const FluxerMarkdown({
    required this.data,
    required this.config,
    this.baseStyle,
    this.selectable = false,
    this.context = FluxerMarkdownContext.standardWithJumbo,
    this.maxLines,
    this.overflow,
    super.key,
  });

  final String data;
  final FluxerMarkdownConfig config;
  final TextStyle? baseStyle;
  final bool selectable;
  final FluxerMarkdownContext context;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    ensureFluxerMarkdownLanguagesRegistered();

    final theme = Theme.of(context);
    final style = baseStyle ?? DefaultTextStyle.of(context).style;
    final isDark = theme.brightness == Brightness.dark;
    final features = FluxerMarkdownFeatures.forContext(this.context);
    final processedText = preprocessFluxerMarkdown(data, features);
    final segments = parseFluxerMarkdownSegments(processedText, features);

    if (segments.length == 1 && segments.first is FluxerTextSegment) {
      return _buildAstMarkdown(
        context: context,
        text: (segments.first as FluxerTextSegment).text,
        style: style,
        isDark: isDark,
        features: features,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: segments.map((segment) {
        return switch (segment) {
          FluxerTextSegment(:final text) => _buildAstMarkdown(
            context: context,
            text: text,
            style: style,
            isDark: isDark,
            features: features,
          ),
          FluxerSubtextSegment(:final text) => _buildAstMarkdown(
            context: context,
            text: text,
            style: style.copyWith(
              fontSize: (style.fontSize ?? 16) * 0.75,
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.35,
            ),
            isDark: isDark,
            features: features,
          ),
          FluxerAlertSegment(:final type, :final body) =>
            (config.alertBuilder ?? defaultFluxerAlertBuilder)(
              context,
              type,
              _buildAstMarkdown(
                context: context,
                text: body,
                style: style,
                isDark: isDark,
                features: features,
              ),
              style,
            ),
        };
      }).toList(),
    );
  }

  Widget _buildAstMarkdown({
    required BuildContext context,
    required String text,
    required TextStyle style,
    required bool isDark,
    required FluxerMarkdownFeatures features,
  }) {
    if (usesMessageLineParsing(this.context)) {
      return _buildMessageLineMarkdown(
        context: context,
        text: text,
        style: style,
        isDark: isDark,
        features: features,
      );
    }
    return _buildBlockMarkdown(
      context: context,
      text: text,
      style: style,
      isDark: isDark,
      features: features,
    );
  }

  Widget _buildMessageLineMarkdown({
    required BuildContext context,
    required String text,
    required TextStyle style,
    required bool isDark,
    required FluxerMarkdownFeatures features,
  }) {
    final contentSegments = parseMessageContentStructure(text, features);
    if (contentSegments.isEmpty) {
      return const SizedBox.shrink();
    }
    if (contentSegments.length == 1 &&
        contentSegments.first is MessageTextFlowSegment) {
      return buildFluxerMarkdownTextFlow(
        context: context,
        text: (contentSegments.first as MessageTextFlowSegment).text,
        baseStyle: style,
        config: config,
        features: features,
        inlineDocument: _createInlineDocument(features),
        selectable: selectable,
        isDark: isDark,
        maxLines: maxLines,
        overflow: overflow,
      );
    }
    final children = contentSegments.map((segment) {
      return switch (segment) {
        MessageTextFlowSegment(:final text) => buildFluxerMarkdownTextFlow(
          context: context,
          text: text,
          baseStyle: style,
          config: config,
          features: features,
          inlineDocument: _createInlineDocument(features),
          selectable: selectable,
          isDark: isDark,
          maxLines: maxLines,
          overflow: overflow,
        ),
        MessageBlockMarkdownSegment(:final text) => _buildBlockMarkdown(
          context: context,
          text: text,
          style: style,
          isDark: isDark,
          features: features,
        ),
      };
    }).toList();
    if (children.length == 1) {
      return children.first;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget _buildBlockMarkdown({
    required BuildContext context,
    required String text,
    required TextStyle style,
    required bool isDark,
    required FluxerMarkdownFeatures features,
  }) {
    final document = _createBlockDocument(features);
    final normalizedText = normalizeBlockquoteBarMarkdown(text);
    final nodes = _blockNodeCache.resolve((
      normalizedText,
      features,
    ), () => document.parse(normalizedText));
    return buildFluxerMarkdownAst(
      context: context,
      nodes: nodes,
      baseStyle: style,
      config: config,
      features: features,
      selectable: selectable,
      isDark: isDark,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  md.Document _createInlineDocument(FluxerMarkdownFeatures features) {
    return md.Document(
      encodeHtml: false,
      withDefaultBlockSyntaxes: false,
      blockSyntaxes: const [],
      inlineSyntaxes: _inlineSyntaxes(features),
    );
  }

  md.Document _createBlockDocument(FluxerMarkdownFeatures features) {
    return md.Document(
      encodeHtml: false,
      blockSyntaxes: [
        if (features.allowCodeBlocks) const md.FencedCodeBlockSyntax(),
        if (features.allowTables) const md.TableSyntax(),
      ],
      inlineSyntaxes: _inlineSyntaxes(features),
    );
  }

  List<md.InlineSyntax> _inlineSyntaxes(FluxerMarkdownFeatures features) {
    return [
      if (config.linkWidgetBuilder != null &&
          config.internalLinkPattern != null)
        FluxerJumpLinkSyntax(config.internalLinkPattern!),
      FluxerUnderlineSyntax(),
      md.StrikethroughSyntax(),
      if (features.allowUserMentions) FluxerUserMentionSyntax(),
      if (features.allowChannelMentions) FluxerChannelMentionSyntax(),
      if (features.allowRoleMentions) FluxerRoleMentionSyntax(),
      if (features.allowEveryoneMentions) FluxerEveryoneMentionSyntax(),
      FluxerTimestampSyntax(),
      FluxerSpoilerSyntax(),
      FluxerUnicodeEmojiToneSyntax(config.resolveEmojiShortcode),
      FluxerUnicodeEmojiSyntax(config.resolveEmojiShortcode),
      FluxerCustomEmojiSyntax(),
      if (config.unicodeEmojiPattern != null)
        FluxerRawUnicodeEmojiSyntax(config.unicodeEmojiPattern!),
      if (features.allowAutolinks) md.AutolinkExtensionSyntax(),
    ];
  }
}
