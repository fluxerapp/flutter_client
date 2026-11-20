import 'dart:math' as math;

import 'package:fluxer_markdown_native/src/ast.dart';
import 'package:fluxer_markdown_native/src/source_spans/align_context.dart';
import 'package:fluxer_markdown_native/src/source_spans/align_node.dart';
import 'package:fluxer_markdown_native/src/source_spans/align_text.dart';
import 'package:fluxer_markdown_native/src/source_spans/source_span.dart';

final RegExp _unorderedListRe = RegExp('( *)([-*]) ');
final RegExp _orderedListRe = RegExp(r'( *)(\d+)\. ');
final RegExp _onlyLineSpaceRe = RegExp(r'^[ \t\r]*$');
final RegExp _blockSpoilerOpenRe = RegExp(r'[ \t\r]*\|\|');

void alignList(MdList node, int format, AlignContext ctx) {
  for (var index = 0; index < node.items.length; index += 1) {
    if (ctx.failed) {
      return;
    }
    if (index > 0 && ctx.charAt(ctx.pos) == '\n') {
      ctx.pushContent(ctx.pos + 1, format);
    }
    final match = matchAt(
      node.ordered ? _orderedListRe : _unorderedListRe,
      ctx.source,
      ctx.pos,
    );
    if (match == null) {
      ctx.failed = true;
      return;
    }
    ctx.pushContent(ctx.pos + match.group(0)!.length, format);
    _alignListItemChildren(
      node.items[index].children,
      format,
      match.group(1)!.length ~/ 2,
      ctx,
    );
  }
}

void _alignListItemChildren(
  List<MdNode> children,
  int format,
  int indentLevel,
  AlignContext ctx,
) {
  final parentIndentLevel = ctx.listIndentLevel;
  ctx.listIndentLevel = indentLevel;
  for (final child in children) {
    final continuationEnd = listContinuationEnd(
      ctx.source,
      ctx.pos,
      indentLevel,
    );
    if (continuationEnd != ctx.pos) {
      ctx.pushContent(
        child is MdList || child is MdCodeBlock
            ? ctx.source.lastIndexOf('\n', continuationEnd - 1) + 1
            : continuationEnd,
        format,
      );
    }
    alignNode(child, format, ctx);
    if (ctx.failed) {
      break;
    }
  }
  ctx.listIndentLevel = parentIndentLevel;
}

void alignCodeBlock(MdCodeBlock node, int format, AlignContext ctx) {
  final source = ctx.source;
  final start = ctx.pos;
  final fenceStart = skipLineSpace(source, start);
  var fenceLength = 0;
  while (sourceCharAt(source, fenceStart + fenceLength) == '`') {
    fenceLength += 1;
  }
  if (fenceLength < 3) {
    ctx.failed = true;
    return;
  }
  final fence = '`' * fenceLength;
  final languagePartStart = fenceStart + fenceLength;
  final openingLineEnd = indexOfFrom(source, '\n', languagePartStart);
  final languagePart = source.substring(
    languagePartStart,
    openingLineEnd < 0 ? source.length : openingLineEnd,
  );
  final inlineClosing = languagePart.indexOf(fence);
  final next = format | MdSpanFormat.code | MdSpanFormat.codeBlock;
  if (inlineClosing >= 0) {
    final contentEnd = languagePartStart + inlineClosing;
    if (node.language != null ||
        !equalsParserText(
          source.substring(languagePartStart, contentEnd),
          node.content,
        )) {
      ctx.failed = true;
      return;
    }
    ctx
      ..pushMarker(languagePartStart - ctx.pos, next)
      ..pushContent(contentEnd, next)
      ..pushMarker(fenceLength, next);
    return;
  }
  final language = node.language;
  if (openingLineEnd < 0 ||
      (language != null && !equalsParserText(languagePart.trim(), language))) {
    ctx.failed = true;
    return;
  }
  final languageIsContent = language == null && languagePart.isNotEmpty;
  final openingIndent = source.substring(start, fenceStart);
  String stripIndent(String line) =>
      openingIndent.isNotEmpty && line.startsWith(openingIndent)
      ? line.substring(openingIndent.length)
      : line;
  final expectedContent = StringBuffer(
    languageIsContent ? '$languagePart\n' : '',
  );
  var lineStart = openingLineEnd + 1;
  var closingStart = -1;
  var closingLength = fenceLength;
  while (lineStart <= source.length) {
    final lineEnd = lineEndFrom(source, lineStart);
    final line = source.substring(lineStart, lineEnd);
    final closing = _findCodeBlockClosing(line, fence, fenceLength);
    if (closing != null) {
      final contentLine = stripIndent(
        line.substring(0, closing.fenceIndex),
      );
      if (contentLine.isNotEmpty) {
        expectedContent.write('$contentLine\n');
      }
      closingStart = lineStart + closing.fenceIndex;
      closingLength = closing.hasTrailing ? closing.runLength : fenceLength;
      break;
    }
    expectedContent.write('${stripIndent(line)}\n');
    if (lineEnd >= source.length) {
      break;
    }
    lineStart = lineEnd + 1;
  }
  if (closingStart < 0 ||
      !equalsParserText(expectedContent.toString(), node.content)) {
    ctx.failed = true;
    return;
  }
  ctx
    ..pushMarker(
      (languageIsContent ? languagePartStart : openingLineEnd + 1) - ctx.pos,
      next,
    )
    ..pushContent(closingStart, next)
    ..pushMarker(closingLength, next);
}

