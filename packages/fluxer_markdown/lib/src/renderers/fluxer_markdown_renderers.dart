import 'dart:async';
import 'dart:ui' as ui;

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_element_tags.dart';
import 'package:fluxer_markdown/src/utils/ansi_text_parser.dart';
import 'package:fluxer_markdown/src/utils/bounded_text.dart';
import 'package:fluxer_markdown/src/utils/code_block_highlight.dart';
import 'package:fluxer_markdown/src/utils/highlight_languages.dart';
import 'package:fluxer_markdown/src/utils/jumbo_emoji.dart';
import 'package:fluxer_markdown/src/utils/markup_spacing.dart';
import 'package:fluxer_markdown/src/utils/masked_link_guards.dart';
import 'package:fluxer_markdown/src/utils/monospace_text_style.dart';
import 'package:fluxer_markdown/src/widgets/emoji_asset_image.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown_link_registry.dart';
import 'package:fluxer_markdown/src/widgets/system_emoji_fallback.dart';
import 'package:intl/intl.dart';
import 'package:latext/latext.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

double _blockSpacingForStyle(TextStyle style) => FluxerMarkupSpacing.blockGap;

double _headingFontSize(TextStyle baseStyle, int level) {
  final double fontSize =
      baseStyle.fontSize ?? FluxerMarkupSpacing.rootFontSize;
  return switch (level) {
    1 => fontSize * 1.375,
    2 => fontSize * 1.25,
    3 => fontSize * 1.125,
    4 => fontSize,
    _ => fontSize,
  };
}

String _unorderedListMarkerForDepth(int depth) {
  return switch (depth % 3) {
    0 => '\u2022',
    1 => '\u25E6',
    2 => '\u25AA',
    _ => '\u2022',
  };
}

String _orderedListMarkerForDepth(int index, int depth) {
  return switch (depth % 3) {
    0 => '$index.',
    1 => '${_toAlphaListMarker(index)}.',
    2 => '${_toRomanListMarker(index)}.',
    _ => '$index.',
  };
}

String _toAlphaListMarker(int index) {
  var value = index;
  final StringBuffer buffer = StringBuffer();
  while (value > 0) {
    value--;
    buffer.writeCharCode(97 + (value % 26));
    value ~/= 26;
  }
  return buffer.toString().split('').reversed.join();
}

String _toRomanListMarker(int index) {
  const List<(int, String)> numerals = <(int, String)>[
    (1000, 'm'),
    (900, 'cm'),
    (500, 'd'),
    (400, 'cd'),
    (100, 'c'),
    (90, 'xc'),
    (50, 'l'),
    (40, 'xl'),
    (10, 'x'),
    (9, 'ix'),
    (5, 'v'),
    (4, 'iv'),
    (1, 'i'),
  ];
  var value = index;
  final StringBuffer buffer = StringBuffer();
  for (final (int amount, String symbol) in numerals) {
    while (value >= amount) {
      buffer.write(symbol);
      value -= amount;
    }
  }
  return buffer.toString();
}

bool _isValidLatexContent(String code) {
  if (code.length > 1024) {
    return false;
  }
  return RegExp(r'\\[a-zA-Z]+').allMatches(code).length <= 64;
}

double _listMarkerColumnWidth({
  required Iterable<String> markers,
  required TextStyle style,
  required TextScaler textScaler,
  required ui.TextDirection textDirection,
}) {
  final TextPainter painter = TextPainter(
    textDirection: textDirection,
    maxLines: 1,
    textScaler: textScaler,
  );
  var maxWidth = 0.0;
  for (final String marker in markers) {
    painter
      ..text = TextSpan(text: marker, style: style)
      ..layout();
    if (painter.width > maxWidth) {
      maxWidth = painter.width;
    }
  }
  painter.dispose();
  final double fontSize = style.fontSize ?? FluxerMarkupSpacing.rootFontSize;
  return maxWidth + textScaler.scale(fontSize) * 0.25;
}

final RegExp _spoilerSyncUrlPattern = RegExp(
  r'''https?:\/\/[^\s<>"']+''',
  caseSensitive: false,
);

class FluxerMarkdownBlockRenderState {
  var hasRenderedHeading = false;
}

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

Widget wrapFluxerMarkdownSelectable({
  required Widget body,
  required bool selectable,
  required FluxerMarkdownConfig config,
}) {
  if (!selectable) {
    return body;
  }
  final FluxerSelectionContextMenuBuilder? menuBuilder =
      config.selectionContextMenuBuilder;
  if (menuBuilder == null) {
    return SelectionArea(child: body);
  }
  return SelectionArea(contextMenuBuilder: menuBuilder, child: body);
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
  FluxerMarkdownBlockRenderState? renderState,
}) {
  final body = _MarkdownBlockRenderer(
    context: context,
    baseStyle: baseStyle,
    config: config,
    features: features,
    isDark: isDark,
    maxLines: maxLines,
    overflow: overflow,
    renderState: renderState,
  ).build(nodes);

  return wrapFluxerMarkdownSelectable(
    body: body,
    selectable: selectable,
    config: config,
  );
}

/// Renders a pre-parsed AST through the same renderers as
/// [buildFluxerMarkdownAst]; hosts inline spoiler reveal state itself because
/// the text-flow path never runs for provided ASTs.
Widget buildFluxerMarkdownProvidedAst({
  required BuildContext context,
  required List<md.Node> nodes,
  required TextStyle baseStyle,
  required FluxerMarkdownConfig config,
  required FluxerMarkdownFeatures features,
  required bool selectable,
  required bool isDark,
  int? maxLines,
  TextOverflow? overflow,
  Widget? trailingInlineWidget,
}) {
  Widget buildBody(BuildContext hostContext) {
    final renderer = _MarkdownBlockRenderer(
      context: hostContext,
      baseStyle: baseStyle,
      config: config,
      features: features,
      isDark: isDark,
      maxLines: maxLines,
      overflow: overflow,
    );
    if (trailingInlineWidget == null || features.isRestrictedInlinePreview) {
      return renderer.build(nodes);
    }
    return renderer.buildWithTrailingInlineWidget(nodes, trailingInlineWidget);
  }

  final bool hostSpoilers =
      maxLines == null &&
      !config.spoilersInitiallyRevealed &&
      _containsInlineSpoiler(nodes);
  final Widget body = hostSpoilers
      ? _FluxerSpoilerRevealHost(config: config, builder: buildBody)
      : buildBody(context);
  return wrapFluxerMarkdownSelectable(
    body: body,
    selectable: selectable,
    config: config,
  );
}

bool _containsInlineSpoiler(List<md.Node> nodes) {
  for (final md.Node node in nodes) {
    if (node is! md.Element) {
      continue;
    }
    if (node.tag == FluxerMarkdownElementTags.spoiler) {
      return true;
    }
    if (_containsInlineSpoiler(node.children ?? const [])) {
      return true;
    }
  }
  return false;
}

String collapseRestrictedInlineText(String text) {
  return text.replaceAll('\n', ' ').replaceAll(RegExp(r'\s+'), ' ');
}

