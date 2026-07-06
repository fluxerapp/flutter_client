import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/fenced_code_block_utils.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';

sealed class MessageContentSegment {}

final class MessageTextFlowSegment extends MessageContentSegment {
  MessageTextFlowSegment(this.text);
  final String text;
}

final class MessageBlockMarkdownSegment extends MessageContentSegment {
  MessageBlockMarkdownSegment(this.text);
  final String text;
}

final class MessageBlockSpoilerSegment extends MessageContentSegment {
  MessageBlockSpoilerSegment(this.text);
  final String text;
}

bool usesMessageLineParsing(FluxerMarkdownContext context) {
  return context == FluxerMarkdownContext.standardWithJumbo ||
      context == FluxerMarkdownContext.standardWithoutJumbo;
}

String normalizeBlockquoteBarMarkdown(String text) {
  if (text.isEmpty) {
    return text;
  }
  final lines = text.split('\n');
  final firstLine = lines[0];
  final leadingSpaces = firstLine.length - firstLine.trimLeft().length;
  final trimmed = firstLine.trimLeft();
  if (!trimmed.startsWith('>>>')) {
    return text;
  }
  const barPrefix = '>>>';
  var contentStart = barPrefix.length;
  if (contentStart < trimmed.length && trimmed[contentStart] == ' ') {
    contentStart++;
  }
  final content = trimmed.substring(contentStart);
  lines[0] = '${' ' * leadingSpaces}> $content';
  return lines.join('\n');
}

final MarkdownParseCache<
  (String, FluxerMarkdownFeatures),
  List<MessageContentSegment>
>
_contentStructureCache =
    MarkdownParseCache<
      (String, FluxerMarkdownFeatures),
      List<MessageContentSegment>
    >();

List<MessageContentSegment> parseMessageContentStructure(
  String text,
  FluxerMarkdownFeatures features,
) {
  return _contentStructureCache.resolve((
    text,
    features,
  ), () => _parseMessageContentStructureUncached(text, features));
}

List<MessageContentSegment> _parseMessageContentStructureUncached(
  String text,
  FluxerMarkdownFeatures features,
) {
  if (text.isEmpty) {
    return const [];
  }
  final lines = text.split('\n');
  final segments = <MessageContentSegment>[];
  final textFlowBuffer = StringBuffer();
  var previousWasHeading = false;
  var i = 0;
  while (i < lines.length) {
    final line = lines[i];
    final trimmedLeft = line.trimLeft();
    final trimmed = line.trim();
    if (trimmed.isEmpty) {
      final blankCount = _countBlankLines(lines, i);
      if (textFlowBuffer.isNotEmpty && i + blankCount < lines.length) {
        final nextTrimmed = lines[i + blankCount].trimLeft();
        final isNextHeading = _isHeadingStart(nextTrimmed, features);
        if (!isNextHeading && !previousWasHeading) {
          textFlowBuffer.write('\n' * blankCount);
        }
      }
      i += blankCount;
      previousWasHeading = false;
      continue;
    }
    if (features.allowSpoilers && isBlockSpoilerStart(trimmedLeft)) {
      final int? endIndex = parseBlockSpoilerEnd(lines, i);
      if (endIndex != null) {
        _flushTextFlow(textFlowBuffer, segments);
        final String body = parseBlockSpoilerBody(lines, i, endIndex);
        if (_hasVisibleSpoilerContent(body)) {
          segments.add(MessageBlockSpoilerSegment(body));
        } else {
          segments.add(
            MessageBlockMarkdownSegment(
              lines.sublist(i, endIndex + 1).join('\n'),
            ),
          );
        }
        previousWasHeading = false;
        i = endIndex + 1;
        continue;
      }
    }
    if (_isBlockStart(trimmedLeft, features)) {
      _flushTextFlow(textFlowBuffer, segments);
      final blockEnd = _findBlockEnd(lines, i, features);
      segments.add(
        MessageBlockMarkdownSegment(lines.sublist(i, blockEnd).join('\n')),
      );
      previousWasHeading = _isHeadingStart(trimmedLeft, features);
      i = blockEnd;
      continue;
    }
    final inlineGroup = _parseInlineLineGroup(lines, i, features);
    _appendTextFlow(textFlowBuffer, segments, inlineGroup.text);
    previousWasHeading = false;
    i = inlineGroup.nextIndex;
  }
  _flushTextFlow(textFlowBuffer, segments);
  return segments;
}

