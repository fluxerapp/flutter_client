bool _isAsciiAlphanumeric(String char) {
  if (char.isEmpty) {
    return false;
  }
  final int codeUnit = char.codeUnitAt(0);
  return (codeUnit >= 0x30 && codeUnit <= 0x39) ||
      (codeUnit >= 0x41 && codeUnit <= 0x5A) ||
      (codeUnit >= 0x61 && codeUnit <= 0x7A);
}

bool _isWordDotEscape(String line, int backslashIndex) {
  if (backslashIndex + 1 >= line.length || line[backslashIndex + 1] != '.') {
    return false;
  }
  if (backslashIndex == 0) {
    return false;
  }
  final String previous = line[backslashIndex - 1];
  return _isAsciiAlphanumeric(previous) || previous == '.';
}

String unescapeFluxerMarkdownLine(String line) {
  final StringBuffer buffer = StringBuffer();
  var index = 0;
  while (index < line.length) {
    if (index + 1 < line.length && line[index] == r'\') {
      final String next = line[index + 1];
      if (next == '_' && index > 0 && line.codeUnitAt(index - 1) == 0xAF) {
        buffer
          ..write(r'\')
          ..write('_');
        index += 2;
        continue;
      }
      if (next == '.' && _isWordDotEscape(line, index)) {
        buffer.write('.');
        index += 2;
        continue;
      }
    }
    buffer.write(line[index]);
    index++;
  }
  return buffer.toString();
}

String unescapeFluxerMarkdownText(String text) {
  final List<String> lines = text.split('\n');
  return lines.map(unescapeFluxerMarkdownLine).join('\n');
}
