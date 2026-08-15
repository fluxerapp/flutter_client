import 'package:flutter/widgets.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';
import 'package:fluxer_markdown/src/utils/code_block_highlight_theme.dart';
import 'package:fluxer_markdown/src/utils/highlight_languages.dart';
import 'package:highlight/highlight.dart' show Node, highlight;

final MarkdownParseCache<(String, String, bool), List<TextSpan>>
_highlightSpanCache =
    MarkdownParseCache<(String, String, bool), List<TextSpan>>();

String normalizeHighlightedCode(String code) {
  return code.replaceAll('\t', '        ');
}

List<TextSpan> highlightedCodeSpans({
  required String code,
  required String language,
  required bool isDark,
}) {
  ensureFluxerMarkdownLanguagesRegistered();
  final String normalized = normalizeHighlightedCode(code);
  return _highlightSpanCache.resolve((normalized, language, isDark), () {
    final Map<String, TextStyle> theme = isDark
        ? kVs2015CodeBlockHighlightTheme
        : kGithubCodeBlockHighlightTheme;
    final List<Node>? nodes = highlight
        .parse(normalized, language: language)
        .nodes;
    if (nodes == null || nodes.isEmpty) {
      return <TextSpan>[TextSpan(text: normalized)];
    }
    return _nodesToColorSpans(nodes, theme);
  });
}

List<TextSpan> _nodesToColorSpans(
  List<Node> nodes,
  Map<String, TextStyle> theme,
) {
  final List<TextSpan> spans = <TextSpan>[];
  var currentSpans = spans;
  final List<List<TextSpan>> stack = <List<TextSpan>>[];

  void traverse(Node node) {
    if (node.value != null) {
      currentSpans.add(
        node.className == null
            ? TextSpan(text: node.value)
            : TextSpan(text: node.value, style: _tokenColorStyle(theme, node)),
      );
      return;
    }
    final List<Node>? children = node.children;
    if (children == null) {
      return;
    }
    final List<TextSpan> nested = <TextSpan>[];
    currentSpans.add(
      TextSpan(children: nested, style: _tokenColorStyle(theme, node)),
    );
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

TextStyle? _tokenColorStyle(Map<String, TextStyle> theme, Node node) {
  final String? className = node.className;
  if (className == null) {
    return null;
  }
  final TextStyle? themeStyle = theme[className];
  if (themeStyle == null) {
    return null;
  }
  return TextStyle(
    color: themeStyle.color,
    backgroundColor: themeStyle.backgroundColor,
  );
}

class FluxerHighlightedCode extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: Padding(
        padding: padding,
        child: RichText(
          text: TextSpan(
            style: textStyle,
            children: highlightedCodeSpans(
              code: code,
              language: language,
              isDark: isDark,
            ),
          ),
        ),
      ),
    );
  }
}
