import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/inline_parse_chunks.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
import 'package:fluxer_markdown/src/utils/code_block_highlight_theme.dart';
import 'package:fluxer_markdown/src/utils/highlight_languages.dart';
import 'package:fluxer_markdown/src/utils/jumbo_emoji.dart';
import 'package:intl/intl.dart';
import 'package:latext/latext.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

double _blockSpacingForStyle(TextStyle style) {
  final double fontSize = style.fontSize ?? 16;
  return fontSize * 0.5;
}

final RegExp _spoilerSyncUrlPattern = RegExp(
  r'''https?:\/\/[^\s<>"']+''',
  caseSensitive: false,
);

final RegExp _blankMarkdownLinkLabelPattern = RegExp(r'^\s*$');

Widget defaultFluxerAlertBuilder(
  BuildContext context,
  FluxerAlertType type,
  Widget body,
  TextStyle baseStyle,
) {
  final theme = Theme.of(context);
  final color = switch (type) {
    FluxerAlertType.note => theme.colorScheme.primary,
    FluxerAlertType.tip => Colors.green,
    FluxerAlertType.important => Colors.blue,
    FluxerAlertType.warning => Colors.orange,
    FluxerAlertType.caution => theme.colorScheme.error,
  };

  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 4),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(8),
      border: Border(left: BorderSide(color: color, width: 4)),
    ),
    child: body,
  );
}

Widget buildFluxerMarkdownAst({
  required BuildContext context,
  required List<md.Node> nodes,
  required TextStyle baseStyle,
  required FluxerMarkdownConfig config,
  required FluxerMarkdownFeatures features,
  required bool selectable,
  required bool isDark,
  int? maxLines,
  TextOverflow? overflow,
}) {
  final body = _MarkdownBlockRenderer(
    context: context,
    baseStyle: baseStyle,
    config: config,
    features: features,
    isDark: isDark,
    maxLines: maxLines,
    overflow: overflow,
  ).build(nodes);

  if (!selectable) {
    return body;
  }

  return SelectionArea(child: body);
}

final MarkdownParseCache<(String, FluxerMarkdownFeatures), List<md.Node>>
_inlineNodeCache =
    MarkdownParseCache<(String, FluxerMarkdownFeatures), List<md.Node>>();

void appendTrailingInlineWidget(
  List<InlineSpan> spans,
  TextStyle baseStyle,
  Widget trailingInlineWidget,
) {
  spans
    ..add(TextSpan(text: ' ', style: baseStyle))
    ..add(
      WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: trailingInlineWidget,
      ),
    );
}

Widget buildFluxerMarkdownTextFlow({
  required BuildContext context,
  required String text,
  required TextStyle baseStyle,
  required FluxerMarkdownConfig config,
  required FluxerMarkdownFeatures features,
  required md.Document inlineDocument,
  required bool selectable,
  required bool isDark,
  String? parseCacheKey,
  int? maxLines,
  TextOverflow? overflow,
  Widget? trailingInlineWidget,
  bool allowJumboEmoji = true,
}) {
  if (text.isEmpty) {
    return const SizedBox.shrink();
  }
  final chunks = splitIntoInlineParseChunks(text);
  final chunkNodesList = <List<md.Node>>[];
  for (final chunk in chunks) {
    chunkNodesList.add(
      _inlineNodeCache.resolve((
        markdownParseCacheKey(chunk, parseCacheKey),
        features,
      ), () => inlineDocument.parseInline(chunk)),
    );
  }
  final useJumbo =
      allowJumboEmoji &&
      features.allowJumboEmoji &&
      _textFlowAllowsJumboEmoji(chunkNodesList);
  final spans = <InlineSpan>[];
  for (var i = 0; i < chunks.length; i++) {
    if (i > 0) {
      spans.add(TextSpan(text: '\n', style: baseStyle));
    }
    final chunkNodes = chunkNodesList[i];
    if (chunkNodes.isEmpty) {
      continue;
    }
    final chunkSpans = _MarkdownInlineRenderer(
      context: context,
      baseStyle: baseStyle,
      config: config,
      features: features,
      isDark: isDark,
      jumbo: useJumbo,
    ).build(chunkNodes);
    spans.addAll(chunkSpans);
  }
  if (spans.isEmpty) {
    return const SizedBox.shrink();
  }
  if (trailingInlineWidget != null) {
    appendTrailingInlineWidget(spans, baseStyle, trailingInlineWidget);
  }
  final RichText richText = RichText(
    text: TextSpan(style: baseStyle, children: spans),
    textScaler: MediaQuery.textScalerOf(context),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.clip,
    textWidthBasis: trailingInlineWidget != null || maxLines != null
        ? TextWidthBasis.parent
        : TextWidthBasis.longestLine,
  );
  final Widget body = trailingInlineWidget != null
      ? SizedBox(width: double.infinity, child: richText)
      : richText;
  if (!selectable) {
    return body;
  }
  return SelectionArea(child: body);
}

