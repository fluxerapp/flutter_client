import 'dart:math' as math;

import 'package:fluxer_markdown_native/src/ast.dart';
import 'package:fluxer_markdown_native/src/source_spans/align_context.dart';
import 'package:fluxer_markdown_native/src/source_spans/align_node.dart';
import 'package:fluxer_markdown_native/src/source_spans/source_span.dart';

const int _maxUrlRealignSteps = 256;

final RegExp _emojiTokenRe = RegExp(
  r'(?:<a?:[A-Za-z0-9_+~-]+:\d+>|:[\p{L}\p{N}_+~.-]{2,}:(?::skin-tone-[1-5]:)?)',
  unicode: true,
);
final RegExp _timestampTokenRe = RegExp(r'<t:-?\d+(?::[tTdDfFsSR])?>');
final RegExp _mentionTokenRe = RegExp(
  r'(?:<@!?\d+>|<@&\d+>|<#\d+>|<\/[^:>\n]+:\d+>'
  r'|<id:(?:customize|browse|guide|linked-roles(?::[^:>\n]*)?)>'
  '|@everyone|@here)',
);

void alignEmoji(MdEmojiKind kind, int format, AlignContext ctx) {
  if (kind is MdStandardEmoji && ctx.startsWithAt(':${kind.name}:', ctx.pos)) {
    ctx.pushContent(ctx.pos + kind.name.length + 2, format);
    return;
  }
  _alignOpaque(
    _emojiTokenRe,
    kind is MdStandardEmoji ? kind.raw : null,
    format,
    ctx,
  );
}

void alignTimestamp(int format, AlignContext ctx) =>
    _alignOpaque(_timestampTokenRe, null, format, ctx);

void alignMention(int format, AlignContext ctx) =>
    _alignOpaque(_mentionTokenRe, null, format, ctx);

void _alignOpaque(
  RegExp tokenRe,
  String? literal,
  int format,
  AlignContext ctx,
) {
  final match = matchAt(tokenRe, ctx.source, ctx.pos);
  if (match != null) {
    ctx.pushContent(ctx.pos + match.group(0)!.length, format);
    return;
  }
  if (literal != null && ctx.startsWithAt(literal, ctx.pos)) {
    ctx.pushContent(ctx.pos + literal.length, format);
    return;
  }
  ctx.failed = true;
}

void alignInlineCode(String content, int format, AlignContext ctx) {
  final openingStart = ctx.pos;
  var ticks = 0;
  while (ctx.charAt(openingStart + ticks) == '`') {
    ticks += 1;
  }
  if (ticks == 0) {
    ctx.failed = true;
    return;
  }
  final contentStart = openingStart + ticks;
  final closingStart = _findInlineCodeClosing(
    ctx.source,
    contentStart,
    ticks,
  );
  if (closingStart < 0 ||
      !equalsParserText(
        _unescapeInlineCode(ctx.source.substring(contentStart, closingStart)),
        content,
      )) {
    ctx.failed = true;
    return;
  }
  final next = format | MdSpanFormat.code;
  ctx
    ..pushMarker(ticks, next)
    ..pushContent(closingStart, next)
    ..pushMarker(ticks, next);
}

int _findInlineCodeClosing(String source, int start, int ticks) {
  var position = start;
  while (position < source.length) {
    final current = source[position];
    if (current == '\n' || current == '\r') {
      return -1;
    }
    if (ticks == 1 && current == r'\' && position + 1 < source.length) {
      position += 2;
      continue;
    }
    if (current != '`') {
      position += 1;
      continue;
    }
    var runEnd = position;
    while (sourceCharAt(source, runEnd) == '`') {
      runEnd += 1;
    }
    final count = runEnd - position;
    if (ticks == 1 && count == 1) {
      return position;
    }
    if (ticks > 1 && count >= ticks) {
      return position + count - ticks;
    }
    position = runEnd;
  }
  return -1;
}

