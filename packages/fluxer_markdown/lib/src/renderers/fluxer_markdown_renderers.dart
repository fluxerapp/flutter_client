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
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
import 'package:fluxer_markdown/src/utils/highlight_languages.dart';
import 'package:fluxer_markdown/src/utils/jumbo_emoji.dart';
import 'package:intl/intl.dart';
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

Widget buildFluxerMarkdownTextFlow({
  required BuildContext context,
  required String text,
  required TextStyle baseStyle,
  required FluxerMarkdownConfig config,
  required FluxerMarkdownFeatures features,
  required md.Document inlineDocument,
  required bool selectable,
  required bool isDark,
  int? maxLines,
  TextOverflow? overflow,
}) {
  if (text.isEmpty) {
    return const SizedBox.shrink();
  }
  final lines = text.split('\n');
  final spans = <InlineSpan>[];
  for (var i = 0; i < lines.length; i++) {
    if (i > 0) {
      spans.add(TextSpan(text: '\n', style: baseStyle));
    }
    final lineNodes = _inlineNodeCache.resolve((
      lines[i],
      features,
    ), () => inlineDocument.parseInline(lines[i]));
    if (lineNodes.isEmpty) {
      continue;
    }
    final lineSpans = _MarkdownInlineRenderer(
      context: context,
      baseStyle: baseStyle,
      config: config,
      features: features,
      isDark: isDark,
      jumbo: features.allowJumboEmoji && _allNodesAreEmoji(lineNodes),
    ).build(lineNodes);
    spans.addAll(lineSpans);
  }
  if (spans.isEmpty) {
    return const SizedBox.shrink();
  }
  final body = RichText(
    text: TextSpan(style: baseStyle, children: spans),
    textScaler: MediaQuery.textScalerOf(context),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.clip,
    textWidthBasis: maxLines != null
        ? TextWidthBasis.parent
        : TextWidthBasis.longestLine,
  );
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
          style: baseStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
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
      jumbo: features.allowJumboEmoji && _allNodesAreEmoji(nodes),
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

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: borderColor, width: 4)),
      ),
      child: DefaultTextStyle.merge(
        style: textColor == null
            ? const TextStyle()
            : TextStyle(color: textColor),
        child: build(node.children ?? const []),
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

    for (final child in children) {
      if (child is md.Element &&
          (child.tag == 'ul' ||
              child.tag == 'ol' ||
              child.tag == 'blockquote')) {
        final nested = buildBlock(child);
        if (nested != null) {
          nestedBlocks.add(nested);
        }
        continue;
      }

      if (child is md.Element && child.tag == 'p') {
        content.add(_buildParagraph(child.children ?? const []));
        continue;
      }

      final block = buildBlock(child);
      if (block != null) {
        content.add(block);
      }
    }

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
        return WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: FluxerTimestampWidget(
            element: node,
            baseStyle: effectiveStyle,
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
    final linkColor = config.linkColor ?? Theme.of(context).colorScheme.primary;
    final widget = config.linkWidgetBuilder?.call(context, href, style);

    if (widget != null) {
      return WidgetSpan(alignment: PlaceholderAlignment.middle, child: widget);
    }

    return TextSpan(
      text: text,
      style: style.copyWith(color: linkColor, decoration: TextDecoration.none),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          unawaited(_handleLinkTap(href));
        },
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

bool _allNodesAreEmoji(List<md.Node> nodes) {
  var hasEmoji = false;
  var emojiCount = 0;

  for (final node in nodes) {
    if (node is md.Text) {
      if (node.text.trim().isNotEmpty) {
        return false;
      }
      continue;
    }

    if (node is! md.Element) {
      return false;
    }

    if (node.tag == FluxerUnicodeEmojiToneSyntax.tag ||
        node.tag == FluxerCustomEmojiSyntax.tag) {
      hasEmoji = true;
      emojiCount++;
      continue;
    }

    return false;
  }

  return hasEmoji && emojiCount <= kFluxerMarkdownJumboMaxCount;
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
            FadeTransition(opacity: _opacity, child: widget.child),
            Positioned.fill(
              child: IgnorePointer(
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

class FluxerCodeBlockWidget extends StatelessWidget {
  const FluxerCodeBlockWidget({
    required this.element,
    required this.isDark,
    required this.baseStyle,
    super.key,
  });

  final md.Element element;
  final bool isDark;
  final TextStyle baseStyle;

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

    final knownLang = kFluxerMarkdownLanguages.containsKey(rawLang)
        ? rawLang
        : null;
    if (knownLang == null && rawLang.isNotEmpty) {
      code = '$rawLang\n$code';
    }

    final bgColor = isDark
        ? (vs2015Theme['root']?.backgroundColor ??
              Theme.of(context).colorScheme.surfaceContainerHighest)
        : (githubTheme['root']?.backgroundColor ??
              Theme.of(context).colorScheme.surfaceContainerHighest);

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
        theme: isDark ? vs2015Theme : githubTheme,
        padding: _kPadding,
        textStyle: baseStyle.copyWith(
          fontFamily: 'monospace',
          fontSize: (baseStyle.fontSize ?? 16) * 0.85,
        ),
      );
    }

    return _FluxerCodeBlockWithCopy(code: code, child: codeBody);
  }
}

class _FluxerCodeBlockWithCopy extends StatelessWidget {
  const _FluxerCodeBlockWithCopy({required this.code, required this.child});

  final String code;
  final Widget child;

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
                onTap: () {
                  unawaited(Clipboard.setData(ClipboardData(text: code)));
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
        : (baseStyle.fontSize ?? 16) * 1.375;
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
        memCacheWidth: px,
        memCacheHeight: px,
        errorBuilder: (_, _, _) => Text(':$name:'),
      ),
    );
  }
}

class FluxerTimestampWidget extends StatelessWidget {
  const FluxerTimestampWidget({
    required this.element,
    required this.baseStyle,
    super.key,
  });

  final md.Element element;
  final TextStyle baseStyle;

  @override
  Widget build(BuildContext context) {
    final unix = int.tryParse(element.textContent);
    if (unix == null) {
      return const SizedBox.shrink();
    }

    final dt = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
    final flag = element.attributes['flag'] ?? 'f';
    final text = switch (flag) {
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

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(3),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Text(text, style: baseStyle),
    );
  }
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