({int fenceIndex, int runLength, bool hasTrailing})? _findCodeBlockClosing(
  String line,
  String fence,
  int fenceLength,
) {
  final trimmedStart = skipLineSpace(line, 0);
  final trimmed = line.substring(trimmedStart);
  final relativeFenceIndex = trimmed.indexOf(fence);
  if (relativeFenceIndex < 0) {
    return null;
  }
  var runEnd = relativeFenceIndex;
  while (sourceCharAt(trimmed, runEnd) == '`') {
    runEnd += 1;
  }
  final count = runEnd - relativeFenceIndex;
  final after = sourceCharAt(trimmed, runEnd);
  final trailing = trimmed.substring(runEnd);
  if (count < fenceLength ||
      (after != null &&
          after != ' ' &&
          after != '\t' &&
          after != '`' &&
          !trailing.contains(fence))) {
    return null;
  }
  return (
    fenceIndex: trimmedStart + relativeFenceIndex,
    runLength: count,
    hasTrailing: trailing.isNotEmpty,
  );
}

typedef _QuoteLine = ({int start, int end, int prefixEnd, int contentStart});
typedef _MarkerRange = ({int start, int end, bool quote});

void alignBlockquote(List<MdNode> children, int format, AlignContext ctx) {
  final source = ctx.source;
  final start = ctx.pos;
  final trimmedStart = skipLineSpace(source, start);
  final markerRanges = <_MarkerRange>[];
  final blankRanges = <(int, int)>[];
  final sourceOffsets = <int>[];
  final virtualSource = StringBuffer();
  final int blockEnd;
  if (sourceStartsWith(source, '>>> ', trimmedStart)) {
    final contentStart = trimmedStart + 4;
    markerRanges.add((start: start, end: contentStart, quote: true));
    virtualSource.write(source.substring(contentStart));
    for (var position = contentStart; position < source.length; position++) {
      sourceOffsets.add(position);
    }
    blockEnd = source.length;
  } else {
    final lines = _quoteLines(source, start);
    if (lines.isEmpty) {
      ctx.failed = true;
      return;
    }
    for (var index = 0; index < lines.length; index += 1) {
      final line = lines[index];
      markerRanges.add((start: line.start, end: line.prefixEnd, quote: true));
      if (line.contentStart > line.prefixEnd) {
        blankRanges.add((line.prefixEnd, line.contentStart));
      }
      var repeated = line.contentStart;
      while (repeated < line.end && sourceStartsWith(source, '> ', repeated)) {
        markerRanges.add((start: repeated, end: repeated + 2, quote: false));
        repeated += 2;
      }
      virtualSource.write(source.substring(line.contentStart, line.end));
      for (var position = line.contentStart; position < line.end; position++) {
        sourceOffsets.add(position);
      }
      if (index + 1 < lines.length) {
        virtualSource.write('\n');
        sourceOffsets.add(line.end);
      }
    }
    blockEnd = lines.last.end;
  }
  final inner = AlignContext(virtualSource.toString());
  if (children.isEmpty) {
    inner.pushContent(inner.source.length, format);
  } else {
    inner.skipBlankLines(format);
    alignNodeSequence(children, format, inner);
    if (!inner.failed &&
        onlyWhitespaceRe.hasMatch(inner.source.substring(inner.pos))) {
      inner.pushContent(inner.source.length, format);
    }
  }
  if (inner.failed || inner.pos != inner.source.length) {
    ctx.failed = true;
    return;
  }
  final length = blockEnd - start;
  final markers = List<bool?>.filled(length, null);
  final formats = List<int>.filled(length, MdSpanFormat.none);
  for (final span in inner.spans) {
    for (var position = span.start; position < span.end; position += 1) {
      final offset = sourceOffsets[position] - start;
      markers[offset] = span.isMarker;
      formats[offset] = span.format & ~MdSpanFormat.blockquoteMarker;
    }
  }
  for (final range in markerRanges) {
    for (var position = range.start; position < range.end; position += 1) {
      markers[position - start] = true;
      formats[position - start] = range.quote
          ? format | MdSpanFormat.blockquoteMarker
          : format;
    }
  }
  for (final (int rangeStart, int rangeEnd) in blankRanges) {
    for (var position = rangeStart; position < rangeEnd; position += 1) {
      markers[position - start] = false;
      formats[position - start] = format;
    }
  }
  if (markers.contains(null)) {
    ctx.failed = true;
    return;
  }
  var runStart = 0;
  for (var position = 1; position <= length; position += 1) {
    if (position < length &&
        markers[position] == markers[runStart] &&
        formats[position] == formats[runStart]) {
      continue;
    }
    ctx.spans.add(
      MdSourceSpan(
        start: start + runStart,
        end: start + position,
        isMarker: markers[runStart]!,
        format: formats[runStart],
      ),
    );
    runStart = position;
  }
  ctx.pos = blockEnd;
}