class _MarkdownBlockRenderer {
  const _MarkdownBlockRenderer({
    required this.context,
    required this.baseStyle,
    required this.config,
    required this.features,
    required this.isDark,
    this.maxLines,
    this.overflow,
  });

  final BuildContext context;
  final TextStyle baseStyle;
  final FluxerMarkdownConfig config;
  final FluxerMarkdownFeatures features;
  final bool isDark;
  final int? maxLines;
  final TextOverflow? overflow;

  Widget build(List<md.Node> nodes) {
    final children = <Widget>[];
    for (final node in nodes) {
      final widget = buildBlock(node);
      if (widget != null) {
        children.add(widget);
      }
    }

    if (children.isEmpty) {
      return const SizedBox.shrink();
    }
    if (children.length == 1) {
      return children.first;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: _blockSpacingForStyle(baseStyle),
      children: children,
    );
  }

  Widget? buildBlock(md.Node node) {
    if (node is md.Text) {
      if (node.text.trim().isEmpty) {
        return null;
      }
      return _buildParagraph([node]);
    }

    if (node is! md.Element) {
      return null;
    }

    switch (node.tag) {
      case 'p':
        return _buildParagraph(node.children ?? const []);
      case 'h1':
        return _buildParagraph(
          node.children ?? const [],
          style: baseStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w700),
        );
      case 'h2':
        return _buildParagraph(
          node.children ?? const [],
          style: baseStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
        );
      case 'h3':
        return _buildParagraph(
          node.children ?? const [],
          style: baseStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
        );
      case 'h4':
        return _buildParagraph(
          node.children ?? const [],
          style: baseStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        );
      case 'blockquote':
        return _buildBlockquote(node);
      case 'pre':
        return _buildCodeBlock(node);
      case 'ul':
        return _buildList(node, ordered: false);
      case 'ol':
        return _buildList(node, ordered: true);
      case 'table':
        return _buildTable(node);
      case 'hr':
        return Divider(
          color: Theme.of(context).colorScheme.outlineVariant,
          height: 16,
        );
      default:
        if (_isInlineOnlyTag(node.tag)) {
          return _buildParagraph([node]);
        }
        return build(node.children ?? const []);
    }
  }

  Widget _buildParagraph(List<md.Node> nodes, {TextStyle? style}) {
    final effectiveStyle = style ?? baseStyle;
    final spans = _MarkdownInlineRenderer(
      context: context,
      baseStyle: effectiveStyle,
      config: config,
      features: features,
      isDark: isDark,
      jumbo:
          style == null && features.allowJumboEmoji && _allNodesAreEmoji(nodes),
    ).build(nodes);

    if (spans.isEmpty) {
      return RichText(
        text: TextSpan(text: '\n', style: effectiveStyle),
        textScaler: MediaQuery.textScalerOf(context),
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.clip,
        textWidthBasis: maxLines != null
            ? TextWidthBasis.parent
            : TextWidthBasis.longestLine,
      );
    }

    return RichText(
      text: TextSpan(style: effectiveStyle, children: spans),
      textScaler: MediaQuery.textScalerOf(context),
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      textWidthBasis: maxLines != null
          ? TextWidthBasis.parent
          : TextWidthBasis.longestLine,
    );
  }

  Widget _buildBlockquote(md.Element node) {
    final borderColor =
        config.blockquoteBorderColor ??
        Theme.of(context).colorScheme.outlineVariant;
    final textColor = config.blockquoteTextColor;
    final quoteStyle = textColor == null
        ? baseStyle
        : baseStyle.copyWith(color: textColor);
    final quoteBody = _MarkdownBlockRenderer(
      context: context,
      baseStyle: quoteStyle,
      config: config,
      features: features,
      isDark: isDark,
      maxLines: maxLines,
      overflow: overflow,
    ).build(node.children ?? const []);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Stack(
        children: [
          PositionedDirectional(
            start: 0,
            top: 0,
            bottom: 0,
            width: 4,
            child: Container(
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 4),
            child: quoteBody,
          ),
        ],
      ),
    );
  }

  Widget _buildCodeBlock(md.Element node) {
    final codeElement = node.children
        ?.whereType<md.Element>()
        .cast<md.Element?>()
        .firstWhere((child) => child?.tag == 'code', orElse: () => null);
    if (codeElement == null) {
      return const SizedBox.shrink();
    }

    return FluxerCodeBlockWidget(
      element: codeElement,
      isDark: isDark,
      baseStyle: baseStyle,
      onCopyCode: config.onCopyCode,
    );
  }

  Widget _buildList(md.Element node, {required bool ordered}) {
    final items = node.children?.whereType<md.Element>().toList() ?? const [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < items.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: i == items.length - 1 ? 0 : 4),
            child: _buildListItem(
              items[i],
              marker: ordered
                  ? '${i + (int.tryParse(node.attributes['start'] ?? '1') ?? 1)}.'
                  : '\u2022',
            ),
          ),
      ],
    );
  }

  Widget _buildListItem(md.Element item, {required String marker}) {
    final children = item.children ?? const <md.Node>[];
    final content = <Widget>[];
    final nestedBlocks = <Widget>[];
    final inlineBuffer = <md.Node>[];

    void flushInlineBuffer() {
      if (inlineBuffer.isEmpty) {
        return;
      }
      content.add(_buildParagraph(List<md.Node>.from(inlineBuffer)));
      inlineBuffer.clear();
    }

    for (final child in children) {
      if (child is md.Element &&
          (child.tag == 'ul' ||
              child.tag == 'ol' ||
              child.tag == 'blockquote')) {
        flushInlineBuffer();
        final nested = buildBlock(child);
        if (nested != null) {
          nestedBlocks.add(nested);
        }
        continue;
      }

      if (child is md.Element && child.tag == 'p') {
        flushInlineBuffer();
        content.add(_buildParagraph(child.children ?? const []));
        continue;
      }

      if (_isInlineListNode(child)) {
        inlineBuffer.add(child);
        continue;
      }

      flushInlineBuffer();
      final block = buildBlock(child);
      if (block != null) {
        content.add(block);
      }
    }

    flushInlineBuffer();

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (content.isNotEmpty) ...content,
        if (nestedBlocks.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: nestedBlocks,
            ),
          ),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 24, child: Text(marker, style: baseStyle)),
        Expanded(child: body),
      ],
    );
  }

  Widget _buildTable(md.Element table) {
    final rows = <TableRow>[];
    final sectionElements = table.children?.whereType<md.Element>() ?? const [];

    for (final section in sectionElements) {
      if (section.tag != 'thead' && section.tag != 'tbody') {
        continue;
      }

      final rowElements = section.children?.whereType<md.Element>() ?? const [];
      for (final row in rowElements) {
        if (row.tag != 'tr') {
          continue;
        }

        final cellElements =
            row.children?.whereType<md.Element>().toList() ?? const [];
        rows.add(
          TableRow(
            children: [
              for (final cell in cellElements)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  color: cell.tag == 'th'
                      ? Theme.of(context).colorScheme.surfaceContainerHighest
                            .withValues(alpha: 0.5)
                      : null,
                  child: _buildParagraph(
                    cell.children ?? const [],
                    style: cell.tag == 'th'
                        ? baseStyle.copyWith(fontWeight: FontWeight.w600)
                        : baseStyle,
                  ),
                ),
            ],
          ),
        );
      }
    }

    if (rows.isEmpty) {
      return const SizedBox.shrink();
    }

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(
        color: Theme.of(context).colorScheme.outlineVariant,
      ),
      children: rows,
    );
  }
}

