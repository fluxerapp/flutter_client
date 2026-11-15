import 'package:fluxer_markdown_native/src/source_spans/align_context.dart';
import 'package:fluxer_markdown_native/src/source_spans/source_span.dart';

final String _textPresentationSelector = String.fromCharCode(0xFE0F);
final Map<String, String> _plaintextSymbolShortcodes = <String, String>{
  String.fromCharCode(0x2122): ':tm:',
  String.fromCharCode(0x00A9): ':copyright:',
  String.fromCharCode(0x00AE): ':registered:',
};
final RegExp _droppedWhitespaceRe = RegExp(r'[ \t\r]+\n');
final RegExp _lineWhitespaceRe = RegExp(r'[ \t\r]+');
final RegExp _whitespaceCharRe = RegExp(r'\s');

void alignText(String content, int format, AlignContext ctx) {
  final advance = _advancePastText(
    ctx.source,
    ctx.pos,
    content,
    ctx.listIndentLevel,
    format,
  );
  for (final (int start, int end) in advance.markers) {
    ctx
      ..pushContent(start, format)
      ..pushMarker(end - start, format);
  }
  ctx.pushContent(advance.end, format);
  if (!advance.complete) {
    ctx.failed = true;
  }
}

int listContinuationEnd(String source, int start, int indentLevel) {
  var position = start;
  while (sourceCharAt(source, position) == '\n') {
    var spaces = 0;
    while (sourceCharAt(source, position + 1 + spaces) == ' ') {
      spaces += 1;
    }
    if (spaces <= indentLevel * 2) {
      break;
    }
    var contentStart = position + 1 + spaces;
    while (sourceCharAt(source, contentStart) == '\t' ||
        sourceCharAt(source, contentStart) == '\r') {
      contentStart += 1;
    }
    position = contentStart;
  }
  return position;
}

int _runLength(String value, int start, String char) {
  var length = 0;
  while (sourceCharAt(value, start + length) == char) {
    length += 1;
  }
  return length;
}

bool _isUnpairedSurrogateAt(String text, int index) {
  if (index < 0 || index >= text.length) {
    return false;
  }
  final code = text.codeUnitAt(index);
  if (code >= 0xD800 && code <= 0xDBFF) {
    if (index + 1 >= text.length) {
      return true;
    }
    final next = text.codeUnitAt(index + 1);
    return next < 0xDC00 || next > 0xDFFF;
  }
  if (code >= 0xDC00 && code <= 0xDFFF) {
    if (index == 0) {
      return true;
    }
    final previous = text.codeUnitAt(index - 1);
    return previous < 0xD800 || previous > 0xDBFF;
  }
  return false;
}

({int end, List<(int, int)> markers, bool complete}) _advancePastText(
  String source,
  int start,
  String content,
  int? listIndentLevel,
  int format,
) {
  final markers = <(int, int)>[];
  var pos = start;
  var ci = 0;
  while (ci < content.length && pos < source.length) {
    if (source[pos] == r'\') {
      final sourceRun = _runLength(source, pos, r'\');
      final contentRun = _runLength(content, ci, r'\');
      if (contentRun > 0 && contentRun == sourceRun) {
        pos += sourceRun;
        ci += sourceRun;
        continue;
      }
      if (contentRun > 0 && contentRun == sourceRun ~/ 2) {
        for (var pair = 0; pair < contentRun; pair += 1) {
          markers.add((pos + pair * 2, pos + pair * 2 + 1));
        }
        pos += contentRun * 2;
        ci += contentRun;
        continue;
      }
      if (contentRun == 0 &&
          pos + 1 < source.length &&
          source[pos + 1] == content[ci]) {
        markers.add((pos, pos + 1));
        pos += 2;
        ci += 1;
        continue;
      }
    }
    if (source[pos] == content[ci]) {
      pos += 1;
      ci += 1;
      if (sourceCharAt(source, pos) == _textPresentationSelector &&
          _plaintextSymbolShortcodes.containsKey(source[pos - 1])) {
        pos += 1;
      }
      continue;
    }
    final symbolShortcode = _plaintextSymbolShortcodes[content[ci]];
    if (symbolShortcode != null &&
        sourceStartsWith(source, symbolShortcode, pos)) {
      pos += symbolShortcode.length;
      ci += 1;
      continue;
    }
    if (content[ci] == replacementCharacter &&
        _isUnpairedSurrogateAt(source, pos)) {
      pos += 1;
      ci += 1;
      continue;
    }
    if (content[ci] == '\n') {
      final dropped = matchAt(_droppedWhitespaceRe, source, pos);
      if (dropped != null) {
        pos += dropped.group(0)!.length;
        ci += 1;
        continue;
      }
    }
    if (_whitespaceCharRe.hasMatch(source[pos]) &&
        _whitespaceCharRe.hasMatch(content[ci])) {
      pos += 1;
      ci += 1;
      continue;
    }
    if (pos == 0 || source[pos - 1] == '\n') {
      final indent = matchAt(_lineWhitespaceRe, source, pos);
      if (indent != null) {
        pos += indent.group(0)!.length;
        continue;
      }
    }
    if ((format & MdSpanFormat.italic) != 0 &&
        (source[pos] == '*' || source[pos] == '_')) {
      markers.add((pos, pos + 1));
      pos += 1;
      continue;
    }
    if (listIndentLevel != null) {
      final continuationEnd = listContinuationEnd(
        source,
        pos,
        listIndentLevel,
      );
      if (continuationEnd > pos) {
        pos = continuationEnd;
        continue;
      }
    }
    break;
  }
  return (end: pos, markers: markers, complete: ci == content.length);
}
