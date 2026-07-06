import 'package:flutter/material.dart';

const Map<int, Color> kAnsiForegroundColors = <int, Color>{
  30: Color(0xFF1E1E1E),
  31: Color(0xFFF44747),
  32: Color(0xFF6A9955),
  33: Color(0xFFD7BA7D),
  34: Color(0xFF569CD6),
  35: Color(0xFFC586C0),
  36: Color(0xFF4EC9B0),
  37: Color(0xFFD4D4D4),
  90: Color(0xFF808080),
  91: Color(0xFFF44747),
  92: Color(0xFF6A9955),
  93: Color(0xFFD7BA7D),
  94: Color(0xFF569CD6),
  95: Color(0xFFC586C0),
  96: Color(0xFF4EC9B0),
  97: Color(0xFFFFFFFF),
};

final RegExp _ansiEscapePattern = RegExp(
  r'(?:\x1B\[|\u241B\[|\u009b)([0-9;:]*)m',
);

List<InlineSpan> parseAnsiTextSpans(String text, TextStyle baseStyle) {
  final List<InlineSpan> spans = <InlineSpan>[];
  var currentStyle = baseStyle;
  var start = 0;
  for (final RegExpMatch match in _ansiEscapePattern.allMatches(text)) {
    if (match.start > start) {
      spans.add(
        TextSpan(text: text.substring(start, match.start), style: currentStyle),
      );
    }
    currentStyle = _applyAnsiCodes(
      match.group(1) ?? '',
      baseStyle,
      currentStyle,
    );
    start = match.end;
  }
  if (start < text.length) {
    spans.add(TextSpan(text: text.substring(start), style: currentStyle));
  }
  return spans;
}

TextStyle _applyAnsiCodes(
  String codes,
  TextStyle baseStyle,
  TextStyle currentStyle,
) {
  if (codes.isEmpty || codes == '0') {
    return baseStyle;
  }
  var style = currentStyle;
  for (final String part in codes.split(';')) {
    if (part.isEmpty) {
      continue;
    }
    final int? code = int.tryParse(part);
    if (code == null) {
      continue;
    }
    if (code == 0) {
      style = baseStyle;
      continue;
    }
    final Color? color = kAnsiForegroundColors[code];
    if (color != null) {
      style = style.copyWith(color: color);
    }
  }
  return style;
}