class _InlineLineGroup {
  const _InlineLineGroup({required this.text, required this.nextIndex});
  final String text;
  final int nextIndex;
}

int _countBlankLines(List<String> lines, int startIndex) {
  var count = 0;
  var index = startIndex;
  while (index < lines.length && lines[index].trim().isEmpty) {
    count++;
    index++;
  }
  return count;
}

_InlineLineGroup _parseInlineLineGroup(
  List<String> lines,
  int startIndex,
  FluxerMarkdownFeatures features,
) {
  final buffer = StringBuffer(lines[startIndex]);
  var consumed = 1;
  while (startIndex + consumed < lines.length) {
    final nextLine = lines[startIndex + consumed];
    final trimmedNext = nextLine.trimLeft();
    if (_isBlockStart(trimmedNext, features) || nextLine.trim().isEmpty) {
      break;
    }
    buffer
      ..write('\n')
      ..write(nextLine);
    consumed++;
  }
  if (startIndex + consumed < lines.length) {
    final nextLine = lines[startIndex + consumed];
    final trimmedNext = nextLine.trimLeft();
    final nextIsHeading = _isHeadingStart(trimmedNext, features);
    final nextIsBlockquote = _isBlockquoteStart(trimmedNext, features);
    if (nextLine.trim().isEmpty || (!nextIsHeading && !nextIsBlockquote)) {
      buffer.write('\n');
    }
  }
  return _InlineLineGroup(
    text: buffer.toString(),
    nextIndex: startIndex + consumed,
  );
}

void _flushTextFlow(StringBuffer buffer, List<MessageContentSegment> segments) {
  if (buffer.isEmpty) {
    return;
  }
  segments.add(MessageTextFlowSegment(buffer.toString()));
  buffer.clear();
}

void _appendTextFlow(
  StringBuffer buffer,
  List<MessageContentSegment> segments,
  String content,
) {
  if (content.isEmpty) {
    return;
  }
  if (buffer.isEmpty) {
    buffer.write(content);
    return;
  }
  if (content.contains('\n\n')) {
    _flushTextFlow(buffer, segments);
    buffer.write(content);
    return;
  }
  buffer.write(content);
}

bool _isBlockStart(String trimmedLeft, FluxerMarkdownFeatures features) {
  return _isHeadingStart(trimmedLeft, features) ||
      (features.allowSubtext && trimmedLeft.startsWith('-#')) ||
      (features.allowCodeBlocks && trimmedLeft.startsWith('```')) ||
      (features.allowLists && _matchListItem(trimmedLeft) != null) ||
      _isBlockquoteStart(trimmedLeft, features);
}

bool _isHeadingStart(String trimmedLeft, FluxerMarkdownFeatures features) {
  if (!features.allowHeadings || !trimmedLeft.startsWith('#')) {
    return false;
  }
  var level = 0;
  while (level < trimmedLeft.length && level < 4 && trimmedLeft[level] == '#') {
    level++;
  }
  return level >= 1 &&
      level <= 4 &&
      level < trimmedLeft.length &&
      trimmedLeft[level] == ' ';
}

bool _isBlockquoteStart(String trimmedLeft, FluxerMarkdownFeatures features) {
  return (features.allowMultilineBlockquotes &&
          trimmedLeft.startsWith('>>> ')) ||
      (features.allowBlockquotes && trimmedLeft.startsWith('> '));
}

bool _hasVisibleSpoilerContent(String value) {
  for (final int codeUnit in value.runes) {
    if (codeUnit != 0x20 &&
        codeUnit != 0x09 &&
        codeUnit != 0x0A &&
        codeUnit != 0x0D &&
        codeUnit != 0x200E) {
      return true;
    }
  }
  return false;
}

int _findBlockEnd(
  List<String> lines,
  int startIndex,
  FluxerMarkdownFeatures features,
) {
  final trimmedLeft = lines[startIndex].trimLeft();
  if (features.allowCodeBlocks && trimmedLeft.startsWith('```')) {
    return _findCodeBlockEnd(lines, startIndex);
  }
  if (trimmedLeft.startsWith('>>> ') && features.allowMultilineBlockquotes) {
    return lines.length;
  }
  if (features.allowBlockquotes && trimmedLeft.startsWith('> ')) {
    return _findBlockquoteEnd(lines, startIndex);
  }
  if (features.allowLists && _matchListItem(trimmedLeft) != null) {
    return _findListEnd(lines, startIndex, features);
  }
  if (features.allowTables &&
      trimmedLeft.contains('|') &&
      startIndex + 2 < lines.length) {
    final tableEnd = _findTableEnd(lines, startIndex);
    if (tableEnd > startIndex + 1) {
      return tableEnd;
    }
  }
  return startIndex + 1;
}