List<InlineSpan> collectRestrictedInlinePreviewSpans({
  required BuildContext context,
  required List<md.Node> nodes,
  required TextStyle baseStyle,
  required FluxerMarkdownConfig config,
  required FluxerMarkdownFeatures features,
  required bool isDark,
  int? maxLines,
  TextOverflow? overflow,
}) {
  return _MarkdownBlockRenderer(
    context: context,
    baseStyle: baseStyle,
    config: config,
    features: features,
    isDark: isDark,
    maxLines: maxLines,
    overflow: overflow,
  ).collectRestrictedInlinePreviewSpans(nodes);
}

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

bool _hasApostropheInLinkAuthority(String href) {
  final Uri? uri = Uri.tryParse(href);
  if (uri == null || !uri.hasAuthority) {
    return false;
  }
  return uri.host.contains("'");
}

class _MarkdownBlockRenderer {
  _MarkdownBlockRenderer({
    required this.context,
    required this.baseStyle,
    required this.config,
    required this.features,
    required this.isDark,
    this.maxLines,
    this.overflow,
    this.renderState,
  });

  final BuildContext context;
  final TextStyle baseStyle;
  final FluxerMarkdownConfig config;
  final FluxerMarkdownFeatures features;
  final bool isDark;
  final int? maxLines;
  final TextOverflow? overflow;
  final FluxerMarkdownBlockRenderState? renderState;
  var _hasRenderedBlock = false;

