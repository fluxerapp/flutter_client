import 'package:flutter/gestures.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/utils/highlight_languages.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown_link_registry.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:material_ui/material_ui.dart';

/// Produces the markdown AST for [FluxerMarkdown]; the app supplies the
/// canonical native parser. MUST be a stable function reference; a fresh
/// closure per build defeats the layout cache.
typedef FluxerMarkdownAstParser =
    List<md.Node> Function(String data, FluxerMarkdownFeatures features);

final MarkdownParseCache<(String, FluxerMarkdownFeatures), List<md.Node>>
_astNodeCache =
    MarkdownParseCache<(String, FluxerMarkdownFeatures), List<md.Node>>();

class FluxerMarkdown extends StatefulWidget {
  const FluxerMarkdown({
    required this.data,
    required this.config,
    required this.astParser,
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
  final FluxerMarkdownAstParser astParser;
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
      widget.astParser,
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
    required TextStyle style,
    required bool isDark,
  }) {
    final FluxerMarkdownFeatures features = FluxerMarkdownFeatures.forContext(
      widget.context,
    );
    final List<md.Node> nodes = _astNodeCache.resolve((
      markdownParseCacheKey(widget.data, widget.parseCacheKey),
      features,
    ), () => widget.astParser(widget.data, features));
    return buildFluxerMarkdownProvidedAst(
      context: context,
      nodes: nodes,
      baseStyle: style,
      config: widget.config,
      features: features,
      selectable: widget.selectable,
      isDark: isDark,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      trailingInlineWidget: widget.trailingInlineWidget,
    );
  }
}
