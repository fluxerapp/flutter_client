import 'dart:async';
import 'dart:isolate';

import 'package:flutter/widgets.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';
import 'package:fluxer_markdown/src/utils/bounded_text.dart';
import 'package:fluxer_markdown/src/utils/code_block_highlight_theme.dart';
import 'package:fluxer_markdown/src/utils/highlight_languages.dart';
import 'package:highlight/highlight.dart' show Node, highlight;

final MarkdownParseCache<(String, String, bool), List<TextSpan>>
_highlightSpanCache =
    MarkdownParseCache<(String, String, bool), List<TextSpan>>();

const int kHighlightSpanCacheMaxCodeLength = 8192;

const int kBackgroundHighlightCacheMaxEntries = 16;

final MarkdownParseCache<(String, String), BackgroundCodeHighlight>
_backgroundHighlightCache =
    MarkdownParseCache<(String, String), BackgroundCodeHighlight>(
      maxEntries: kBackgroundHighlightCacheMaxEntries,
    );

void clearHighlightSpanCache() {
  _highlightSpanCache.clear();
  _backgroundHighlightCache.clear();
}

String normalizeHighlightedCode(String code) {
  return code.replaceAll('\t', '        ');
}

bool shouldHighlightInBackground(String normalizedCode) {
  return normalizedCode.length > kHighlightSpanCacheMaxCodeLength;
}

List<TextSpan> highlightedCodeSpans({
  required String code,
  required String language,
  required bool isDark,
}) {
  ensureFluxerMarkdownLanguagesRegistered();
  final String normalized = normalizeHighlightedCode(code);
  if (shouldHighlightInBackground(normalized)) {
    return _computeHighlightedSpans(normalized, language, isDark);
  }
  return _highlightSpanCache.resolve((
    normalized,
    language,
    isDark,
  ), () => _computeHighlightedSpans(normalized, language, isDark));
}

BackgroundCodeHighlight backgroundCodeHighlight({
  required String code,
  required String language,
}) {
  final String normalized = normalizeHighlightedCode(code);
  return _backgroundHighlightCache.resolve((
    normalized,
    language,
  ), () => BackgroundCodeHighlight._(normalized, language));
}

final class BackgroundCodeHighlight {
  BackgroundCodeHighlight._(this.code, this.language) {
    done = _parseInBackground(code, language).then((List<Node>? nodes) {
      _nodes = nodes;
      _isComplete = true;
    });
  }

  final String code;
  final String language;
  late final Future<void> done;
  List<Node>? _nodes;
  bool _isComplete = false;

  bool get isComplete => _isComplete;

  List<TextSpan>? spans(TextStyle? Function(String className) styleFor) {
    final List<Node>? nodes = _nodes;
    if (nodes == null || nodes.isEmpty) {
      return null;
    }
    return highlightNodesToSpans(nodes, styleFor);
  }

  List<TextSpan>? colorSpans({required bool isDark}) {
    final Map<String, TextStyle> theme = _colorThemeFor(isDark);
    return spans((String className) => _tokenColorStyle(theme, className));
  }
}

Future<List<Node>?> _parseInBackground(String normalized, String language) {
  return Isolate.run(
    () => _parseHighlightNodes(normalized, language),
  ).catchError((Object _) => null);
}

List<Node>? _parseHighlightNodes(String normalized, String language) {
  ensureFluxerMarkdownLanguagesRegistered();
  return highlight.parse(normalized, language: language).nodes;
}

Map<String, TextStyle> _colorThemeFor(bool isDark) {
  return isDark
      ? kVs2015CodeBlockHighlightTheme
      : kGithubCodeBlockHighlightTheme;
}

List<TextSpan> _computeHighlightedSpans(
  String normalized,
  String language,
  bool isDark,
) {
  final Map<String, TextStyle> theme = _colorThemeFor(isDark);
  final List<Node>? nodes = _parseHighlightNodes(normalized, language);
  if (nodes == null || nodes.isEmpty) {
    return <TextSpan>[TextSpan(text: normalized)];
  }
  return highlightNodesToSpans(
    nodes,
    (String className) => _tokenColorStyle(theme, className),
  );
}