  Widget build(List<md.Node> nodes) {
    if (features.isRestrictedInlinePreview) {
      return _buildRestrictedInlinePreview(nodes);
    }

    _hasRenderedBlock = false;
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

  Widget buildWithTrailingInlineWidget(List<md.Node> nodes, Widget trailing) {
    _hasRenderedBlock = false;
    final children = <Widget>[];
    var trailingApplied = false;
    for (var i = 0; i < nodes.length; i++) {
      final md.Node node = nodes[i];
      if (i == nodes.length - 1 && _isTrailingParagraphNode(node)) {
        children.add(_buildTrailingParagraph(node, trailing));
        trailingApplied = true;
        continue;
      }
      final Widget? widget = buildBlock(node);
      if (widget != null) {
        children.add(widget);
      }
    }
    if (!trailingApplied) {
      children.add(trailing);
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

  bool _isTrailingParagraphNode(md.Node node) {
    if (node is md.Text) {
      return true;
    }
    return node is md.Element &&
        (node.tag == 'p' || _isInlineOnlyTag(node.tag));
  }

  Widget _buildTrailingParagraph(md.Node node, Widget trailing) {
    final List<md.Node> children = node is md.Element && node.tag == 'p'
        ? node.children ?? const []
        : <md.Node>[node];
    return _buildParagraph(children, trailingInlineWidget: trailing);
  }

  Widget _buildRestrictedInlinePreview(List<md.Node> nodes) {
    final spans = collectRestrictedInlinePreviewSpans(nodes);
    if (spans.isEmpty) {
      return const SizedBox.shrink();
    }
    return buildFluxerBoundedRichText(
      text: TextSpan(style: baseStyle, children: spans),
      baseStyle: baseStyle,
      textScaler: MediaQuery.textScalerOf(context),
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  List<InlineSpan> collectRestrictedInlinePreviewSpans(List<md.Node> nodes) {
    final spans = <InlineSpan>[];
    var needsSeparator = false;
    for (final node in nodes) {
      final nodeSpans = _collectRestrictedInlinePreviewSpans(node);
      if (nodeSpans.isEmpty) {
        continue;
      }
      if (needsSeparator && spans.isNotEmpty) {
        spans.add(TextSpan(text: ' ', style: baseStyle));
      }
      spans.addAll(nodeSpans);
      needsSeparator = true;
    }
    return spans;
  }

  List<InlineSpan> _collectRestrictedInlinePreviewSpans(md.Node node) {
    if (node is md.Text) {
      final text = collapseRestrictedInlineText(node.text);
      if (text.isEmpty) {
        return const <InlineSpan>[];
      }
      return [TextSpan(text: text, style: baseStyle)];
    }

    if (node is! md.Element) {
      return const <InlineSpan>[];
    }

    switch (node.tag) {
      case 'p':
      case 'h1':
      case 'h2':
      case 'h3':
      case 'h4':
        return _MarkdownInlineRenderer(
          context: context,
          baseStyle: baseStyle,
          config: config,
          features: features,
          isDark: isDark,
          jumbo: false,
          maxLines: maxLines,
          overflow: overflow,
          spoilerIndexCounter: _SpoilerIndexCounter(),
        ).build(node.children ?? const []);
      case 'pre':
        final codeElement = node.children
            ?.whereType<md.Element>()
            .cast<md.Element?>()
            .firstWhere((child) => child?.tag == 'code', orElse: () => null);
        if (codeElement == null) {
          return const <InlineSpan>[];
        }
        final text = collapseRestrictedInlineText(codeElement.textContent);
        if (text.isEmpty) {
          return const <InlineSpan>[];
        }
        return [
          TextSpan(
            text: text,
            style: codeTextStyleFrom(
              baseStyle,
              codeTextStyle: config.codeTextStyle,
              color: config.inlineCodeTextColor,
              backgroundColor: config.inlineCodeBackgroundColor,
            ),
          ),
        ];
      case 'alert':
        return const <InlineSpan>[];
      case 'block-spoiler':
        return [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: _buildBlockSpoilerElement(node),
          ),
        ];
      default:
        if (_isInlineOnlyTag(node.tag)) {
          return _MarkdownInlineRenderer(
            context: context,
            baseStyle: baseStyle,
            config: config,
            features: features,
            isDark: isDark,
            jumbo: false,
            maxLines: maxLines,
            overflow: overflow,
            spoilerIndexCounter: _SpoilerIndexCounter(),
          ).build([node]);
        }
        final spans = <InlineSpan>[];
        for (final child in node.children ?? const <md.Node>[]) {
          spans.addAll(_collectRestrictedInlinePreviewSpans(child));
        }
        return spans;
    }
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
        return _buildHeadingParagraph(node.children ?? const [], level: 1);
      case 'h2':
        return _buildHeadingParagraph(node.children ?? const [], level: 2);
      case 'h3':
        return _buildHeadingParagraph(node.children ?? const [], level: 3);
      case 'h4':
        return _buildHeadingParagraph(node.children ?? const [], level: 4);
      case 'h5':
      case 'h6':
        return _buildParagraph(node.children ?? const []);
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
        return _buildParagraph([md.Text(node.textContent)]);
      case 'alert':
        return _buildAlert(node);
      case 'subtext':
        return _buildSubtext(node);
      case 'block-spoiler':
        return _buildBlockSpoilerElement(node);
      default:
        if (_isInlineOnlyTag(node.tag)) {
          return _buildParagraph([node]);
        }
        return build(node.children ?? const []);
    }
  }

  Widget _buildHeadingParagraph(List<md.Node> nodes, {required int level}) {
    final bool isFirstBlock = !_hasRenderedBlock;
    final bool isFirstHeading =
        renderState?.hasRenderedHeading != true && isFirstBlock;
    _hasRenderedBlock = true;
    renderState?.hasRenderedHeading = true;
    final TextStyle style = baseStyle.copyWith(
      fontSize: _headingFontSize(baseStyle, level),
      fontWeight: FontWeight.w600,
      height: FluxerMarkupSpacing.headingLineHeight,
    );
    return Padding(
      padding: EdgeInsets.only(
        top: isFirstHeading
            ? FluxerMarkupSpacing.headingTopFirst
            : FluxerMarkupSpacing.headingTop,
        bottom: FluxerMarkupSpacing.headingBottom,
      ),
      child: _buildParagraph(nodes, style: style),
    );
  }

  Widget _buildParagraph(
    List<md.Node> nodes, {
    TextStyle? style,
    TextAlign? textAlign,
    Widget? trailingInlineWidget,
  }) {
    final effectiveStyle = style ?? baseStyle;
    final spans = _MarkdownInlineRenderer(
      context: context,
      baseStyle: effectiveStyle,
      config: config,
      features: features,
      isDark: isDark,
      jumbo:
          style == null && features.allowJumboEmoji && _allNodesAreEmoji(nodes),
      maxLines: maxLines,
      overflow: overflow,
      spoilerIndexCounter: _SpoilerIndexCounter(),
    ).build(nodes);

    if (spans.isEmpty) {
      if (trailingInlineWidget != null) {
        return trailingInlineWidget;
      }
      return buildFluxerBoundedRichText(
        text: TextSpan(text: '\n', style: effectiveStyle),
        baseStyle: effectiveStyle,
        textAlign: textAlign ?? TextAlign.start,
        textScaler: MediaQuery.textScalerOf(context),
        maxLines: maxLines,
        overflow: overflow,
        textWidthBasis: maxLines != null
            ? TextWidthBasis.parent
            : TextWidthBasis.longestLine,
      );
    }

    if (trailingInlineWidget != null) {
      appendTrailingInlineWidget(spans, effectiveStyle, trailingInlineWidget);
    }
    final Widget richText = buildFluxerBoundedRichText(
      text: TextSpan(style: effectiveStyle, children: spans),
      baseStyle: effectiveStyle,
      textAlign: textAlign ?? TextAlign.start,
      textScaler: MediaQuery.textScalerOf(context),
      maxLines: maxLines,
      overflow: overflow,
      textWidthBasis: maxLines != null || trailingInlineWidget != null
          ? TextWidthBasis.parent
          : TextWidthBasis.longestLine,
    );
    if (trailingInlineWidget != null) {
      return SizedBox(width: double.infinity, child: richText);
    }
    return richText;
  }

  Widget _buildAlert(md.Element node) {
    final FluxerAlertType type =
        tryParseFluxerAlertType(node.attributes['type'] ?? '') ??
        FluxerAlertType.note;
    final Widget body = _MarkdownBlockRenderer(
      context: context,
      baseStyle: baseStyle,
      config: config,
      features: features,
      isDark: isDark,
      maxLines: maxLines,
      overflow: overflow,
    ).build(node.children ?? const []);
    return (config.alertBuilder ?? defaultFluxerAlertBuilder)(
      context,
      type,
      body,
      baseStyle,
    );
  }

  Widget _buildSubtext(md.Element node) {
    final TextStyle subtextStyle = baseStyle.copyWith(
      fontSize: (baseStyle.fontSize ?? 16) * 0.8125,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      height: 1.375,
    );
    return _buildParagraph(node.children ?? const [], style: subtextStyle);
  }

  Widget _buildBlockSpoilerElement(md.Element node) {
    return _FluxerSpoilerSpan(
      initiallyRevealed: config.spoilersInitiallyRevealed,
      spoilerBackgroundColor: config.spoilerBackgroundColor,
      spoilerSyncController: config.spoilerSyncController,
      syncKeys: _collectSpoilerSyncKeys(node, config.spoilerSyncKeyNormalizer),
      child: _buildParagraph(node.children ?? const []),
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
      margin: const EdgeInsets.symmetric(
        vertical: FluxerMarkupSpacing.quoteMargin,
      ),
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
            padding: const EdgeInsetsDirectional.fromSTEB(
              FluxerMarkupSpacing.quoteDividerEnd,
              FluxerMarkupSpacing.quoteMargin,
              0,
              FluxerMarkupSpacing.quoteMargin,
            ),
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
      codeTextStyle: config.codeTextStyle,
      onCopyCode: config.onCopyCode,
    );
  }

  Widget _buildList(md.Element node, {required bool ordered, int depth = 0}) {
    final items = node.children?.whereType<md.Element>().toList() ?? const [];
    final start = int.tryParse(node.attributes['start'] ?? '1') ?? 1;
    String markerFor(int index) {
      if (ordered) {
        return _orderedListMarkerForDepth(start + index, depth);
      }
      return _unorderedListMarkerForDepth(depth);
    }

    final List<String> markers = <String>[
      for (var i = 0; i < items.length; i++) markerFor(i),
    ];
    final TextScaler textScaler = MediaQuery.textScalerOf(context);
    final List<String> widthMarkers = markers.isEmpty
        ? <String>[markerFor(0)]
        : markers;
    final double markerColumnWidth = _listMarkerColumnWidth(
      markers: widthMarkers,
      style: baseStyle,
      textScaler: textScaler,
      textDirection: Directionality.of(context),
    );
    final markerTextAlign = ordered ? TextAlign.right : TextAlign.start;
    return Padding(
      padding: const EdgeInsets.only(top: FluxerMarkupSpacing.listBlockMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < items.length; i++)
            Padding(
              padding: EdgeInsets.only(
                bottom: i == items.length - 1
                    ? 0
                    : FluxerMarkupSpacing.listItemGap,
              ),
              child: _buildListItem(
                items[i],
                marker: markers[i],
                markerColumnWidth: markerColumnWidth,
                markerTextAlign: markerTextAlign,
                textScaler: textScaler,
                depth: depth,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildListItem(
    md.Element item, {
    required String marker,
    required double markerColumnWidth,
    required TextAlign markerTextAlign,
    required TextScaler textScaler,
    required int depth,
  }) {
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
        if (child.tag == 'ul' || child.tag == 'ol') {
          if (depth + 1 >= kFluxerMarkdownMaxListNestingDepth) {
            _appendFlattenedListContent(content, child);
          } else {
            final nested = _buildList(
              child,
              ordered: child.tag == 'ol',
              depth: depth + 1,
            );
            nestedBlocks.add(nested);
          }
        } else {
          final nested = buildBlock(child);
          if (nested != null) {
            nestedBlocks.add(nested);
          }
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

    final List<Widget> spacedContent = <Widget>[];
    for (var i = 0; i < content.length; i++) {
      if (i > 0) {
        spacedContent.add(
          const SizedBox(height: FluxerMarkupSpacing.paragraphBottom),
        );
      }
      spacedContent.add(content[i]);
    }

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (spacedContent.isNotEmpty) ...spacedContent,
        if (nestedBlocks.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: FluxerMarkupSpacing.listNestedTop,
            ),
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
        SizedBox(
          width: markerColumnWidth,
          child: buildFluxerBoundedRichText(
            text: TextSpan(text: marker, style: baseStyle),
            baseStyle: baseStyle,
            textAlign: markerTextAlign,
            textScaler: textScaler,
            maxLines: 1,
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
        ),
        Expanded(child: body),
      ],
    );
  }

  void _appendFlattenedListContent(List<Widget> content, md.Element list) {
    for (final md.Node item in list.children ?? const <md.Node>[]) {
      if (item is! md.Element || item.tag != 'li') {
        continue;
      }
      for (final md.Node child in item.children ?? const <md.Node>[]) {
        if (child is md.Element && child.tag == 'p') {
          content.add(_buildParagraph(child.children ?? const []));
        } else if (child is md.Text && child.text.trim().isNotEmpty) {
          content.add(_buildParagraph([child]));
        }
      }
    }
  }

  Widget _buildTable(md.Element table) {
    final double baseFontSize = baseStyle.fontSize ?? 16;
    final double minCellWidth = baseFontSize * 5;
    final EdgeInsets cellPadding = EdgeInsets.symmetric(
      horizontal: baseFontSize * 0.75,
      vertical: baseFontSize * 0.5,
    );
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color borderColor =
        config.tableBorderColor ?? colorScheme.outlineVariant;
    final Color headerBackgroundColor =
        config.tableHeaderBackgroundColor ??
        colorScheme.surfaceContainerHighest;
    final Color headerTextColor =
        config.tableHeaderTextColor ?? baseStyle.color ?? colorScheme.onSurface;
    final Color rowOddBackgroundColor =
        config.tableRowOddBackgroundColor ?? Colors.transparent;
    final Color rowEvenBackgroundColor =
        config.tableRowEvenBackgroundColor ?? Colors.transparent;
    final BorderRadius borderRadius =
        config.tableBorderRadius ?? const BorderRadius.all(Radius.circular(6));
    final TextStyle tableStyle = baseStyle.copyWith(
      fontSize: baseFontSize * 0.875,
      height: 1.4,
    );
    final TextStyle headerStyle = tableStyle.copyWith(
      color: headerTextColor,
      fontWeight: FontWeight.w600,
      height: baseStyle.height,
    );
    final BorderSide borderSide = BorderSide(color: borderColor);
    final List<TableRow> tableRows = <TableRow>[];
    int columnCount = 0;
    final sectionElements = table.children?.whereType<md.Element>() ?? const [];
    for (final md.Element section in sectionElements) {
      if (section.tag != 'thead' && section.tag != 'tbody') {
        continue;
      }
      final List<md.Element> rowElements =
          section.children?.whereType<md.Element>().toList() ?? const [];
      var bodyRowIndex = 0;
      for (final md.Element row in rowElements) {
        if (row.tag != 'tr') {
          continue;
        }
        final List<md.Element> cellElements =
            row.children?.whereType<md.Element>().toList() ?? const [];
        if (cellElements.length > columnCount) {
          columnCount = cellElements.length;
        }
        final bool isHeader = section.tag == 'thead';
        tableRows.add(
          TableRow(
            children: <Widget>[
              for (final md.Element cell in cellElements)
                _buildTableCell(
                  cell: cell,
                  isHeader: isHeader,
                  bodyRowIndex: bodyRowIndex,
                  headerBackgroundColor: headerBackgroundColor,
                  rowOddBackgroundColor: rowOddBackgroundColor,
                  rowEvenBackgroundColor: rowEvenBackgroundColor,
                  headerStyle: headerStyle,
                  tableStyle: tableStyle,
                  cellPadding: cellPadding,
                  minCellWidth: minCellWidth,
                ),
            ],
          ),
        );
        if (section.tag == 'tbody') {
          bodyRowIndex++;
        }
      }
    }
    if (tableRows.isEmpty) {
      return const SizedBox.shrink();
    }
    final Map<int, TableColumnWidth> columnWidths = <int, TableColumnWidth>{
      for (int i = 0; i < columnCount; i++) i: const IntrinsicColumnWidth(),
    };
    final Widget tableWidget = Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
      columnWidths: columnWidths,
      border: TableBorder(horizontalInside: borderSide),
      children: tableRows,
    );
    return Padding(
      padding: EdgeInsets.only(bottom: baseFontSize * 0.75),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: borderRadius,
          ),
          clipBehavior: Clip.antiAlias,
          child: tableWidget,
        ),
      ),
    );
  }

  Widget _buildTableCell({
    required md.Element cell,
    required bool isHeader,
    required int bodyRowIndex,
    required Color headerBackgroundColor,
    required Color rowOddBackgroundColor,
    required Color rowEvenBackgroundColor,
    required TextStyle headerStyle,
    required TextStyle tableStyle,
    required EdgeInsets cellPadding,
    required double minCellWidth,
  }) {
    final Color backgroundColor = isHeader
        ? headerBackgroundColor
        : bodyRowIndex.isEven
        ? rowOddBackgroundColor
        : rowEvenBackgroundColor;
    final TextStyle cellStyle = isHeader ? headerStyle : tableStyle;
    final TextAlign textAlign = _tableCellTextAlign(cell.attributes['align']);
    return Container(
      constraints: BoxConstraints(minWidth: minCellWidth),
      padding: cellPadding,
      alignment: _tableCellAlignment(textAlign, isHeader: isHeader),
      color: backgroundColor,
      child: _buildParagraph(
        cell.children ?? const [],
        style: cellStyle,
        textAlign: textAlign,
      ),
    );
  }

  TextAlign _tableCellTextAlign(String? alignment) {
    return switch (alignment) {
      'center' => TextAlign.center,
      'right' => TextAlign.right,
      _ => TextAlign.left,
    };
  }

  Alignment _tableCellAlignment(TextAlign textAlign, {required bool isHeader}) {
    final double vertical = isHeader ? -1 : 0;
    return switch (textAlign) {
      TextAlign.center => Alignment(0, vertical),
      TextAlign.right => Alignment(1, vertical),
      _ => Alignment(-1, vertical),
    };
  }
}

class _MarkdownInlineRenderer {
  _MarkdownInlineRenderer({
    required this.context,
    required this.baseStyle,
    required this.config,
    required this.features,
    required this.isDark,
    required this.jumbo,
    required this.spoilerIndexCounter,
    this.maxLines,
    this.overflow,
  });

  final BuildContext context;
  final TextStyle baseStyle;
  final FluxerMarkdownConfig config;
  final FluxerMarkdownFeatures features;
  final bool isDark;
  final bool jumbo;
  final _SpoilerIndexCounter spoilerIndexCounter;
  final int? maxLines;
  final TextOverflow? overflow;

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
      final text = features.isRestrictedInlinePreview
          ? collapseRestrictedInlineText(node.text)
          : node.text;
      if (text.isEmpty) {
        return null;
      }
      return TextSpan(text: text, style: effectiveStyle);
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
          color: config.dimStrikethroughText
              ? effectiveStyle.color?.withValues(alpha: 0.5)
              : effectiveStyle.color,
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
        return TextSpan(
          text: node.textContent,
          style: codeTextStyleFrom(
            effectiveStyle,
            codeTextStyle: config.codeTextStyle,
            color: config.inlineCodeTextColor,
            backgroundColor: config.inlineCodeBackgroundColor,
          ),
        );
      case 'br':
        return const TextSpan(text: '\n');
      case 'a':
        return _buildLink(node, effectiveStyle);
      case FluxerMarkdownElementTags.jumpLink:
        return _buildJumpLink(node, effectiveStyle);
      case FluxerMarkdownElementTags.mentionUser:
        return _buildMention(
          node,
          effectiveStyle,
          prefix: '@',
          builder: config.userMentionBuilder,
        );
      case FluxerMarkdownElementTags.mentionChannel:
        return _buildMention(
          node,
          effectiveStyle,
          prefix: '#',
          builder: config.channelMentionBuilder,
        );
      case FluxerMarkdownElementTags.mentionRole:
        return _buildMention(
          node,
          effectiveStyle,
          prefix: '@',
          builder: config.roleMentionBuilder,
        );
      case FluxerMarkdownElementTags.mentionEveryone:
        return _buildEveryoneMention(node, effectiveStyle);
      case FluxerMarkdownElementTags.mentionCommand:
        return _buildCommandMention(node, effectiveStyle);
      case FluxerMarkdownElementTags.mentionGuildNav:
        return _buildGuildNavigationMention(node, effectiveStyle);
      case FluxerMarkdownElementTags.timestamp:
        final timestampText = _formatTimestampText(
          node,
          localeName: Localizations.localeOf(context).toLanguageTag(),
          formatter: config.timestampFormatter,
        );
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
      case FluxerMarkdownElementTags.spoiler:
        return _buildInlineSpoilerSpan(
          node: node,
          spoilerChildren: build(
            node.children ?? const [],
            style: effectiveStyle,
          ),
          effectiveStyle: effectiveStyle,
        );
      // Jumbo only changes size; emoji always render as images (issue #655).
      case FluxerMarkdownElementTags.emojiUnicode:
      case FluxerMarkdownElementTags.emojiCustom:
        return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: FluxerEmojiWidget(
            element: node,
            baseStyle: effectiveStyle,
            unicodeEmojiUrlBuilder: config.unicodeEmojiUrlBuilder,
            customEmojiUrlBuilder: config.customEmojiUrlBuilder,
            animateCustomEmoji: config.animateCustomEmoji,
            onEmojiLongPress: config.onEmojiLongPress,
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
    final bool applyMaskedGuards = !isAutolinkDisplayText(text, href);
    if (applyMaskedGuards &&
        (!hasVisibleMaskedLinkLabel(text) ||
            _hasApostropheInLinkAuthority(href) ||
            isEmailLikeMaskedLinkLabel(text) ||
            isSlashCommandLikeMaskedLinkLabel(text) ||
            isMisleadingMaskedLinkLabel(text, href) ||
            !isValidMaskedLinkUrl(href))) {
      return TextSpan(text: '[$text]($href)', style: style);
    }
    if (isAutolinkDisplayText(text, href)) {
      final widget = config.linkWidgetBuilder?.call(context, href, style);
      if (widget != null) {
        return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: widget,
        );
      }
    }
    final linkColor = config.linkColor ?? Theme.of(context).colorScheme.primary;
    final linkStyle = style.copyWith(
      color: linkColor,
      decoration: config.alwaysUnderlineLinks
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: linkColor,
    );
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
      void onTap() {
        unawaited(_handleLinkTap(href));
      }

      final FluxerMarkdownLinkRegistry? registry =
          FluxerMarkdownLinkRegistry.maybeOf(context);
      if (registry != null) {
        return TextSpan(
          text: span.text,
          style: span.style,
          mouseCursor: SystemMouseCursors.click,
          recognizer: registry.obtainRecognizer(onTap),
        );
      }
      return TextSpan(
        text: span.text,
        style: span.style,
        mouseCursor: SystemMouseCursors.click,
        recognizer: TapGestureRecognizer()..onTap = onTap,
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

  InlineSpan _buildCommandMention(md.Element element, TextStyle style) {
    final String command = element.textContent;
    final String? applicationId = element.attributes['id'];
    if (config.commandMentionBuilder != null && applicationId != null) {
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: config.commandMentionBuilder!(
          context,
          command,
          applicationId,
          style,
        ),
      );
    }
    final List<String> segments = command.split(' ');
    final String label = '/${segments.join(' ')}';
    return TextSpan(
      text: label,
      style: style.copyWith(fontWeight: FontWeight.w500),
    );
  }

  InlineSpan _buildGuildNavigationMention(md.Element element, TextStyle style) {
    final String navTypeRaw = element.textContent;
    final FluxerGuildNavigationType? navType = parseFluxerGuildNavigationType(
      navTypeRaw,
    );
    final String? navigationId = element.attributes['nav-id'];
    if (config.guildNavigationMentionBuilder != null && navType != null) {
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: config.guildNavigationMentionBuilder!(
          context,
          navType,
          navigationId,
          style,
        ),
      );
    }
    final String label = navigationId == null
        ? '<id:$navTypeRaw>'
        : '<id:$navTypeRaw:$navigationId>';
    return TextSpan(
      text: label,
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

  InlineSpan _buildInlineSpoilerSpan({
    required md.Element node,
    required List<InlineSpan> spoilerChildren,
    required TextStyle effectiveStyle,
  }) {
    final List<String> syncKeys = _collectSpoilerSyncKeys(
      node,
      config.spoilerSyncKeyNormalizer,
    );
    if (maxLines != null) {
      if (config.spoilersInitiallyRevealed) {
        return TextSpan(style: effectiveStyle, children: spoilerChildren);
      }
      return WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: _FluxerSpoilerSpan(
          initiallyRevealed: config.spoilersInitiallyRevealed,
          spoilerBackgroundColor: config.spoilerBackgroundColor,
          spoilerSyncController: config.spoilerSyncController,
          syncKeys: syncKeys,
          child: buildFluxerBoundedRichText(
            text: TextSpan(style: effectiveStyle, children: spoilerChildren),
            baseStyle: effectiveStyle,
            textScaler: MediaQuery.textScalerOf(context),
            maxLines: maxLines,
            overflow: overflow,
          ),
        ),
      );
    }

    final String spoilerId = _inlineSpoilerId(
      node,
      syncKeys,
      spoilerIndexCounter.next(),
    );
    final _FluxerSpoilerRevealScope? revealScope =
        _FluxerSpoilerRevealScope.maybeOf(context);
    final bool revealed =
        config.spoilersInitiallyRevealed ||
        (revealScope?.isRevealed(spoilerId, syncKeys) ?? false);
    if (revealed) {
      final double revealOpacity =
          revealScope?.revealOpacity(spoilerId, syncKeys) ?? 1.0;
      if (revealOpacity >= 1.0) {
        return TextSpan(style: effectiveStyle, children: spoilerChildren);
      }
      final Color hiddenBackground = _spoilerHiddenBackground(context, config);
      return TextSpan(
        style: effectiveStyle,
        children: _applySpoilerRevealOpacity(
          spoilerChildren,
          baseStyle: effectiveStyle,
          hiddenBackground: hiddenBackground,
          opacity: revealOpacity,
        ),
      );
    }

    final Color hiddenBackground = _spoilerHiddenBackground(context, config);
    final TextStyle hiddenStyle = _hiddenSpoilerTextStyle(
      effectiveStyle,
      hiddenBackground,
    );
    return TextSpan(
      style: hiddenStyle,
      mouseCursor: SystemMouseCursors.click,
      children: _concealSpoilerInlineSpans(
        spoilerChildren,
        hiddenStyle: hiddenStyle,
        hiddenBackground: hiddenBackground,
        baseStyle: effectiveStyle,
        obtainTapRecognizer: (VoidCallback onTap) =>
            _obtainSpoilerTapRecognizer(context, onTap),
        onTap: () => revealScope?.reveal(spoilerId, syncKeys),
      ),
    );
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
    if (node.tag == FluxerMarkdownElementTags.emojiUnicode ||
        node.tag == FluxerMarkdownElementTags.emojiCustom) {
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
    FluxerMarkdownElementTags.jumpLink ||
    FluxerMarkdownElementTags.mentionUser ||
    FluxerMarkdownElementTags.mentionChannel ||
    FluxerMarkdownElementTags.mentionRole ||
    FluxerMarkdownElementTags.mentionEveryone ||
    FluxerMarkdownElementTags.timestamp ||
    FluxerMarkdownElementTags.spoiler ||
    FluxerMarkdownElementTags.emojiUnicode ||
    FluxerMarkdownElementTags.emojiCustom => true,
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

class _SpoilerIndexCounter {
  int _next = 0;

  void reset() => _next = 0;

  int next() => _next++;
}

class _FluxerSpoilerRevealScope extends InheritedWidget {
  const _FluxerSpoilerRevealScope({
    required this.isRevealed,
    required this.reveal,
    required this.revealOpacity,
    required this.obtainRecognizer,
    required super.child,
  });

  final bool Function(String id, List<String> syncKeys) isRevealed;
  final void Function(String id, List<String> syncKeys) reveal;
  final double Function(String id, List<String> syncKeys) revealOpacity;
  final TapGestureRecognizer Function(VoidCallback onTap) obtainRecognizer;

  static _FluxerSpoilerRevealScope? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_FluxerSpoilerRevealScope>();
  }

  @override
  bool updateShouldNotify(covariant _FluxerSpoilerRevealScope oldWidget) {
    return true;
  }
}

class _FluxerSpoilerRevealHost extends StatefulWidget {
  const _FluxerSpoilerRevealHost({required this.config, required this.builder});

  final FluxerMarkdownConfig config;
  final Widget Function(BuildContext context) builder;

  @override
  State<_FluxerSpoilerRevealHost> createState() =>
      _FluxerSpoilerRevealHostState();
}

class _FluxerSpoilerRevealHostState extends State<_FluxerSpoilerRevealHost>
    with TickerProviderStateMixin {
  final Set<String> _localRevealedIds = <String>{};
  final Map<String, AnimationController> _fadeControllers =
      <String, AnimationController>{};
  List<TapGestureRecognizer> _recognizers = <TapGestureRecognizer>[];
  List<TapGestureRecognizer> _retiringRecognizers = <TapGestureRecognizer>[];

  @override
  void initState() {
    super.initState();
    widget.config.spoilerSyncController?.addListener(_handleSyncChanged);
  }

  @override
  void didUpdateWidget(covariant _FluxerSpoilerRevealHost oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config.spoilerSyncController !=
        widget.config.spoilerSyncController) {
      oldWidget.config.spoilerSyncController?.removeListener(
        _handleSyncChanged,
      );
      widget.config.spoilerSyncController?.addListener(_handleSyncChanged);
    }
  }

  @override
  void dispose() {
    widget.config.spoilerSyncController?.removeListener(_handleSyncChanged);
    for (final AnimationController controller in _fadeControllers.values) {
      controller.dispose();
    }
    _fadeControllers.clear();
    _disposeRecognizers(_recognizers);
    _disposeRecognizers(_retiringRecognizers);
    super.dispose();
  }

  void _disposeRecognizers(List<TapGestureRecognizer> recognizers) {
    for (final TapGestureRecognizer recognizer in recognizers) {
      recognizer.dispose();
    }
    recognizers.clear();
  }

  void _beginRecognizerRebuild() {
    _disposeRecognizers(_retiringRecognizers);
    _retiringRecognizers = _recognizers;
    _recognizers = <TapGestureRecognizer>[];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _disposeRecognizers(_retiringRecognizers);
    });
  }

  TapGestureRecognizer _obtainRecognizer(VoidCallback onTap) {
    final TapGestureRecognizer recognizer = TapGestureRecognizer()
      ..onTap = onTap;
    _recognizers.add(recognizer);
    return recognizer;
  }

  void _handleSyncChanged() {
    setState(() {});
  }

  bool _isRevealed(String id, List<String> syncKeys) {
    if (_localRevealedIds.contains(id)) {
      return true;
    }
    return widget.config.spoilerSyncController?.isRevealed(syncKeys) ?? false;
  }

  bool _revealedViaSync(String id, List<String> syncKeys) {
    return !_localRevealedIds.contains(id) &&
        (widget.config.spoilerSyncController?.isRevealed(syncKeys) ?? false);
  }

  double _revealOpacity(String id, List<String> syncKeys) {
    if (!_isRevealed(id, syncKeys)) {
      return 0;
    }
    if (_revealedViaSync(id, syncKeys)) {
      return 1;
    }
    return _fadeControllers[id]?.value ?? 1;
  }

  void _reveal(String id, List<String> syncKeys) {
    if (_isRevealed(id, syncKeys)) {
      return;
    }
    setState(() => _localRevealedIds.add(id));
    widget.config.spoilerSyncController?.reveal(syncKeys);
    final AnimationController controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() => setState(() {}));
    _fadeControllers[id] = controller;
    unawaited(
      controller.forward().then((_) {
        if (!mounted) {
          return;
        }
        controller.dispose();
        setState(() => _fadeControllers.remove(id));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    _beginRecognizerRebuild();
    return _FluxerSpoilerRevealScope(
      isRevealed: _isRevealed,
      reveal: _reveal,
      revealOpacity: _revealOpacity,
      obtainRecognizer: _obtainRecognizer,
      child: Builder(builder: widget.builder),
    );
  }
}

String _inlineSpoilerId(md.Element node, List<String> syncKeys, int index) {
  final String contentKey = syncKeys.isNotEmpty
      ? syncKeys.join('\u0000')
      : node.textContent;
  return '$index:$contentKey';
}

Color _spoilerHiddenBackground(
  BuildContext context,
  FluxerMarkdownConfig config,
) {
  return config.spoilerBackgroundColor ??
      Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2);
}

const Color _kHiddenSpoilerTextColor = Color(0x00000000);

Paint _spoilerBackgroundPaint(Color color) => Paint()..color = color;

TextStyle _hiddenSpoilerTextStyle(TextStyle base, Color hiddenBackground) {
  return base.copyWith(
    color: _kHiddenSpoilerTextColor,
    background: _spoilerBackgroundPaint(hiddenBackground),
    decoration: TextDecoration.none,
  );
}

TapGestureRecognizer _obtainSpoilerTapRecognizer(
  BuildContext context,
  VoidCallback onTap,
) {
  final FluxerMarkdownLinkRegistry? registry =
      FluxerMarkdownLinkRegistry.maybeOf(context);
  if (registry != null) {
    return registry.obtainRecognizer(onTap);
  }
  final _FluxerSpoilerRevealScope? scope = _FluxerSpoilerRevealScope.maybeOf(
    context,
  );
  if (scope != null) {
    return scope.obtainRecognizer(onTap);
  }
  return TapGestureRecognizer()..onTap = onTap;
}

double _concealedWidgetSpanSize(WidgetSpan span, TextStyle baseStyle) {
  final Widget child = span.child;
  if (child is FluxerEmojiWidget) {
    if (child.jumbo) {
      return kFluxerMarkdownEmojiSizeJumbo;
    }
    return (child.baseStyle.fontSize ?? 16) *
        kFluxerMarkdownEmojiSizeMultiplier;
  }
  return (baseStyle.fontSize ?? FluxerMarkupSpacing.rootFontSize) *
      (baseStyle.height ?? 1.2);
}

TextStyle _concealedSpoilerTextStyle(TextStyle? style, Color hiddenBackground) {
  return (style ?? const TextStyle()).copyWith(
    color: _kHiddenSpoilerTextColor,
    background: _spoilerBackgroundPaint(hiddenBackground),
    decoration: TextDecoration.none,
  );
}

List<InlineSpan> _concealSpoilerInlineSpans(
  List<InlineSpan> spans, {
  required TextStyle hiddenStyle,
  required Color hiddenBackground,
  required TextStyle baseStyle,
  required TapGestureRecognizer Function(VoidCallback onTap)
  obtainTapRecognizer,
  VoidCallback? onTap,
}) {
  return spans
      .map(
        (InlineSpan span) => _concealSpoilerInlineSpan(
          span,
          hiddenStyle: hiddenStyle,
          hiddenBackground: hiddenBackground,
          baseStyle: baseStyle,
          obtainTapRecognizer: obtainTapRecognizer,
          onTap: onTap,
        ),
      )
      .toList();
}

InlineSpan _concealSpoilerInlineSpan(
  InlineSpan span, {
  required TextStyle hiddenStyle,
  required Color hiddenBackground,
  required TextStyle baseStyle,
  required TapGestureRecognizer Function(VoidCallback onTap)
  obtainTapRecognizer,
  VoidCallback? onTap,
}) {
  if (span is TextSpan) {
    final List<InlineSpan>? children = span.children;
    if (children != null && children.isNotEmpty) {
      return TextSpan(
        style: _concealedSpoilerTextStyle(span.style, hiddenBackground),
        children: _concealSpoilerInlineSpans(
          children,
          hiddenStyle: hiddenStyle,
          hiddenBackground: hiddenBackground,
          baseStyle: baseStyle,
          obtainTapRecognizer: obtainTapRecognizer,
          onTap: onTap,
        ),
      );
    }
    return TextSpan(
      text: span.text,
      style: _concealedSpoilerTextStyle(span.style, hiddenBackground),
      mouseCursor: onTap == null ? null : SystemMouseCursors.click,
      recognizer: onTap == null ? null : obtainTapRecognizer(onTap),
    );
  }
  if (span is WidgetSpan) {
    final double size = _concealedWidgetSpanSize(span, baseStyle);
    return WidgetSpan(
      alignment: span.alignment,
      baseline: span.baseline,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          width: size,
          height: size,
          child: ColoredBox(color: hiddenBackground),
        ),
      ),
    );
  }
  return span;
}

List<InlineSpan> _applySpoilerRevealOpacity(
  List<InlineSpan> spans, {
  required TextStyle baseStyle,
  required Color hiddenBackground,
  required double opacity,
}) {
  return spans
      .map(
        (InlineSpan span) => _applySpoilerRevealOpacityToSpan(
          span,
          baseStyle: baseStyle,
          hiddenBackground: hiddenBackground,
          opacity: opacity,
        ),
      )
      .toList();
}

InlineSpan _applySpoilerRevealOpacityToSpan(
  InlineSpan span, {
  required TextStyle baseStyle,
  required Color hiddenBackground,
  required double opacity,
}) {
  if (span is TextSpan) {
    final TextStyle? style = span.style;
    final Color? targetColor = style?.color ?? baseStyle.color;
    final Color? fadedColor = targetColor == null
        ? null
        : Color.lerp(_kHiddenSpoilerTextColor, targetColor, opacity);
    final TextStyle fadedStyle = (style ?? baseStyle).copyWith(
      color: fadedColor,
      background: opacity < 1.0
          ? _spoilerBackgroundPaint(
              Color.lerp(hiddenBackground, const Color(0x00000000), opacity)!,
            )
          : null,
    );
    final List<InlineSpan>? children = span.children;
    if (children != null && children.isNotEmpty) {
      return TextSpan(
        style: fadedStyle,
        children: _applySpoilerRevealOpacity(
          children,
          baseStyle: baseStyle,
          hiddenBackground: hiddenBackground,
          opacity: opacity,
        ),
      );
    }
    return TextSpan(text: span.text, style: fadedStyle);
  }
  if (span is WidgetSpan) {
    return WidgetSpan(
      alignment: span.alignment,
      baseline: span.baseline,
      child: Opacity(opacity: opacity, child: span.child),
    );
  }
  return span;
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
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final Color hiddenBackground =
        widget.spoilerBackgroundColor ??
        Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2);
    return GestureDetector(
      onTap: _reveal,
      behavior: HitTestBehavior.opaque,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          children: [
            IgnorePointer(
              ignoring: !_isRevealed,
              child: FadeTransition(opacity: _opacity, child: widget.child),
            ),
            if (!_isRevealed)
              Positioned.fill(child: ColoredBox(color: hiddenBackground)),
          ],
        ),
      ),
    );
  }
}

