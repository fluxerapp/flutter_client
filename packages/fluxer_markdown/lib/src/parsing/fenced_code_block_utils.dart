const int _minFenceLength = 3;

class InlineClosingFenceSplit {
  const InlineClosingFenceSplit({
    required this.content,
    required this.fenceLine,
    this.trailingText,
  });

  final String content;
  final String fenceLine;
  final String? trailingText;
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
  final String trimmedLeft = line.trimLeft();
  if (isLineStartClosingBacktickFence(trimmedLeft, openingFenceLength)) {
    return null;
  }
  final _InlineFenceBounds? endBounds = _findEndInlineFenceBounds(line);
  if (endBounds != null && endBounds.fenceLength >= openingFenceLength) {
    return endBounds.fenceStart;
  }
  final int leadingSpaces = line.length - trimmedLeft.length;
  final int startFenceLength = _leadingBacktickCount(trimmedLeft);
  if (startFenceLength >= openingFenceLength) {
    final String afterFence = trimmedLeft.substring(startFenceLength);
    if (afterFence.trim().isNotEmpty) {
      return leadingSpaces;
    }
  }
  return _findMidlineClosingBacktickFenceStart(line, openingFenceLength);
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

_InlineFenceBounds? _findEndInlineFenceBounds(String line) {
  var end = line.length;
  while (end > 0) {
    final int codeUnit = line.codeUnitAt(end - 1);
    if (codeUnit != 0x20 && codeUnit != 0x09) {
      break;
    }
    end--;
  }
  if (end == 0 || line[end - 1] != '`') {
    return null;
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

int _backtickRunStart(String text, int index) {
  var start = index;
  while (start > 0 && text[start - 1] == '`') {
    start--;
  }
  return start;
}

int _backtickRunEnd(String text, int index) {
  var end = index;
  while (end < text.length && text[end] == '`') {
    end++;
  }
  return end;
}

int? _findMidlineClosingBacktickFenceStart(
  String line,
  int openingFenceLength,
) {
  final String trimmedLeft = line.trimLeft();
  final int leadingSpaces = line.length - trimmedLeft.length;
  for (
    var index = trimmedLeft.length - openingFenceLength;
    index >= 0;
    index--
  ) {
    if (trimmedLeft[index] != '`') {
      continue;
    }
    final int runStart = _backtickRunStart(trimmedLeft, index);
    final int runEnd = _backtickRunEnd(trimmedLeft, index);
    if (runEnd - runStart < openingFenceLength) {
      index = runStart;
      continue;
    }
    final String afterFence = trimmedLeft.substring(runEnd);
    if (afterFence.trim().isEmpty) {
      continue;
    }
    if (runStart == 0) {
      continue;
    }
    return leadingSpaces + runStart;
  }
  return null;
}

InlineClosingFenceSplit? splitInlineClosingBacktickFence(
  String line,
  int openingFenceLength,
) {
  final int? fenceStart = findInlineClosingBacktickFenceStart(
    line,
    openingFenceLength,
  );
  if (fenceStart == null) {
    return null;
  }
  var fenceEnd = fenceStart;
  while (fenceEnd < line.length && line[fenceEnd] == '`') {
    fenceEnd++;
  }
  if (fenceEnd - fenceStart < openingFenceLength) {
    return null;
  }
  final String trailing = line.substring(fenceEnd);
  final String fence = line.substring(fenceStart, fenceEnd);
  final int leadingSpaces = line.length - line.trimLeft().length;
  return InlineClosingFenceSplit(
    content: line.substring(0, fenceStart),
    fenceLine: fenceStart == leadingSpaces
        ? '${' ' * leadingSpaces}$fence'
        : fence,
    trailingText: trailing.trim().isEmpty ? null : trailing,
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
      if (split.trailingText != null) {
        output.add(split.trailingText!);
      }
      inside = false;
      openingFenceLength = 0;
      continue;
    }
    output.add(line);
  }
  return output.join('\n');
}
