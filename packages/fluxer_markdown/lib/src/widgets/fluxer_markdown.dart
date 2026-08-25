import 'package:flutter/gestures.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/fluxer_block_document.dart';
import 'package:fluxer_markdown/src/parsing/fluxer_inline_syntaxes.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';
import 'package:fluxer_markdown/src/parsing/message_line_parser.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/utils/bounded_text.dart';
import 'package:fluxer_markdown/src/utils/highlight_languages.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown_link_registry.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:material_ui/material_ui.dart';

final MarkdownParseCache<(String, FluxerMarkdownFeatures), List<md.Node>>
_blockNodeCache =
    MarkdownParseCache<(String, FluxerMarkdownFeatures), List<md.Node>>();

class FluxerMarkdown extends StatefulWidget {
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
  State<FluxerMarkdown> createState() => _FluxerMarkdownState();
}

class _FluxerMarkdownState extends State<FluxerMarkdown> {
  static final DateTime _timestampLayoutProbe = DateTime.utc(2020, 1, 2, 15, 4);

  List<TapGestureRecognizer> _linkRecognizers = <TapGestureRecognizer>[];
  List<TapGestureRecognizer> _retiringRecognizers = <TapGestureRecognizer>[];

  Widget? _cachedBody;
  Object? _cacheKey;

  @override
  void dispose() {
    _disposeRecognizers(_linkRecognizers);
    _disposeRecognizers(_retiringRecognizers);
    super.dispose();
  }

  void _disposeRecognizers(List<TapGestureRecognizer> recognizers) {
    for (final TapGestureRecognizer recognizer in recognizers) {
      recognizer.dispose();
    }
    recognizers.clear();
  }

  void _beginBodyRebuild() {
    _disposeRecognizers(_retiringRecognizers);
    _retiringRecognizers = _linkRecognizers;
    _linkRecognizers = <TapGestureRecognizer>[];
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
    _linkRecognizers.add(recognizer);
    return recognizer;
  }

  String? _timestampLayoutToken() {
    final FluxerTimestampFormatter? formatter =
        widget.config.timestampFormatter;
    if (formatter == null) {
      return null;
    }
    return formatter(_timestampLayoutProbe, 't');
  }