bool _isLatexLanguage(String language) {
  return language == 'latex' || language == 'tex' || language == 'katex';
}

class FluxerCodeBlockWidget extends StatelessWidget {
  const FluxerCodeBlockWidget({
    required this.element,
    required this.isDark,
    required this.baseStyle,
    this.codeTextStyle,
    this.onCopyCode,
    super.key,
  });

  final md.Element element;
  final bool isDark;
  final TextStyle baseStyle;
  final TextStyle? codeTextStyle;
  final FluxerCodeCopyHandler? onCopyCode;

  static const _kPadding = EdgeInsets.all(FluxerMarkupSpacing.codePadding);
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
      if (!_isValidLatexContent(code)) {
        final TextStyle monoStyle = codeTextStyleFrom(
          baseStyle,
          codeTextStyle: codeTextStyle,
        );
        return _FluxerCodeBlockWithCopy(
          code: code,
          onCopyCode: onCopyCode,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: bgColor, borderRadius: _kRadius),
            padding: const EdgeInsets.all(FluxerMarkupSpacing.codePadding),
            child: Text(code, style: monoStyle),
          ),
        );
      }
      return _FluxerCodeBlockWithCopy(
        code: code,
        onCopyCode: onCopyCode,
        child: _FluxerLatexCodeBlockBody(
          code: code,
          baseStyle: baseStyle,
          codeTextStyle: codeTextStyle,
          bgColor: bgColor,
        ),
      );
    }

    if (rawLang == 'ansi') {
      final TextStyle monoStyle = codeTextStyleFrom(
        baseStyle,
        codeTextStyle: codeTextStyle,
      );
      return _FluxerCodeBlockWithCopy(
        code: code,
        onCopyCode: onCopyCode,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: bgColor, borderRadius: _kRadius),
          padding: _kPadding,
          child: buildFluxerBoundedRichText(
            text: TextSpan(
              style: monoStyle,
              children: parseAnsiTextSpans(code, monoStyle),
            ),
            baseStyle: monoStyle,
          ),
        ),
      );
    }

    final knownLang = kFluxerMarkdownLanguages.containsKey(rawLang)
        ? rawLang
        : null;
    if (knownLang == null && rawLang.isNotEmpty) {
      code = '$rawLang\n$code';
    }

    final TextStyle monoStyle = codeTextStyleFrom(
      baseStyle,
      codeTextStyle: codeTextStyle,
    );

    final Widget codeBody;
    if (knownLang == null) {
      codeBody = Container(
        width: double.infinity,
        decoration: BoxDecoration(color: bgColor, borderRadius: _kRadius),
        padding: _kPadding,
        child: Text(code, style: monoStyle),
      );
    } else {
      codeBody = FluxerHighlightedCode(
        code: code,
        language: knownLang,
        isDark: isDark,
        textStyle: monoStyle,
        backgroundColor: bgColor,
        padding: _kPadding,
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
    this.codeTextStyle,
  });

  final String code;
  final TextStyle baseStyle;
  final Color bgColor;
  final TextStyle? codeTextStyle;

  static const _kPadding = EdgeInsets.all(FluxerMarkupSpacing.codePadding);
  static const _kRadius = BorderRadius.all(Radius.circular(4));

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        baseStyle.color ?? Theme.of(context).colorScheme.onSurface;
    final TextStyle monoStyle = codeTextStyleFrom(
      baseStyle,
      codeTextStyle: codeTextStyle,
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

class FluxerEmojiWidget extends StatelessWidget {
  const FluxerEmojiWidget({
    required this.element,
    required this.baseStyle,
    required this.unicodeEmojiUrlBuilder,
    required this.customEmojiUrlBuilder,
    this.animateCustomEmoji = true,
    this.onEmojiLongPress,
    this.jumbo = false,
    super.key,
  });

  final md.Element element;
  final TextStyle baseStyle;
  final bool jumbo;
  final bool animateCustomEmoji;
  final FluxerUnicodeEmojiUrlBuilder unicodeEmojiUrlBuilder;
  final FluxerCustomEmojiUrlBuilder customEmojiUrlBuilder;
  final FluxerEmojiLongPressHandler? onEmojiLongPress;

  @override
  Widget build(BuildContext context) {
    final size = jumbo
        ? kFluxerMarkdownEmojiSizeJumbo
        : (baseStyle.fontSize ?? 16) * kFluxerMarkdownEmojiSizeMultiplier;
    final Widget emoji;
    if (element.tag == FluxerMarkdownElementTags.emojiCustom) {
      emoji = _buildCustom(context, size);
    } else {
      emoji = _buildUnicode(size);
    }
    return _wrapLongPress(context, emoji);
  }

  Widget _wrapLongPress(BuildContext context, Widget emoji) {
    final handler = onEmojiLongPress;
    if (handler == null) {
      return emoji;
    }

    final isCustom = element.tag == FluxerMarkdownElementTags.emojiCustom;
    final String name;
    final String? emojiId;
    final bool animated;
    if (isCustom) {
      name = element.textContent;
      emojiId = element.attributes['id'];
      animated = animateCustomEmoji && element.attributes['animated'] == 'true';
    } else {
      name = element.attributes['surrogate'] ?? element.textContent;
      emojiId = null;
      animated = false;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: () => handler(
        context,
        emojiId: emojiId,
        name: name,
        animated: animated,
        isCustom: isCustom,
      ),
      child: emoji,
    );
  }

  Widget _buildSystemUnicodeEmoji(String surrogate, double size) {
    return SystemEmojiFallback(emoji: surrogate, size: size);
  }

  Widget _buildUnicode(double size) {
    final surrogate = element.attributes['surrogate'] ?? element.textContent;
    final url = unicodeEmojiUrlBuilder(surrogate);
    final fallback = _buildSystemUnicodeEmoji(surrogate, size);
    if (url == null) {
      return fallback;
    }
    return CachedEmojiAssetImage(url: url, size: size, fallback: fallback);
  }

  Widget _buildCustom(BuildContext context, double size) {
    final id = element.attributes['id'] ?? '';
    final name = element.textContent;
    final animated =
        animateCustomEmoji && element.attributes['animated'] == 'true';
    final cdnSize = jumbo ? 240 : 96;
    final url = customEmojiUrlBuilder(
      id: id,
      animated: animated,
      size: cdnSize,
    );
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final px = (size * dpr).round();
    return SizedBox(
      width: size,
      height: size,
      child: CachedNetworkImage(
        imageUrl: url,
        cacheKey: 'emoji_${id}_${animated ? 'a' : 's'}_$cdnSize',
        width: size,
        height: size,
        // Cap one decode axis only. Capping both forces ResizeImagePolicy.exact,
        // which stretches non-square emoji into a square (issue #445).
        // Skip resize on animated frames; ResizeImage lags multi-frame decode.
        memCacheWidth: animated ? null : px,
        fadeInDuration: Duration.zero,
        fadeOutDuration: Duration.zero,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => Text(':$name:'),
      ),
    );
  }
}

String? _formatTimestampText(
  md.Element element, {
  required String localeName,
  FluxerTimestampFormatter? formatter,
}) {
  final unix = int.tryParse(element.textContent);
  if (unix == null) {
    return null;
  }

  final dt = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
  final flag = element.attributes['flag'] ?? 'f';
  if (formatter != null) {
    return formatter(dt, flag);
  }
  return switch (flag) {
    's' => DateFormat.yMd(localeName).add_Hm().format(dt),
    'S' => DateFormat.yMd(localeName).add_Hms().format(dt),
    't' => DateFormat.Hm(localeName).format(dt),
    'T' => DateFormat.Hms(localeName).format(dt),
    'd' => DateFormat.yMd(localeName).format(dt),
    'D' => DateFormat.yMMMMd(localeName).format(dt),
    'F' => DateFormat.yMMMMEEEEd(localeName).add_Hm().format(dt),
    'R' => DateFormat.yMMMd(localeName).add_Hm().format(dt),
    _ => DateFormat.yMMMMd(localeName).add_Hm().format(dt),
  };
}