class _MarkdownInlineRenderer {
  const _MarkdownInlineRenderer({
    required this.context,
    required this.baseStyle,
    required this.config,
    required this.features,
    required this.isDark,
    required this.jumbo,
  });

  final BuildContext context;
  final TextStyle baseStyle;
  final FluxerMarkdownConfig config;
  final FluxerMarkdownFeatures features;
  final bool isDark;
  final bool jumbo;

  List<InlineSpan> build(List<md.Node> nodes, {TextStyle? style}) {
    final effectiveStyle = style ?? baseStyle;
    final spans = <InlineSpan>[];

    for (final node in nodes) {
      final span = buildNode(node, style: effectiveStyle);
      if (span != null) {
        spans.add(span);
      }
    }

    return spans;
  }

  InlineSpan? buildNode(md.Node node, {TextStyle? style}) {
    final effectiveStyle = style ?? baseStyle;

    if (node is md.Text) {
      if (node.text.isEmpty) {
        return null;
      }
      return TextSpan(text: node.text, style: effectiveStyle);
    }

    if (node is! md.Element) {
      return null;
    }

    switch (node.tag) {
      case 'strong':
        final strongStyle = effectiveStyle.copyWith(
          fontWeight: FontWeight.w700,
        );
        return TextSpan(
          style: strongStyle,
          children: build(node.children ?? const [], style: strongStyle),
        );
      case 'em':
        final emphasisStyle = effectiveStyle.copyWith(
          fontStyle: FontStyle.italic,
        );
        return TextSpan(
          style: emphasisStyle,
          children: build(node.children ?? const [], style: emphasisStyle),
        );
      case 'del':
        final deletedStyle = effectiveStyle.copyWith(
          decoration: TextDecoration.lineThrough,
        );
        return TextSpan(
          style: deletedStyle,
          children: build(node.children ?? const [], style: deletedStyle),
        );
      case 'underline':
        final underlineStyle = effectiveStyle.copyWith(
          decoration: TextDecoration.underline,
        );
        return TextSpan(
          style: underlineStyle,
          children: build(node.children ?? const [], style: underlineStyle),
        );
      case 'code':
        if (features.allowPlainInlineCode) {
          final double fontSize = effectiveStyle.fontSize ?? 16;
          return TextSpan(
            text: node.textContent,
            style: effectiveStyle.copyWith(
              color: config.inlineCodeTextColor,
              backgroundColor: config.inlineCodeBackgroundColor,
              fontFamily: 'monospace',
              fontSize: fontSize * 0.85,
            ),
          );
        }
        return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: FluxerInlineCodeWidget(
            text: node.textContent,
            baseStyle: effectiveStyle,
            backgroundColor: config.inlineCodeBackgroundColor,
            textColor: config.inlineCodeTextColor,
          ),
        );
      case 'br':
        return const TextSpan(text: '\n');
      case 'a':
        return _buildLink(node, effectiveStyle);
      case FluxerJumpLinkSyntax.tag:
        return _buildJumpLink(node, effectiveStyle);
      case FluxerUserMentionSyntax.tag:
        return _buildMention(
          node,
          effectiveStyle,
          prefix: '@',
          builder: config.userMentionBuilder,
        );
      case FluxerChannelMentionSyntax.tag:
        return _buildMention(
          node,
          effectiveStyle,
          prefix: '#',
          builder: config.channelMentionBuilder,
        );
      case FluxerRoleMentionSyntax.tag:
        return _buildMention(
          node,
          effectiveStyle,
          prefix: '@',
          builder: config.roleMentionBuilder,
        );
      case FluxerEveryoneMentionSyntax.tag:
        return _buildEveryoneMention(node, effectiveStyle);
      case FluxerTimestampSyntax.tag:
        final timestampText = _formatTimestampText(node);
        if (timestampText == null) {
          return const TextSpan(text: '');
        }
        return TextSpan(
          text: timestampText,
          style: effectiveStyle.copyWith(
            background: Paint()
              ..color =
                  (effectiveStyle.color ??
                          Theme.of(context).colorScheme.onSurface)
                      .withValues(alpha: 0.08),
          ),
        );
      case FluxerSpoilerSyntax.tag:
        return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: _FluxerSpoilerSpan(
            initiallyRevealed: config.spoilersInitiallyRevealed,
            spoilerBackgroundColor: config.spoilerBackgroundColor,
            spoilerSyncController: config.spoilerSyncController,
            syncKeys: _collectSpoilerSyncKeys(
              node,
              config.spoilerSyncKeyNormalizer,
            ),
            child: RichText(
              text: TextSpan(
                style: effectiveStyle,
                children: build(
                  node.children ?? const [],
                  style: effectiveStyle,
                ),
              ),
              textScaler: MediaQuery.textScalerOf(context),
            ),
          ),
        );
      case FluxerUnicodeEmojiToneSyntax.tag:
      case FluxerCustomEmojiSyntax.tag:
        return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: FluxerEmojiWidget(
            element: node,
            baseStyle: effectiveStyle,
            unicodeEmojiUrlBuilder: config.unicodeEmojiUrlBuilder,
            customEmojiUrlBuilder: config.customEmojiUrlBuilder,
            jumbo: jumbo,
          ),
        );
      default:
        return TextSpan(
          style: effectiveStyle,
          children: build(node.children ?? const [], style: effectiveStyle),
        );
    }
  }

  InlineSpan _buildLink(md.Element element, TextStyle style) {
    final href = element.attributes['href'] ?? element.textContent;
    final text = element.textContent;
    if (_blankMarkdownLinkLabelPattern.hasMatch(text)) {
      return TextSpan(text: '[$text]($href)', style: style);
    }
    final linkColor = config.linkColor ?? Theme.of(context).colorScheme.primary;
    final linkStyle = style.copyWith(color: linkColor);
    final children = _attachLinkRecognizers(
      build(element.children ?? [md.Text(text)], style: linkStyle),
      href,
    );
    return TextSpan(style: linkStyle, children: children);
  }

  List<InlineSpan> _attachLinkRecognizers(List<InlineSpan> spans, String href) {
    return spans
        .map((InlineSpan span) => _attachLinkRecognizerToSpan(span, href))
        .toList();
  }

  InlineSpan _attachLinkRecognizerToSpan(InlineSpan span, String href) {
    if (span is! TextSpan) {
      return span;
    }
    final List<InlineSpan>? children = span.children;
    if (children == null || children.isEmpty) {
      return TextSpan(
        text: span.text,
        style: span.style,
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            unawaited(_handleLinkTap(href));
          },
      );
    }
    return TextSpan(
      style: span.style,
      children: _attachLinkRecognizers(children, href),
    );
  }

  InlineSpan _buildJumpLink(md.Element element, TextStyle style) {
    final href = element.attributes['href'] ?? element.textContent;
    final widget = config.linkWidgetBuilder?.call(context, href, style);
    if (widget != null) {
      return WidgetSpan(alignment: PlaceholderAlignment.middle, child: widget);
    }
    return _buildLink(element, style);
  }

  InlineSpan _buildMention(
    md.Element element,
    TextStyle style, {
    required String prefix,
    required FluxerMentionBuilder? builder,
  }) {
    if (builder != null) {
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: builder(context, element.textContent, style),
      );
    }

    return TextSpan(
      text: '$prefix${element.textContent}',
      style: style.copyWith(fontWeight: FontWeight.w500),
    );
  }

  InlineSpan _buildEveryoneMention(md.Element element, TextStyle style) {
    if (config.everyoneMentionBuilder != null) {
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: config.everyoneMentionBuilder!(
          context,
          element.textContent,
          style,
        ),
      );
    }

    return TextSpan(
      text: element.textContent,
      style: style.copyWith(fontWeight: FontWeight.w500),
    );
  }

  Future<void> _handleLinkTap(String href) async {
    if (config.onTapLink != null) {
      await config.onTapLink!(context, href);
      return;
    }

    final uri = Uri.tryParse(href);
    if (uri == null) {
      return;
    }
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class _EmojiOnlyAnalysis {
  const _EmojiOnlyAnalysis({
    required this.isEmojiOnly,
    required this.emojiCount,
  });

  final bool isEmojiOnly;
  final int emojiCount;
}

_EmojiOnlyAnalysis _analyzeEmojiOnlyNodes(List<md.Node> nodes) {
  var emojiCount = 0;
  for (final node in nodes) {
    if (node is md.Text) {
      if (node.text.trim().isNotEmpty) {
        return const _EmojiOnlyAnalysis(isEmojiOnly: false, emojiCount: 0);
      }
      continue;
    }
    if (node is! md.Element) {
      return const _EmojiOnlyAnalysis(isEmojiOnly: false, emojiCount: 0);
    }
    if (node.tag == FluxerUnicodeEmojiToneSyntax.tag ||
        node.tag == FluxerCustomEmojiSyntax.tag) {
      emojiCount++;
      continue;
    }
    return const _EmojiOnlyAnalysis(isEmojiOnly: false, emojiCount: 0);
  }
  return _EmojiOnlyAnalysis(isEmojiOnly: true, emojiCount: emojiCount);
}

bool _allNodesAreEmoji(List<md.Node> nodes) {
  final _EmojiOnlyAnalysis analysis = _analyzeEmojiOnlyNodes(nodes);
  return analysis.isEmojiOnly &&
      analysis.emojiCount > 0 &&
      analysis.emojiCount <= kFluxerMarkdownJumboMaxCount;
}

bool _textFlowAllowsJumboEmoji(List<List<md.Node>> chunkNodes) {
  var totalEmojiCount = 0;
  for (final List<md.Node> nodes in chunkNodes) {
    if (nodes.isEmpty) {
      continue;
    }
    final _EmojiOnlyAnalysis analysis = _analyzeEmojiOnlyNodes(nodes);
    if (!analysis.isEmojiOnly) {
      return false;
    }
    totalEmojiCount += analysis.emojiCount;
  }
  return totalEmojiCount >= 1 &&
      totalEmojiCount <= kFluxerMarkdownJumboMaxCount;
}

bool _isInlineListNode(md.Node node) {
  if (node is md.Text) {
    return true;
  }
  if (node is md.Element) {
    return _isInlineOnlyTag(node.tag);
  }
  return false;
}

bool _isInlineOnlyTag(String tag) {
  return switch (tag) {
    'strong' || 'em' || 'del' || 'underline' || 'code' || 'a' || 'br' => true,
    FluxerJumpLinkSyntax.tag ||
    FluxerUserMentionSyntax.tag ||
    FluxerChannelMentionSyntax.tag ||
    FluxerRoleMentionSyntax.tag ||
    FluxerEveryoneMentionSyntax.tag ||
    FluxerTimestampSyntax.tag ||
    FluxerSpoilerSyntax.tag ||
    FluxerUnicodeEmojiToneSyntax.tag ||
    FluxerCustomEmojiSyntax.tag => true,
    _ => false,
  };
}

List<String> _collectSpoilerSyncKeys(
  md.Element spoiler,
  FluxerSpoilerSyncKeyNormalizer? normalize,
) {
  if (normalize == null) {
    return const [];
  }

  final keys = <String>{};

  void addCandidate(String raw) {
    final normalized = normalize(raw);
    if (normalized != null && normalized.isNotEmpty) {
      keys.add(normalized);
    }
  }

  void visit(md.Node node) {
    if (node is md.Text) {
      for (final match in _spoilerSyncUrlPattern.allMatches(node.text)) {
        addCandidate(match.group(0) ?? '');
      }
      return;
    }

    if (node is! md.Element) {
      return;
    }

    final href = node.attributes['href'];
    if (href != null && href.isNotEmpty) {
      addCandidate(href);
    }

    for (final child in node.children ?? const <md.Node>[]) {
      visit(child);
    }
  }

  for (final child in spoiler.children ?? const <md.Node>[]) {
    visit(child);
  }

  return List<String>.unmodifiable(keys);
}

class _FluxerSpoilerSpan extends StatefulWidget {
  const _FluxerSpoilerSpan({
    required this.child,
    required this.initiallyRevealed,
    required this.syncKeys,
    this.spoilerBackgroundColor,
    this.spoilerSyncController,
  });

  final Widget child;
  final bool initiallyRevealed;
  final Color? spoilerBackgroundColor;
  final FluxerSpoilerSyncController? spoilerSyncController;
  final List<String> syncKeys;

  @override
  State<_FluxerSpoilerSpan> createState() => _FluxerSpoilerSpanState();
}

class _FluxerSpoilerSpanState extends State<_FluxerSpoilerSpan>
    with SingleTickerProviderStateMixin {
  static const _kDuration = Duration(milliseconds: 200);

  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late bool _isRevealed;
  var _manuallyRevealed = false;

  bool get _sharedRevealed =>
      widget.spoilerSyncController?.isRevealed(widget.syncKeys) ?? false;

  bool get _shouldReveal =>
      widget.initiallyRevealed || _manuallyRevealed || _sharedRevealed;

  @override
  void initState() {
    super.initState();
    _isRevealed = _shouldReveal;
    widget.spoilerSyncController?.addListener(_handleSyncChanged);
    _controller = AnimationController(
      vsync: this,
      duration: _kDuration,
      value: _isRevealed ? 1 : 0,
    );
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void didUpdateWidget(covariant _FluxerSpoilerSpan oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.spoilerSyncController != widget.spoilerSyncController) {
      oldWidget.spoilerSyncController?.removeListener(_handleSyncChanged);
      widget.spoilerSyncController?.addListener(_handleSyncChanged);
    }
    if (!listEquals(oldWidget.syncKeys, widget.syncKeys)) {
      _manuallyRevealed = false;
    }
    _applyRevealState();
  }

  @override
  void dispose() {
    widget.spoilerSyncController?.removeListener(_handleSyncChanged);
    _controller.dispose();
    super.dispose();
  }

  void _handleSyncChanged() {
    _applyRevealState();
  }

  void _applyRevealState() {
    final shouldReveal = _shouldReveal;
    if (_isRevealed == shouldReveal) {
      return;
    }
    setState(() => _isRevealed = shouldReveal);
    unawaited(_isRevealed ? _controller.forward() : _controller.reverse());
  }

  void _reveal() {
    if (_isRevealed) {
      return;
    }
    setState(() {
      _manuallyRevealed = true;
      _isRevealed = true;
    });
    widget.spoilerSyncController?.reveal(widget.syncKeys);
    unawaited(_controller.forward());
  }

  @override
  Widget build(BuildContext context) {
    final fill =
        widget.spoilerBackgroundColor ??
        Theme.of(context).colorScheme.outlineVariant;
    return GestureDetector(
      onTap: _reveal,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          children: [
            IgnorePointer(
              ignoring: !_isRevealed,
              child: FadeTransition(opacity: _opacity, child: widget.child),
            ),
            Positioned.fill(
              child: IgnorePointer(
                ignoring: _isRevealed,
                child: AnimatedOpacity(
                  duration: _kDuration,
                  opacity: _isRevealed ? 0 : 1,
                  child: ColoredBox(color: fill),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool _isLatexLanguage(String language) {
  return language == 'latex' || language == 'tex';
}

class FluxerCodeBlockWidget extends StatelessWidget {
  const FluxerCodeBlockWidget({
    required this.element,
    required this.isDark,
    required this.baseStyle,
    this.onCopyCode,
    super.key,
  });

  final md.Element element;
  final bool isDark;
  final TextStyle baseStyle;
  final FluxerCodeCopyHandler? onCopyCode;

  static const _kPadding = EdgeInsets.all(12);
  static const _kRadius = BorderRadius.all(Radius.circular(4));

  @override
  Widget build(BuildContext context) {
    final rawClass = (element.attributes['class'] ?? '').trim();
    final rawLang = rawClass.startsWith('language-')
        ? rawClass.replaceFirst('language-', '').toLowerCase()
        : '';
    var code = element.textContent;
    if (code.endsWith('\n')) {
      code = code.substring(0, code.length - 1);
    }

    final bgColor = isDark
        ? (vs2015Theme['root']?.backgroundColor ??
              Theme.of(context).colorScheme.surfaceContainerHighest)
        : (githubTheme['root']?.backgroundColor ??
              Theme.of(context).colorScheme.surfaceContainerHighest);

    if (_isLatexLanguage(rawLang)) {
      return _FluxerCodeBlockWithCopy(
        code: code,
        onCopyCode: onCopyCode,
        child: _FluxerLatexCodeBlockBody(
          code: code,
          baseStyle: baseStyle,
          bgColor: bgColor,
        ),
      );
    }

    final knownLang = kFluxerMarkdownLanguages.containsKey(rawLang)
        ? rawLang
        : null;
    if (knownLang == null && rawLang.isNotEmpty) {
      code = '$rawLang\n$code';
    }

    final Widget codeBody;
    if (knownLang == null) {
      codeBody = Container(
        width: double.infinity,
        decoration: BoxDecoration(color: bgColor, borderRadius: _kRadius),
        padding: _kPadding,
        child: Text(
          code,
          style: baseStyle.copyWith(
            fontFamily: 'monospace',
            fontSize: (baseStyle.fontSize ?? 16) * 0.85,
          ),
        ),
      );
    } else {
      codeBody = HighlightView(
        code,
        language: knownLang,
        theme: isDark
            ? kVs2015CodeBlockHighlightTheme
            : kGithubCodeBlockHighlightTheme,
        padding: _kPadding,
        textStyle: baseStyle.copyWith(
          fontFamily: 'monospace',
          fontSize: (baseStyle.fontSize ?? 16) * 0.85,
        ),
      );
    }

    return _FluxerCodeBlockWithCopy(
      code: code,
      onCopyCode: onCopyCode,
      child: codeBody,
    );
  }
}

class _FluxerLatexCodeBlockBody extends StatelessWidget {
  const _FluxerLatexCodeBlockBody({
    required this.code,
    required this.baseStyle,
    required this.bgColor,
  });

  final String code;
  final TextStyle baseStyle;
  final Color bgColor;

  static const _kPadding = EdgeInsets.all(12);
  static const _kRadius = BorderRadius.all(Radius.circular(4));

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        baseStyle.color ?? Theme.of(context).colorScheme.onSurface;
    final TextStyle monoStyle = baseStyle.copyWith(
      fontFamily: 'monospace',
      fontSize: (baseStyle.fontSize ?? 16) * 0.85,
      color: textColor,
    );
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor, borderRadius: _kRadius),
      padding: _kPadding,
      child: Center(
        child: LaTexT(
          laTeXCode: Text(
            '${r'$$'}$code${r'$$'}',
            textAlign: TextAlign.center,
            style: baseStyle.copyWith(color: textColor),
          ),
          equationStyle: baseStyle.copyWith(
            color: textColor,
            fontSize: (baseStyle.fontSize ?? 16) * 1.1,
          ),
          onErrorFallback: (String text) => Text(text, style: monoStyle),
        ),
      ),
    );
  }
}

class _FluxerCodeBlockWithCopy extends StatelessWidget {
  const _FluxerCodeBlockWithCopy({
    required this.code,
    required this.child,
    this.onCopyCode,
  });

  final String code;
  final Widget child;
  final FluxerCodeCopyHandler? onCopyCode;

  static const _kRadius = BorderRadius.all(Radius.circular(4));

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final copyLabel = MaterialLocalizations.of(context).copyButtonLabel;
    return ClipRRect(
      borderRadius: _kRadius,
      child: Stack(
        children: [
          SizedBox(width: double.infinity, child: child),
          Positioned(
            top: 8,
            right: 8,
            child: Tooltip(
              message: copyLabel,
              child: GestureDetector(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: code));
                  if (!context.mounted) {
                    return;
                  }
                  onCopyCode?.call(context, code);
                },
                child: PhosphorIcon(
                  PhosphorIconsFill.clipboard,
                  size: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FluxerInlineCodeWidget extends StatelessWidget {
  const FluxerInlineCodeWidget({
    required this.text,
    required this.baseStyle,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  final String text;
  final TextStyle baseStyle;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final fontSize = baseStyle.fontSize ?? 16;
    return Container(
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(fontSize * 0.25),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: fontSize * 0.25,
        vertical: fontSize * 0.0625,
      ),
      child: Text(
        text,
        style: baseStyle.copyWith(
          color: textColor,
          fontSize: fontSize * 0.85,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}

class FluxerSvgCache {
  FluxerSvgCache._();

  static final _cache = <String, Future<Uint8List>>{};

  static Future<Uint8List> load(String url) {
    return _cache.putIfAbsent(url, () async {
      final uri = Uri.parse(url);
      final response = await HttpClient().getUrl(uri).then((r) => r.close());
      final builder = BytesBuilder();
      await response.forEach(builder.add);
      return builder.toBytes();
    });
  }
}

class FluxerEmojiWidget extends StatelessWidget {
  const FluxerEmojiWidget({
    required this.element,
    required this.baseStyle,
    required this.unicodeEmojiUrlBuilder,
    required this.customEmojiUrlBuilder,
    this.jumbo = false,
    super.key,
  });

  final md.Element element;
  final TextStyle baseStyle;
  final bool jumbo;
  final FluxerUnicodeEmojiUrlBuilder unicodeEmojiUrlBuilder;
  final FluxerCustomEmojiUrlBuilder customEmojiUrlBuilder;

  @override
  Widget build(BuildContext context) {
    final size = jumbo
        ? kFluxerMarkdownEmojiSizeJumbo
        : (baseStyle.fontSize ?? 16) * kFluxerMarkdownEmojiSizeMultiplier;
    if (element.tag == FluxerCustomEmojiSyntax.tag) {
      return _buildCustom(size);
    }
    return _buildUnicode(size);
  }

  Widget _buildUnicode(double size) {
    final surrogate = element.attributes['surrogate'] ?? element.textContent;
    final url = unicodeEmojiUrlBuilder(surrogate);
    if (url == null) {
      return Text(surrogate, style: TextStyle(fontSize: size));
    }
    return FutureBuilder<Uint8List>(
      future: FluxerSvgCache.load(url),
      builder: (context, snap) {
        if (!snap.hasData) {
          return SizedBox(width: size, height: size);
        }
        return SvgPicture.memory(snap.data!, width: size, height: size);
      },
    );
  }

  Widget _buildCustom(double size) {
    final id = element.attributes['id'] ?? '';
    final name = element.textContent;
    final animated = element.attributes['animated'] == 'true';
    final cdnSize = jumbo ? 240 : 96;
    final url = customEmojiUrlBuilder(
      id: id,
      animated: animated,
      size: cdnSize,
    );
    final px = size.toInt();
    return SizedBox(
      width: size,
      height: size,
      child: CachedNetworkImage(
        imageUrl: url,
        cacheKey: 'emoji_${id}_${animated ? 'a' : 's'}',
        width: size,
        height: size,
        // Cap one decode axis only. Capping both forces ResizeImagePolicy.exact,
        // which stretches non-square emoji into a square (issue #445).
        memCacheWidth: px,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => Text(':$name:'),
      ),
    );
  }
}

String? _formatTimestampText(md.Element element) {
  final unix = int.tryParse(element.textContent);
  if (unix == null) {
    return null;
  }

  final dt = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
  final flag = element.attributes['flag'] ?? 'f';
  return switch (flag) {
    's' => DateFormat.yMd().add_Hm().format(dt),
    'S' => DateFormat.yMd().add_Hms().format(dt),
    't' => DateFormat.Hm().format(dt),
    'T' => DateFormat.Hms().format(dt),
    'd' => DateFormat.yMd().format(dt),
    'D' => DateFormat.yMMMMd().format(dt),
    'F' => DateFormat.yMMMMEEEEd().add_Hm().format(dt),
    'R' => _relative(dt),
    _ => DateFormat.yMMMMd().add_Hm().format(dt),
  };
}

String _relative(DateTime dt) {
  final diff = dt.difference(DateTime.now());
  final abs = diff.abs();
  final future = !diff.isNegative;
  final String label;
  if (abs.inSeconds < 60) {
    label = '${abs.inSeconds} seconds';
  } else if (abs.inMinutes < 60) {
    label = '${abs.inMinutes} minutes';
  } else if (abs.inHours < 24) {
    label = '${abs.inHours} hours';
  } else if (abs.inDays < 30) {
    label = '${abs.inDays} days';
  } else if (abs.inDays < 365) {
    label = '${abs.inDays ~/ 30} months';
  } else {
    label = '${abs.inDays ~/ 365} years';
  }
  return future ? 'in $label' : '$label ago';
}