  Object _layoutCacheKey({
    required BuildContext context,
    required TextStyle style,
    required bool isDark,
    required TextScaler textScaler,
  }) {
    return (
      widget.data,
      widget.context,
      widget.selectable,
      widget.maxLines,
      widget.overflow,
      widget.parseCacheKey,
      widget.trailingInlineWidget,
      widget.baseStyle,
      style,
      isDark,
      textScaler,
      MediaQuery.maybeOf(context)?.boldText ?? false,
      Directionality.maybeOf(context),
      Localizations.maybeLocaleOf(context),
      _timestampLayoutToken(),
      widget.config.layoutCacheKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    ensureFluxerMarkdownLanguagesRegistered();
    return FluxerMarkdownLinkRegistry(
      obtainRecognizer: _obtainRecognizer,
      child: Builder(
        builder: (BuildContext registryContext) {
          final ThemeData theme = Theme.of(registryContext);
          final TextStyle style =
              widget.baseStyle ?? DefaultTextStyle.of(registryContext).style;
          final bool isDark = theme.brightness == Brightness.dark;
          final TextScaler textScaler = MediaQuery.textScalerOf(
            registryContext,
          );
          final Object cacheKey = _layoutCacheKey(
            context: registryContext,
            style: style,
            isDark: isDark,
            textScaler: textScaler,
          );
          if (_cachedBody != null && _cacheKey == cacheKey) {
            return _cachedBody!;
          }
          _beginBodyRebuild();
          _cacheKey = cacheKey;
          _cachedBody = _buildBody(
            context: registryContext,
            theme: theme,
            style: style,
            isDark: isDark,
          );
          return _cachedBody!;
        },
      ),
    );
  }

  Widget _buildBody({
    required BuildContext context,
    required ThemeData theme,
    required TextStyle style,
    required bool isDark,
  }) {
    final FluxerMarkdownFeatures features = FluxerMarkdownFeatures.forContext(
      widget.context,
    );
    final String processedText = preprocessFluxerMarkdown(
      widget.data,
      features,
    );
    final List<FluxerMarkdownSegment> segments = parseFluxerMarkdownSegments(
      processedText,
      features,
    );

    if (features.isRestrictedInlinePreview && segments.length > 1) {
      return _buildRestrictedInlinePreviewFromSegments(
        context: context,
        segments: segments,
        style: style,
        isDark: isDark,
        features: features,
      );
    }

    if (segments.length == 1 && segments.first is FluxerTextSegment) {
      return _buildAstMarkdown(
        context: context,
        text: (segments.first as FluxerTextSegment).text,
        style: style,
        isDark: isDark,
        features: features,
        trailingInlineWidget: widget.trailingInlineWidget,
      );
    }

    final List<Widget> segmentWidgets = <Widget>[];
    for (var i = 0; i < segments.length; i++) {
      final FluxerMarkdownSegment segment = segments[i];
      final bool isLastSegment = i == segments.length - 1;
      final Widget? segmentTrailing =
          isLastSegment && segment is FluxerTextSegment
          ? widget.trailingInlineWidget
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
          style: features.isRestrictedInlinePreview
              ? style
              : style.copyWith(
                  fontSize: (style.fontSize ?? 16) * 0.8125,
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.375,
                ),
          isDark: isDark,
          features: features,
          allowJumboEmoji: false,
        ),
        FluxerAlertSegment(:final type, :final body) =>
          (widget.config.alertBuilder ?? defaultFluxerAlertBuilder)(
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
          config: widget.config,
          features: features,
          inlineDocument: _createInlineDocument(features),
          selectable: widget.selectable,
          isDark: isDark,
          parseCacheKey: widget.parseCacheKey,
        ),
      });
    }

    if (widget.trailingInlineWidget != null &&
        segments.last is! FluxerTextSegment) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...segmentWidgets, widget.trailingInlineWidget!],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: segmentWidgets,
    );
  }

  Widget _buildRestrictedInlinePreviewFromSegments({
    required BuildContext context,
    required List<FluxerMarkdownSegment> segments,
    required TextStyle style,
    required bool isDark,
    required FluxerMarkdownFeatures features,
  }) {
    final List<InlineSpan> spans = <InlineSpan>[];
    var needsSeparator = false;
    for (final FluxerMarkdownSegment segment in segments) {
      final List<InlineSpan> segmentSpans = switch (segment) {
        FluxerTextSegment(:final text) => _restrictedInlinePreviewSpansForText(
          context: context,
          text: text,
          style: style,
          isDark: isDark,
          features: features,
        ),
        FluxerSubtextSegment(:final text) =>
          _restrictedInlinePreviewSpansForText(
            context: context,
            text: text,
            style: style,
            isDark: isDark,
            features: features,
          ),
        FluxerBlockSpoilerSegment(:final text) => [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: buildFluxerBlockSpoiler(
              context: context,
              text: text,
              baseStyle: style,
              config: widget.config,
              features: features,
              inlineDocument: _createInlineDocument(features),
              selectable: widget.selectable,
              isDark: isDark,
              parseCacheKey: widget.parseCacheKey,
            ),
          ),
        ],
        FluxerAlertSegment() => const <InlineSpan>[],
      };
      if (segmentSpans.isEmpty) {
        continue;
      }
      if (needsSeparator && spans.isNotEmpty) {
        spans.add(TextSpan(text: ' ', style: style));
      }
      spans.addAll(segmentSpans);
      needsSeparator = true;
    }

    if (spans.isEmpty) {
      return const SizedBox.shrink();
    }

    return buildFluxerBoundedRichText(
      text: TextSpan(style: style, children: spans),
      baseStyle: style,
      textScaler: MediaQuery.textScalerOf(context),
      maxLines: widget.maxLines,
      overflow: widget.overflow,
    );
  }

  List<InlineSpan> _restrictedInlinePreviewSpansForText({
    required BuildContext context,
    required String text,
    required TextStyle style,
    required bool isDark,
    required FluxerMarkdownFeatures features,
  }) {
    final md.Document document = _createBlockDocument(features);
    final String normalizedText = normalizeBlockquoteBarMarkdown(text);
    final List<md.Node> nodes = _blockNodeCache.resolve((
      markdownParseCacheKey(normalizedText, widget.parseCacheKey),
      features,
    ), () => document.parse(normalizedText));
    return collectRestrictedInlinePreviewSpans(
      context: context,
      nodes: nodes,
      baseStyle: style,
      config: widget.config,
      features: features,
      isDark: isDark,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
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
    if (usesMessageLineParsing(widget.context)) {
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
    final List<MessageContentSegment> contentSegments =
        parseMessageContentStructure(text, features);
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
        config: widget.config,
        features: features,
        inlineDocument: _createInlineDocument(features),
        selectable: widget.selectable,
        isDark: isDark,
        parseCacheKey: widget.parseCacheKey,
        maxLines: widget.maxLines,
        overflow: widget.overflow,
        trailingInlineWidget: trailingInlineWidget,
        allowJumboEmoji: allowJumboEmoji,
      );
    }
    final List<Widget> children = <Widget>[];
    final FluxerMarkdownBlockRenderState renderState =
        FluxerMarkdownBlockRenderState();
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
          config: widget.config,
          features: features,
          inlineDocument: _createInlineDocument(features),
          selectable: widget.selectable,
          isDark: isDark,
          parseCacheKey: widget.parseCacheKey,
          maxLines: widget.maxLines,
          overflow: widget.overflow,
          trailingInlineWidget: segmentTrailing,
          allowJumboEmoji: allowJumboEmoji,
        ),
        MessageBlockMarkdownSegment(:final text) => _buildBlockMarkdown(
          context: context,
          text: text,
          style: style,
          isDark: isDark,
          features: features,
          renderState: renderState,
        ),
        MessageBlockSpoilerSegment(:final text) => buildFluxerBlockSpoiler(
          context: context,
          text: text,
          baseStyle: style,
          config: widget.config,
          features: features,
          inlineDocument: _createInlineDocument(features),
          selectable: widget.selectable,
          isDark: isDark,
          parseCacheKey: widget.parseCacheKey,
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
    FluxerMarkdownBlockRenderState? renderState,
  }) {
    final md.Document document = _createBlockDocument(features);
    final String normalizedText = normalizeBlockquoteBarMarkdown(text);
    final List<md.Node> nodes = _blockNodeCache.resolve((
      markdownParseCacheKey(normalizedText, widget.parseCacheKey),
      features,
    ), () => document.parse(normalizedText));
    return buildFluxerMarkdownAst(
      context: context,
      nodes: nodes,
      baseStyle: style,
      config: widget.config,
      features: features,
      selectable: widget.selectable,
      isDark: isDark,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      renderState: renderState,
    );
  }

  md.Document _createInlineDocument(FluxerMarkdownFeatures features) {
    return md.Document(
      encodeHtml: false,
      withDefaultBlockSyntaxes: false,
      withDefaultInlineSyntaxes: false,
      blockSyntaxes: const [],
      inlineSyntaxes: _inlineSyntaxes(features),
    );
  }

  md.Document _createBlockDocument(FluxerMarkdownFeatures features) {
    return createFluxerBlockDocument(
      features: features,
      inlineSyntaxes: _inlineSyntaxes(features),
    );
  }

  List<md.InlineSyntax> _inlineSyntaxes(FluxerMarkdownFeatures features) {
    return fluxerInlineSyntaxes(
      features: features,
      resolveEmojiShortcode: widget.config.resolveEmojiShortcode,
      internalLinkPattern: widget.config.internalLinkPattern,
      includeJumpLinks: widget.config.linkWidgetBuilder != null,
      unicodeEmojiPattern: widget.config.unicodeEmojiPattern,
    );
  }
}
