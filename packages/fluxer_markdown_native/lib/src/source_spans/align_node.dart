import 'dart:math' as math;

import 'package:fluxer_markdown_native/src/ast.dart';
import 'package:fluxer_markdown_native/src/source_spans/align_block.dart';
import 'package:fluxer_markdown_native/src/source_spans/align_context.dart';
import 'package:fluxer_markdown_native/src/source_spans/align_inline.dart';
import 'package:fluxer_markdown_native/src/source_spans/align_text.dart';
import 'package:fluxer_markdown_native/src/source_spans/source_span.dart';

final RegExp _headingPrefixRe = RegExp(r'[ \t\r]*#{1,4} ');
final RegExp _subtextPrefixRe = RegExp(r'[ \t\r]*-# ');
final RegExp _lineBreakRe = RegExp(r'\n');

void alignNode(MdNode node, int format, AlignContext ctx) {
  switch (node) {
    case MdText(:final String content):
      alignText(content, format, ctx);
    case MdStrong(:final List<MdNode> children):
      final delimiter = ctx.startsWithAt('**', ctx.pos)
          ? '**'
          : ctx.startsWithAt('__', ctx.pos)
          ? '__'
          : null;
      if (delimiter == null) {
        ctx.failed = true;
        return;
      }
      _alignDelimited(children, delimiter, format | MdSpanFormat.bold, ctx);
    case MdEmphasis(:final List<MdNode> children):
      final delimiter = ctx.charAt(ctx.pos);
      if (delimiter != '*' && delimiter != '_') {
        ctx.failed = true;
        return;
      }
      _alignDelimited(children, delimiter!, format | MdSpanFormat.italic, ctx);
    case MdUnderline(:final List<MdNode> children):
      _alignDelimited(children, '__', format | MdSpanFormat.underline, ctx);
    case MdStrikethrough(:final List<MdNode> children):
      _alignDelimited(children, '~~', format | MdSpanFormat.strike, ctx);
    case MdSpoiler(:final List<MdNode> children, :final bool? isBlock):
      final next = format | MdSpanFormat.spoiler;
      if (isBlock ?? false) {
        alignBlockSpoiler(children, next, ctx);
      } else {
        _alignDelimited(children, '||', next, ctx);
      }
    case MdInlineCode(:final String content):
      alignInlineCode(content, format, ctx);
    case MdCodeBlock():
      alignCodeBlock(node, format, ctx);
    case MdHeading(:final List<MdNode> children):
      final prefix = matchAt(_headingPrefixRe, ctx.source, ctx.pos);
      if (prefix == null) {
        ctx.failed = true;
        return;
      }
      ctx.pushContent(ctx.pos + prefix.group(0)!.length, format);
      alignChildren(children, format | MdSpanFormat.heading, ctx);
    case MdSubtext(:final List<MdNode> children):
      final prefix = matchAt(_subtextPrefixRe, ctx.source, ctx.pos);
      if (prefix == null) {
        ctx.failed = true;
        return;
      }
      final next = format | MdSpanFormat.subtext;
      ctx.pushMarker(prefix.group(0)!.length, next);
      alignChildren(children, next, ctx);
    case MdBlockquote(:final List<MdNode> children):
      alignBlockquote(children, format | MdSpanFormat.blockquote, ctx);
    case MdSequence(:final List<MdNode> children):
      alignChildren(children, format, ctx);
    case MdLink():
      alignLink(node, format, ctx);
    case MdList():
      alignList(node, format, ctx);
    case MdEmoji(:final MdEmojiKind kind):
      alignEmoji(kind, format, ctx);
    case MdTimestamp():
      alignTimestamp(format, ctx);
    case MdMention():
      alignMention(format, ctx);
    case MdAlert():
      alignAlert(format, ctx);
    case MdTable():
      alignTable(node, format, ctx);
    case MdTableRow() || MdTableCell():
      ctx.failed = true;
  }
}

void _alignDelimited(
  List<MdNode> children,
  String delimiter,
  int format,
  AlignContext ctx,
) {
  if (!ctx.expectMarker(delimiter, format)) {
    return;
  }
  ctx.closers.add(delimiter);
  alignChildren(children, format, ctx);
  ctx.closers.removeLast();
  if (!ctx.failed) {
    ctx.expectMarker(delimiter, format);
  }
}

void alignChildren(List<MdNode> children, int format, AlignContext ctx) {
  for (final child in children) {
    if (ctx.failed) {
      return;
    }
    alignNode(child, format, ctx);
  }
}

void alignNodeSequence(List<MdNode> nodes, int format, AlignContext ctx) {
  for (var index = 0; index < nodes.length; index += 1) {
    if (ctx.failed) {
      return;
    }
    if (index > 0) {
      _advanceSequenceGap(nodes, index, format, ctx);
    }
    alignNode(nodes[index], format, ctx);
  }
}

void _advanceSequenceGap(
  List<MdNode> nodes,
  int index,
  int format,
  AlignContext ctx,
) {
  final breakEnds = <int>[];
  var scan = ctx.pos;
  while (scan < ctx.source.length) {
    final blank = matchAt(
      breakEnds.isEmpty ? _lineBreakRe : blankLineRe,
      ctx.source,
      scan,
    );
    if (blank == null) {
      break;
    }
    scan += blank.group(0)!.length;
    breakEnds.add(scan);
  }
  var contentLineBreaks = 0;
  for (final next in nodes.skip(index)) {
    if (next is! MdText) {
      break;
    }
    var leading = 0;
    while (sourceCharAt(next.content, leading) == '\n') {
      leading += 1;
    }
    contentLineBreaks += leading;
    if (leading < next.content.length) {
      break;
    }
  }
  final int structural = math.max(0, breakEnds.length - contentLineBreaks);
  if (structural > 0) {
    ctx.pushContent(breakEnds[structural - 1], format);
  }
}
