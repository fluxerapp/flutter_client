const int _minFenceLength = 3;

class InlineClosingFenceSplit {
  const InlineClosingFenceSplit({
    required this.content,
    required this.fenceLine,
  });

  final String content;
  final String fenceLine;
}

int _leadingBacktickCount(String text) {
  var count = 0;
  while (count < text.length && text[count] == '`') {
    count++;
  }
  return count;
}

int? parseOpeningBacktickFenceLength(String trimmedLeft) {
  final int fenceLength = _leadingBacktickCount(trimmedLeft);
  if (fenceLength < _minFenceLength) {
    return null;
  }
  return fenceLength;
}

bool isLineStartClosingBacktickFence(
  String trimmedLeft,
  int openingFenceLength,
) {
  final int fenceLength = _leadingBacktickCount(trimmedLeft);
  if (fenceLength < openingFenceLength) {
    return false;
  }
  final String afterFence = trimmedLeft.substring(fenceLength);
  return afterFence.isEmpty || afterFence.trim().isEmpty;
}

int? findInlineClosingBacktickFenceStart(String line, int openingFenceLength) {
  if (isLineStartClosingBacktickFence(line.trimLeft(), openingFenceLength)) {
    return null;
  }
  final _InlineFenceBounds? bounds = _findInlineFenceBounds(line);
  if (bounds == null || bounds.fenceLength < openingFenceLength) {
    return null;
  }
  return bounds.fenceStart;
}

class _InlineFenceBounds {
  const _InlineFenceBounds({
    required this.fenceStart,
    required this.fenceEnd,
    required this.fenceLength,
  });

  final int fenceStart;
  final int fenceEnd;
  final int fenceLength;
}

_InlineFenceBounds? _findInlineFenceBounds(String line) {
  var end = line.length;
  while (end > 0) {
    final int codeUnit = line.codeUnitAt(end - 1);
    if (codeUnit != 0x20 && codeUnit != 0x09) {
      break;
    }
    end--;
  }
  var fenceStart = end;
  while (fenceStart > 0 && line[fenceStart - 1] == '`') {
    fenceStart--;
  }
  final int fenceLength = end - fenceStart;
  if (fenceLength < _minFenceLength) {
    return null;
  }
  return _InlineFenceBounds(
    fenceStart: fenceStart,
    fenceEnd: end,
    fenceLength: fenceLength,
  );
}

InlineClosingFenceSplit? splitInlineClosingBacktickFence(
  String line,
  int openingFenceLength,
) {
  if (isLineStartClosingBacktickFence(line.trimLeft(), openingFenceLength)) {
    return null;
  }
  final _InlineFenceBounds? bounds = _findInlineFenceBounds(line);
  if (bounds == null || bounds.fenceLength < openingFenceLength) {
    return null;
  }
  final String trailing = line.substring(bounds.fenceEnd);
  final String fence = line.substring(bounds.fenceStart, bounds.fenceEnd);
  final int leadingSpaces = line.length - line.trimLeft().length;
  return InlineClosingFenceSplit(
    content: line.substring(0, bounds.fenceStart),
    fenceLine: '${' ' * leadingSpaces}$fence$trailing',
  );
}

bool lineClosesBacktickFence(String line, int openingFenceLength) {
  final String trimmedLeft = line.trimLeft();
  return isLineStartClosingBacktickFence(trimmedLeft, openingFenceLength) ||
      findInlineClosingBacktickFenceStart(line, openingFenceLength) != null;
}

String normalizeFencedCodeBlockInlineClosers(
  String text, {
  required bool allowCodeBlocks,
}) {
  if (!allowCodeBlocks || text.isEmpty || !text.contains('`')) {
    return text;
  }
  final List<String> lines = text.split('\n');
  final List<String> output = <String>[];
  var inside = false;
  var openingFenceLength = 0;
  for (final String line in lines) {
    final String trimmedLeft = line.trimLeft();
    if (!inside) {
      final int? openingLength = parseOpeningBacktickFenceLength(trimmedLeft);
      if (openingLength != null) {
        inside = true;
        openingFenceLength = openingLength;
      }
      output.add(line);
      continue;
    }
    if (isLineStartClosingBacktickFence(trimmedLeft, openingFenceLength)) {
      inside = false;
      openingFenceLength = 0;
      output.add(line);
      continue;
    }
    final InlineClosingFenceSplit? split = splitInlineClosingBacktickFence(
      line,
      openingFenceLength,
    );
    if (split != null) {
      if (split.content.isNotEmpty) {
        output.add(split.content);
      }
      output.add(split.fenceLine);
      inside = false;
      openingFenceLength = 0;
      continue;
    }
    output.add(line);
  }
  return output.join('\n');
}
