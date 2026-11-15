import 'dart:math' as math;

import 'package:fluxer_markdown_native/src/source_spans/source_span.dart';

final class AlignContext {
  AlignContext(this.source);

  final String source;
  int pos = 0;
  final List<MdSourceSpan> spans = <MdSourceSpan>[];
  bool failed = false;
  int? listIndentLevel;
  final List<String> closers = <String>[];

  String? charAt(int index) => sourceCharAt(source, index);

  bool startsWithAt(String pattern, int index) =>
      sourceStartsWith(source, pattern, index);

  void pushMarker(int length, int format) {
    if (length <= 0) {
      return;
    }
    spans.add(
      MdSourceSpan(
        start: pos,
        end: pos + length,
        isMarker: true,
        format: format,
      ),
    );
    pos += length;
  }

  void pushContent(int endPos, int format) {
    if (endPos <= pos) {
      return;
    }
    spans.add(
      MdSourceSpan(start: pos, end: endPos, isMarker: false, format: format),
    );
    pos = endPos;
  }

  bool expectMarker(String marker, int format) {
    if (startsWithAt(marker, pos)) {
      pushMarker(marker.length, format);
      return true;
    }
    failed = true;
    return false;
  }

  void skipBlankLines(int format, {int? limit}) {
    final scope = limit == null ? source : source.substring(0, limit);
    while (pos < scope.length) {
      final blank = matchAt(blankLineRe, scope, pos);
      if (blank == null) {
        return;
      }
      pushContent(pos + blank.group(0)!.length, format);
    }
  }
}

final RegExp blankLineRe = RegExp(r'[ \t\r]*\n');
final RegExp onlyWhitespaceRe = RegExp(r'^[ \t\r\n]*$');

String? sourceCharAt(String s, int index) =>
    index >= 0 && index < s.length ? s[index] : null;

int indexOfFrom(String s, String pattern, int start) {
  if (start > s.length) {
    return -1;
  }
  return s.indexOf(pattern, math.max(0, start));
}

bool sourceStartsWith(String s, String pattern, int index) =>
    index >= 0 && index <= s.length && s.startsWith(pattern, index);

Match? matchAt(RegExp re, String s, int pos) =>
    pos > s.length ? null : re.matchAsPrefix(s, pos);

bool isLineSpace(String? c) => c == ' ' || c == '\t' || c == '\r';

int skipLineSpace(String s, int index) {
  var position = index;
  while (isLineSpace(sourceCharAt(s, position))) {
    position += 1;
  }
  return position;
}

int lineEndFrom(String s, int index) {
  final newline = indexOfFrom(s, '\n', index);
  return newline < 0 ? s.length : newline;
}

final String replacementCharacter = String.fromCharCode(0xFFFD);
final RegExp _unpairedSurrogateRe = RegExp(
  r'[\uD800-\uDBFF](?![\uDC00-\uDFFF])|(?<![\uD800-\uDBFF])[\uDC00-\uDFFF]',
);

bool equalsParserText(String sourceText, String parserText) =>
    sourceText == parserText ||
    sourceText.replaceAll(_unpairedSurrogateRe, replacementCharacter) ==
        parserText;