int _findCodeBlockEnd(List<String> lines, int startIndex) {
  final int? fenceLength = parseOpeningBacktickFenceLength(
    lines[startIndex].trimLeft(),
  );
  if (fenceLength == null) {
    return startIndex + 1;
  }
  for (var i = startIndex + 1; i < lines.length; i++) {
    if (lineClosesBacktickFence(lines[i], fenceLength)) {
      return i + 1;
    }
  }
  return lines.length;
}

int _findBlockquoteEnd(List<String> lines, int startIndex) {
  var index = startIndex + 1;
  while (index < lines.length) {
    final trimmed = lines[index].trimLeft();
    if (!trimmed.startsWith('> ')) {
      break;
    }
    index++;
  }
  return index;
}

int _findListEnd(
  List<String> lines,
  int startIndex,
  FluxerMarkdownFeatures features,
) {
  final firstMatch = _matchListItem(lines[startIndex].trimLeft());
  if (firstMatch == null) {
    return startIndex + 1;
  }
  final indentLevel = firstMatch.indentLevel;
  var index = startIndex + 1;
  while (index < lines.length) {
    final trimmed = lines[index].trimLeft();
    if (trimmed.isEmpty) {
      break;
    }
    if (_isHeadingStart(trimmed, features) ||
        _isBlockquoteStart(trimmed, features)) {
      break;
    }
    final item = _matchListItem(lines[index]);
    if (item != null) {
      if (item.indentLevel < indentLevel) {
        break;
      }
      index++;
      continue;
    }
    if (_isListContinuation(lines[index], indentLevel)) {
      index++;
      continue;
    }
    break;
  }
  return index;
}

int _findTableEnd(List<String> lines, int startIndex) {
  var index = startIndex + 2;
  while (index < lines.length) {
    final trimmed = lines[index].trimLeft();
    if (!trimmed.contains('|') || _isTableBlockBreak(trimmed)) {
      break;
    }
    index++;
  }
  return index;
}

bool _isTableBlockBreak(String trimmed) {
  if (trimmed.isEmpty) {
    return false;
  }
  final first = trimmed[0];
  if (first == '#' || first == '>' || first == '-' || first == '*') {
    return true;
  }
  if (trimmed.length >= 2 && trimmed[0] == '-' && trimmed[1] == '#') {
    return true;
  }
  if (first.codeUnitAt(0) >= 0x30 && first.codeUnitAt(0) <= 0x39) {
    for (var i = 1; i < trimmed.length && i < 4; i++) {
      if (trimmed[i] == '.') {
        return true;
      }
    }
  }
  return false;
}

class _ListMatch {
  const _ListMatch({required this.indentLevel});
  final int indentLevel;
}

_ListMatch? _matchListItem(String line) {
  var indent = 0;
  while (indent < line.length && line[indent] == ' ') {
    indent++;
  }
  if (indent > 0 && indent < 2) {
    return null;
  }
  final indentLevel = indent ~/ 2;
  if (indent >= line.length) {
    return null;
  }
  final marker = line[indent];
  if ((marker == '*' || marker == '-') &&
      indent + 1 < line.length &&
      line[indent + 1] == ' ') {
    return _ListMatch(indentLevel: indentLevel);
  }
  var pos = indent;
  while (pos < line.length && _isDigit(line.codeUnitAt(pos))) {
    pos++;
  }
  if (pos < line.length &&
      line[pos] == '.' &&
      pos + 1 < line.length &&
      line[pos + 1] == ' ') {
    return _ListMatch(indentLevel: indentLevel);
  }
  return null;
}

bool _isListContinuation(String line, int indentLevel) {
  var spaces = 0;
  while (spaces < line.length && line[spaces] == ' ') {
    spaces++;
  }
  return spaces > indentLevel * 2;
}

bool _isDigit(int codeUnit) {
  return codeUnit >= 0x30 && codeUnit <= 0x39;
}

List<String> parseMessageTextFlowParts(
  String text,
  FluxerMarkdownFeatures features,
) {
  return parseMessageContentStructure(
    text,
    features,
  ).whereType<MessageTextFlowSegment>().map((segment) => segment.text).toList();
}
