import 'package:flutter/material.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';
import 'package:fluxer_markdown/src/parsing/message_line_parser.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_fenced_code_block_syntax.dart';
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
    this.parseCacheKey,
    this.maxLines,
    this.overflow,
    this.trailingInlineWidget,
    super.key,
  });

  final String data;
  final FluxerMarkdownConfig config;
  final TextStyle? baseStyle;
  final bool selectable;
  final FluxerMarkdownContext context;
  final String? parseCacheKey;
  final int? maxLines;
  final TextOverflow? overflow;
  final Widget? trailingInlineWidget;

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
        trailingInlineWidget: trailingInlineWidget,
      );
    }

    final segmentWidgets = <Widget>[];
    for (var i = 0; i < segments.length; i++) {
      final segment = segments[i];
      final bool isLastSegment = i == segments.length - 1;
      final Widget? segmentTrailing =
          isLastSegment && segment is FluxerTextSegment
          ? trailingInlineWidget
          : null;
      segmentWidgets.add(switch (segment) {
        FluxerTextSegment(:final text) => _buildAstMarkdown(
          context: context,
          text: text,
          style: style,
          isDark: isDark,
          features: features,
          trailingInlineWidget: segmentTrailing,
        ),
        FluxerSubtextSegment(:final text) => _buildAstMarkdown(
          context: context,
          text: text,
          style: style.copyWith(
            fontSize: (style.fontSize ?? 16) * 0.8125,
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.375,
          ),
          isDark: isDark,
          features: features,
          allowJumboEmoji: false,
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
        FluxerBlockSpoilerSegment(:final text) => buildFluxerBlockSpoiler(
          context: context,
          text: text,
          baseStyle: style,
          config: config,
          features: features,
          inlineDocument: _createInlineDocument(features),
          selectable: selectable,
          isDark: isDark,
          parseCacheKey: parseCacheKey,
        ),
      });
    }

    if (trailingInlineWidget != null && segments.last is! FluxerTextSegment) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...segmentWidgets, trailingInlineWidget!],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: segmentWidgets,
    );
  }

  Widget _buildAstMarkdown({
    required BuildContext context,
    required String text,
    required TextStyle style,
    required bool isDark,
    required FluxerMarkdownFeatures features,
    Widget? trailingInlineWidget,
    bool allowJumboEmoji = true,
  }) {
    if (usesMessageLineParsing(this.context)) {
      return _buildMessageLineMarkdown(
        context: context,
        text: text,
        style: style,
        isDark: isDark,
        features: features,
        trailingInlineWidget: trailingInlineWidget,
        allowJumboEmoji: allowJumboEmoji,
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
    Widget? trailingInlineWidget,
    bool allowJumboEmoji = true,
  }) {
    final contentSegments = parseMessageContentStructure(text, features);
    if (contentSegments.isEmpty) {
      if (trailingInlineWidget != null) {
        return trailingInlineWidget;
      }
      return const SizedBox.shrink();
    }
    final int lastSegmentIndex = contentSegments.length - 1;
    final bool lastSegmentIsTextFlow =
        contentSegments[lastSegmentIndex] is MessageTextFlowSegment;
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
        parseCacheKey: parseCacheKey,
        maxLines: maxLines,
        overflow: overflow,
        trailingInlineWidget: trailingInlineWidget,
        allowJumboEmoji: allowJumboEmoji,
      );
    }
    final children = <Widget>[];
    for (var i = 0; i < contentSegments.length; i++) {
      final MessageContentSegment segment = contentSegments[i];
      final Widget? segmentTrailing =
          i == lastSegmentIndex && lastSegmentIsTextFlow
          ? trailingInlineWidget
          : null;
      children.add(switch (segment) {
        MessageTextFlowSegment(:final text) => buildFluxerMarkdownTextFlow(
          context: context,
          text: text,
          baseStyle: style,
          config: config,
          features: features,
          inlineDocument: _createInlineDocument(features),
          selectable: selectable,
          isDark: isDark,
          parseCacheKey: parseCacheKey,
          maxLines: maxLines,
          overflow: overflow,
          trailingInlineWidget: segmentTrailing,
          allowJumboEmoji: allowJumboEmoji,
        ),
        MessageBlockMarkdownSegment(:final text) => _buildBlockMarkdown(
          context: context,
          text: text,
          style: style,
          isDark: isDark,
          features: features,
        ),
        MessageBlockSpoilerSegment(:final text) => buildFluxerBlockSpoiler(
          context: context,
          text: text,
          baseStyle: style,
          config: config,
          features: features,
          inlineDocument: _createInlineDocument(features),
          selectable: selectable,
          isDark: isDark,
          parseCacheKey: parseCacheKey,
        ),
      });
    }
    final Widget body = children.length == 1
        ? children.first
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          );
    if (trailingInlineWidget != null && !lastSegmentIsTextFlow) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [body, trailingInlineWidget],
      );
    }
    return body;
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
      markdownParseCacheKey(normalizedText, parseCacheKey),
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
        if (features.allowCodeBlocks) const FluxerFencedCodeBlockSyntax(),
        if (features.allowTables) const md.TableSyntax(),
      ],
      inlineSyntaxes: _inlineSyntaxes(features),
    );
  }

  List<md.InlineSyntax> _inlineSyntaxes(FluxerMarkdownFeatures features) {
    return [
      if (config.linkWidgetBuilder != null &&
          config.internalLinkPattern != null) ...[
        FluxerJumpLinkSyntax(config.internalLinkPattern!),
        FluxerBracketedJumpLinkSyntax(config.internalLinkPattern!),
      ],
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
      FluxerUnicodeEmojiToneSyntax(config.resolveEmojiShortcode),
      FluxerUnicodeEmojiSyntax(config.resolveEmojiShortcode),
      FluxerCustomEmojiSyntax(),
      if (config.unicodeEmojiPattern != null)
        FluxerRawUnicodeEmojiSyntax(config.unicodeEmojiPattern!),
      md.AutolinkExtensionSyntax(),
    ];
  }
}
