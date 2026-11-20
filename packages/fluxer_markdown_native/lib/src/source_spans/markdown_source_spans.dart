import 'dart:collection';
import 'dart:math' as math;

import 'package:fluxer_markdown_native/src/ast.dart';
import 'package:fluxer_markdown_native/src/flags.dart';
import 'package:fluxer_markdown_native/src/parser.dart';
import 'package:fluxer_markdown_native/src/source_spans/align_context.dart';
import 'package:fluxer_markdown_native/src/source_spans/align_node.dart';
import 'package:fluxer_markdown_native/src/source_spans/source_span.dart';

typedef MdSourceParser = List<MdNode> Function(String source, int flags);

const int _maxAlignAttempts = 64;
const int _maxLineLength = 4096;
const int _cacheCapacity = 32;

final LinkedHashMap<(int, String), List<MdSourceSpan>> _cache =
    LinkedHashMap<(int, String), List<MdSourceSpan>>();

List<MdNode> _parse(String source, int flags) =>
    parseFluxerMarkdownBinary(source, flags: flags);

List<MdSourceSpan> computeMarkdownSourceSpans(
  String source, {
  int flags = FluxerParserFlags.all,
  MdSourceParser parser = _parse,
}) {
  final key = (flags, source);
  final cached = _cache.remove(key);
  if (cached != null) {
    return _cache[key] = cached;
  }
  final spans = List<MdSourceSpan>.unmodifiable(
    _computeSpans(source, (segment) => parser(segment, flags)),
  );
  _cache[key] = spans;
  if (_cache.length > _cacheCapacity) {
    _cache.remove(_cache.keys.first);
  }
  return spans;
}

List<MdSourceSpan> _computeSpans(
  String source,
  List<MdNode> Function(String) parse,
) {
  final spans = <MdSourceSpan>[];
  var offset = 0;
  var attempts = 0;
  var segmentLimit = source.length;
  while (offset < source.length) {
    attempts += 1;
    if (attempts > _maxAlignAttempts) {
      _addPlain(spans, offset, source.length);
      break;
    }
    final int segmentEnd = math.min(
      _segmentEndFrom(source, offset),
      segmentLimit,
    );
    final ctx = _alignSegment(
      source.substring(offset, segmentEnd),
      parse,
    );
    if (!ctx.failed) {
      for (final span in ctx.spans) {
        spans.add(
          span.copyWith(start: span.start + offset, end: span.end + offset),
        );
      }
      offset = segmentEnd;
      segmentLimit = source.length;
      continue;
    }
    final failurePos = offset + ctx.pos;
    final safe = failurePos <= offset
        ? offset
        : math.max(offset, source.lastIndexOf('\n', failurePos - 1) + 1);
    if (safe > offset) {
      segmentLimit = safe;
      continue;
    }
    final newline = indexOfFrom(source, '\n', offset);
    final resume = newline < 0 || newline >= segmentEnd
        ? segmentEnd
        : newline + 1;
    _addPlain(spans, offset, resume);
    offset = resume;
    segmentLimit = source.length;
  }
  return _coalesce(spans);
}

AlignContext _alignSegment(
  String source,
  List<MdNode> Function(String) parse,
) {
  final ctx = AlignContext(source);
  try {
    final nodes = parse(source);
    ctx.skipBlankLines(MdSpanFormat.none);
    alignNodeSequence(nodes, MdSpanFormat.none, ctx);
  } on Object {
    ctx.failed = true;
    return ctx;
  }
  if (!ctx.failed && ctx.pos < source.length) {
    if (onlyWhitespaceRe.hasMatch(source.substring(ctx.pos))) {
      ctx.pushContent(source.length, MdSpanFormat.none);
    } else {
      ctx.failed = true;
    }
  }
  return ctx;
}

void _addPlain(List<MdSourceSpan> spans, int start, int end) {
  if (end > start) {
    spans.add(
      MdSourceSpan(
        start: start,
        end: end,
        isMarker: false,
        format: MdSpanFormat.none,
      ),
    );
  }
}

int _segmentEndFrom(String source, int offset) {
  var lineStart = offset;
  while (lineStart < source.length) {
    final lineEnd = lineEndFrom(source, lineStart);
    if (lineEnd - lineStart > _maxLineLength) {
      return lineStart > offset ? lineStart : lineStart + _maxLineLength;
    }
    if (lineEnd >= source.length) {
      return source.length;
    }
    lineStart = lineEnd + 1;
  }
  return source.length;
}

List<MdSourceSpan> _coalesce(List<MdSourceSpan> spans) {
  final out = <MdSourceSpan>[];
  for (final span in spans) {
    if (span.end <= span.start) {
      continue;
    }
    final last = out.isEmpty ? null : out.last;
    if (last != null &&
        last.isMarker == span.isMarker &&
        last.format == span.format &&
        last.end == span.start) {
      out[out.length - 1] = last.copyWith(end: span.end);
    } else {
      out.add(span);
    }
  }
  return out;
}