List<TextSpan> highlightNodesToSpans(
  List<Node> nodes,
  TextStyle? Function(String className) styleFor,
) {
  final List<TextSpan> spans = <TextSpan>[];
  var currentSpans = spans;
  final List<List<TextSpan>> stack = <List<TextSpan>>[];

  TextStyle? styleOf(Node node) {
    final String? className = node.className;
    return className == null ? null : styleFor(className);
  }

  void traverse(Node node) {
    if (node.value != null) {
      currentSpans.add(TextSpan(text: node.value, style: styleOf(node)));
      return;
    }
    final List<Node>? children = node.children;
    if (children == null) {
      return;
    }
    final List<TextSpan> nested = <TextSpan>[];
    currentSpans.add(TextSpan(children: nested, style: styleOf(node)));
    stack.add(currentSpans);
    currentSpans = nested;
    for (var i = 0; i < children.length; i++) {
      traverse(children[i]);
      if (i == children.length - 1) {
        currentSpans = stack.isEmpty ? spans : stack.removeLast();
      }
    }
  }

  for (final Node node in nodes) {
    traverse(node);
  }
  return spans;
}

TextStyle? _tokenColorStyle(Map<String, TextStyle> theme, String className) {
  final TextStyle? themeStyle = theme[className];
  if (themeStyle == null) {
    return null;
  }
  return TextStyle(
    color: themeStyle.color,
    backgroundColor: themeStyle.backgroundColor,
  );
}

class FluxerHighlightedCode extends StatefulWidget {
  const FluxerHighlightedCode({
    required this.code,
    required this.language,
    required this.isDark,
    required this.textStyle,
    required this.backgroundColor,
    required this.padding,
    super.key,
  });

  final String code;
  final String language;
  final bool isDark;
  final TextStyle textStyle;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  @override
  State<FluxerHighlightedCode> createState() => _FluxerHighlightedCodeState();
}

class _FluxerHighlightedCodeState extends State<FluxerHighlightedCode> {
  BackgroundCodeHighlight? _background;
  List<TextSpan>? _backgroundSpans;
  bool? _backgroundSpansDark;

  @override
  void initState() {
    super.initState();
    _syncBackgroundHighlight();
  }

  @override
  void didUpdateWidget(FluxerHighlightedCode oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.code != widget.code ||
        oldWidget.language != widget.language) {
      _syncBackgroundHighlight();
    }
  }

  void _syncBackgroundHighlight() {
    final String normalized = normalizeHighlightedCode(widget.code);
    if (!shouldHighlightInBackground(normalized)) {
      _resetBackground(null);
      return;
    }
    final BackgroundCodeHighlight background = backgroundCodeHighlight(
      code: widget.code,
      language: widget.language,
    );
    if (identical(background, _background)) {
      return;
    }
    _resetBackground(background);
    if (background.isComplete) {
      return;
    }
    unawaited(
      background.done.then((_) {
        if (!mounted || !identical(_background, background)) {
          return;
        }
        setState(() {});
      }),
    );
  }

  void _resetBackground(BackgroundCodeHighlight? background) {
    _background = background;
    _backgroundSpans = null;
    _backgroundSpansDark = null;
  }

  List<TextSpan> _resolveSpans() {
    final BackgroundCodeHighlight? background = _background;
    if (background == null) {
      return highlightedCodeSpans(
        code: widget.code,
        language: widget.language,
        isDark: widget.isDark,
      );
    }
    if (!background.isComplete) {
      return <TextSpan>[TextSpan(text: background.code)];
    }
    if (_backgroundSpans == null || _backgroundSpansDark != widget.isDark) {
      _backgroundSpans =
          background.colorSpans(isDark: widget.isDark) ??
          <TextSpan>[TextSpan(text: background.code)];
      _backgroundSpansDark = widget.isDark;
    }
    return _backgroundSpans!;
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: widget.backgroundColor,
      child: Padding(
        padding: widget.padding,
        child: buildFluxerBoundedRichText(
          text: TextSpan(style: widget.textStyle, children: _resolveSpans()),
          baseStyle: widget.textStyle,
        ),
      ),
    );
  }
}
