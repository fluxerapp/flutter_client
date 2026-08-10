const List<String> kInlineParseChunkDelimiters = <String>[
  '~~',
  '||',
  '**',
  '__',
];

bool hasUnclosedInlineParseDelimiters(String text) {
  for (final String delimiter in kInlineParseChunkDelimiters) {
    if (_countUnescapedDelimiters(text, delimiter).isOdd) {
      return true;
    }
  }
  return false;
}

List<String> splitIntoInlineParseChunks(String text) {
  if (text.isEmpty) {
    return const [];
  }
  if (!text.contains('\n')) {
    return [text];
  }
  final lines = text.split('\n');
  final chunks = <String>[];
  var buffer = StringBuffer();
  for (var i = 0; i < lines.length; i++) {
    if (buffer.isNotEmpty) {
      buffer.write('\n');
    }
    buffer.write(lines[i]);
    final combined = buffer.toString();
    if (!hasUnclosedInlineParseDelimiters(combined)) {
      chunks.add(combined);
      buffer = StringBuffer();
    }
  }
  if (buffer.isNotEmpty) {
    chunks.add(buffer.toString());
  }
  return chunks;
}

int _countUnescapedDelimiters(String text, String delimiter) {
  var count = 0;
  var index = 0;
  while (index < text.length) {
    final delimiterIndex = text.indexOf(delimiter, index);
    if (delimiterIndex == -1) {
      break;
    }
    if (_isEscaped(text, delimiterIndex)) {
      index = delimiterIndex + delimiter.length;
      continue;
    }
    count++;
    index = delimiterIndex + delimiter.length;
  }
  return count;
}

bool _isEscaped(String text, int delimiterIndex) {
  var backslashCount = 0;
  var index = delimiterIndex - 1;
  while (index >= 0 && text[index] == r'\') {
    backslashCount++;
    index--;
  }
  return backslashCount.isOdd;
}