String _unescapeInlineCode(String content) {
  if (!content.contains(r'\`')) {
    return content;
  }
  final result = StringBuffer();
  var position = 0;
  while (position < content.length) {
    if (content[position] != r'\') {
      result.write(content[position]);
      position += 1;
      continue;
    }
    var runEnd = position;
    while (sourceCharAt(content, runEnd) == r'\') {
      runEnd += 1;
    }
    if (sourceCharAt(content, runEnd) == '`') {
      result
        ..write(r'\' * ((runEnd - position) ~/ 2))
        ..write('`');
      position = runEnd + 1;
      continue;
    }
    result.write(content.substring(position, runEnd));
    position = runEnd;
  }
  return result.toString();
}

void alignLink(MdLink node, int format, AlignContext ctx) {
  if (ctx.charAt(ctx.pos) == '<') {
    _alignAngleLink(format, ctx);
    return;
  }
  final text = node.text;
  if (text == null) {
    final end = _urlExtentEnd(ctx, node.url, node.rawUrl);
    if (end <= ctx.pos) {
      ctx.failed = true;
      return;
    }
    ctx.pushContent(end, format | MdSpanFormat.link);
    return;
  }
  if (!ctx.expectMarker('[', format)) {
    return;
  }
  ctx.closers.add(']');
  alignNode(text, format | MdSpanFormat.link, ctx);
  ctx.closers.removeLast();
  if (ctx.failed ||
      !ctx.expectMarker(']', format) ||
      !ctx.expectMarker('(', format)) {
    return;
  }
  final urlEnd = _scanMaskedUrlEnd(ctx.source, ctx.pos);
  if (urlEnd < 0) {
    ctx.failed = true;
    return;
  }
  ctx
    ..pushMarker(urlEnd - ctx.pos, format)
    ..expectMarker(')', format);
}

void _alignAngleLink(int format, AlignContext ctx) {
  final close = indexOfFrom(ctx.source, '>', ctx.pos + 1);
  if (close < 0) {
    ctx.failed = true;
    return;
  }
  ctx
    ..pushContent(ctx.pos + 1, format)
    ..pushContent(close, format | MdSpanFormat.link)
    ..pushContent(close + 1, format);
}

int _urlExtentEnd(AlignContext ctx, String url, String rawUrl) {
  final source = ctx.source;
  final scanned = _findUrlEnd(source, ctx.pos, source.length);
  if (rawUrl.isNotEmpty && ctx.startsWithAt(rawUrl, ctx.pos)) {
    final rawEnd = ctx.pos + rawUrl.length;
    if (rawEnd <= scanned) {
      return rawEnd;
    }
  }
  final int lowest = math.max(ctx.pos + 1, scanned - _maxUrlRealignSteps);
  for (var end = scanned; end >= lowest; end -= 1) {
    final candidate = source.substring(ctx.pos, end);
    if (candidate == url || candidate == rawUrl) {
      return end >= scanned ? scanned : _findUrlEnd(source, ctx.pos, end);
    }
  }
  var limit = source.length;
  for (final closer in ctx.closers) {
    final found = indexOfFrom(source, closer, ctx.pos + 1);
    if (found > ctx.pos && found < limit) {
      limit = found;
    }
  }
  return limit >= scanned ? scanned : _findUrlEnd(source, ctx.pos, limit);
}

const Set<String> _trimmedAutolinkPunctuation = <String>{
  '.',
  ',',
  ';',
  ':',
  '!',
  '?',
};
const Set<String> _urlTerminators = <String>{' ', '\t', '\n', '\r', ')', '"'};
final RegExp _asciiLetterRe = RegExp('[A-Za-z]');

bool _hasTerminalTld(String text) {
  var index = text.length;
  var letterCount = 0;
  while (index > 0 && _asciiLetterRe.hasMatch(text[index - 1])) {
    letterCount += 1;
    index -= 1;
  }
  return letterCount >= 2 && index > 0 && text[index - 1] == '.';
}

int _findUrlEnd(String content, int start, int limit) {
  var end = start;
  var parenDepth = 0;
  while (end < limit) {
    final char = content[end];
    if (char == '(') {
      parenDepth += 1;
    } else if (char == ')' && parenDepth > 0) {
      parenDepth -= 1;
    } else if (_urlTerminators.contains(char)) {
      break;
    }
    end += 1;
  }
  while (end > start &&
      _trimmedAutolinkPunctuation.contains(content[end - 1]) &&
      !_hasTerminalTld(content.substring(start, end))) {
    end -= 1;
  }
  return end;
}

int _scanMaskedUrlEnd(String source, int start) {
  if (sourceCharAt(source, start) == '<') {
    final close = indexOfFrom(source, '>', start + 1);
    return close < 0 ? -1 : indexOfFrom(source, ')', close + 1);
  }
  var depth = 0;
  for (var i = start; i < source.length; i += 1) {
    if (source[i] == '(') {
      depth += 1;
    } else if (source[i] == ')') {
      if (depth == 0) {
        return i;
      }
      depth -= 1;
    }
  }
  return -1;
}