List<_QuoteLine> _quoteLines(String source, int start) {
  final lines = <_QuoteLine>[];
  var lineStart = start;
  while (lineStart <= source.length) {
    final lineEnd = lineEndFrom(source, lineStart);
    final quoteStart = skipLineSpace(source, lineStart);
    if (!sourceStartsWith(source, '> ', quoteStart)) {
      break;
    }
    final prefixEnd = quoteStart + 2;
    final rest = source.substring(math.min(prefixEnd, lineEnd), lineEnd);
    lines.add((
      start: lineStart,
      end: lineEnd,
      prefixEnd: prefixEnd,
      contentStart: _onlyLineSpaceRe.hasMatch(rest) ? lineEnd : prefixEnd,
    ));
    if (lineEnd >= source.length) {
      break;
    }
    lineStart = lineEnd + 1;
  }
  return lines;
}

void alignAlert(int format, AlignContext ctx) {
  final source = ctx.source;
  final bodyFormat = format | MdSpanFormat.blockquote;
  var firstLine = true;
  while (true) {
    final quoteStart = skipLineSpace(source, ctx.pos);
    if (!sourceStartsWith(source, '> ', quoteStart)) {
      ctx.failed = true;
      return;
    }
    final lineEnd = lineEndFrom(source, ctx.pos);
    ctx.pushMarker(
      quoteStart + 2 - ctx.pos,
      bodyFormat | MdSpanFormat.blockquoteMarker,
    );
    if (firstLine) {
      final close = indexOfFrom(source, ']', ctx.pos);
      if (!ctx.startsWithAt('[!', ctx.pos) || close < 0 || close >= lineEnd) {
        ctx.failed = true;
        return;
      }
      ctx.pushMarker(close + 1 - ctx.pos, bodyFormat);
      firstLine = false;
    }
    ctx.pushContent(lineEnd, bodyFormat);
    if (lineEnd >= source.length) {
      return;
    }
    if (!sourceStartsWith(source, '> ', skipLineSpace(source, lineEnd + 1))) {
      return;
    }
    ctx.pushContent(lineEnd + 1, bodyFormat);
  }
}

void alignTable(MdTable node, int format, AlignContext ctx) {
  final lineCount = 2 + node.rows.length;
  for (var lineIndex = 0; lineIndex < lineCount; lineIndex += 1) {
    final lineEnd = lineEndFrom(ctx.source, ctx.pos);
    if (lineIndex == 1) {
      ctx.pushMarker(lineEnd - ctx.pos, format);
    } else {
      _alignTablePipes(ctx, lineEnd, format);
    }
    if (lineEnd >= ctx.source.length) {
      return;
    }
    if (lineIndex + 1 < lineCount) {
      ctx.pushMarker(1, format);
    }
  }
}

void _alignTablePipes(AlignContext ctx, int lineEnd, int format) {
  final source = ctx.source;
  while (ctx.pos < lineEnd) {
    var scan = ctx.pos;
    while (scan < lineEnd && source[scan] != '|') {
      scan +=
          source[scan] == r'\' && scan + 1 < lineEnd && source[scan + 1] == '|'
          ? 2
          : 1;
    }
    ctx.pushContent(scan, format);
    var pipeEnd = scan;
    while (pipeEnd < lineEnd && source[pipeEnd] == '|') {
      pipeEnd += 1;
    }
    ctx.pushMarker(pipeEnd - ctx.pos, format);
  }
}

void alignBlockSpoiler(List<MdNode> children, int format, AlignContext ctx) {
  final open = matchAt(_blockSpoilerOpenRe, ctx.source, ctx.pos);
  if (open == null) {
    ctx.failed = true;
    return;
  }
  final closingStart = indexOfFrom(
    ctx.source,
    '||',
    ctx.pos + open.group(0)!.length,
  );
  if (closingStart < 0) {
    ctx.failed = true;
    return;
  }
  ctx
    ..pushMarker(open.group(0)!.length, format)
    ..skipBlankLines(format, limit: closingStart);
  alignNodeSequence(children, format, ctx);
  if (ctx.failed) {
    return;
  }
  if (ctx.pos < closingStart &&
      onlyWhitespaceRe.hasMatch(ctx.source.substring(ctx.pos, closingStart))) {
    ctx.pushContent(closingStart, format);
  }
  if (ctx.pos != closingStart) {
    ctx.failed = true;
    return;
  }
  ctx.expectMarker('||', format);
}
