import 'dart:math' as math;

const String _indent = '\t';
const int _spaceIndentWidth = 4;
const String _fence = '```';
final RegExp _leadingSpace = RegExp(r'^[ \t\r]+');
final RegExp _trailingSpace = RegExp(r'[ \t\r]+$');
final RegExp _fenceLanguage = RegExp(r'^[\w+.#/-]+[ \t\r]*$');
final RegExp _listItem = RegExp(r'^( *)(?:[-*]|\d+\.) ');
final RegExp _inlineCodeRun = RegExp('`+');
final RegExp _invisible = RegExp(
  r'[\p{White_Space}\0\u00ad\u061c\u115f\u1160\u180e\u200b-\u200f\u202a-\u202e\u2060-\u2069\u2800\u3164\ufeff\uffa0]|\u034f|\u17b4|\u17b5|[\ufe00-\ufe0f]|[\u{e0100}-\u{e01ef}]',
  unicode: true,
);

class CodeIndentEdit {
  const CodeIndentEdit({
    required this.start,
    required this.end,
    required this.text,
  });

  final int start;
  final int end;
  final String text;
}

class CodeIndentPlan {
  const CodeIndentPlan({
    required this.edits,
    required this.selectionStart,
    required this.selectionEnd,
  });

  final List<CodeIndentEdit> edits;
  final int selectionStart;
  final int selectionEnd;
}

class _CodeBlockBody {
  const _CodeBlockBody({
    required this.start,
    required this.end,
    required this.rendered,
  });

  final int start;
  final int end;
  final bool rendered;
}

class _SourceLine {
  const _SourceLine(this.text, this.offset);

  final String text;
  final int offset;
}

class _LinePoint {
  const _LinePoint(this.index, this.column);

  final int index;
  final int column;
}

class _ListItem {
  const _ListItem(this.level, this.content);

  final int level;
  final String content;
}

class _CodeBlockParse {
  const _CodeBlockParse(this.body, this.resume);

  final _CodeBlockBody? body;
  final _LinePoint? resume;
}

class _FenceClosing {
  const _FenceClosing(this.fenceIndex, this.runLength, this.trailing);

  final int fenceIndex;
  final int runLength;
  final String trailing;
}

class _ScanScope {
  _ScanScope({
    required this.bodies,
    required this.quoteContentStarts,
    required this.end,
    required this.quotes,
    required this.multilineQuotes,
    required this.rendered,
  });

  final List<_CodeBlockBody> bodies;
  final List<int> quoteContentStarts;
  final int end;
  final bool quotes;
  final bool multilineQuotes;
  final bool rendered;

  _ScanScope copyWith({
    int? end,
    bool? quotes,
    bool? multilineQuotes,
    bool? rendered,
  }) {
    return _ScanScope(
      bodies: bodies,
      quoteContentStarts: quoteContentStarts,
      end: end ?? this.end,
      quotes: quotes ?? this.quotes,
      multilineQuotes: multilineQuotes ?? this.multilineQuotes,
      rendered: rendered ?? this.rendered,
    );
  }
}

class _PhysicalLine {
  const _PhysicalLine({
    required this.start,
    required this.end,
    required this.contentStart,
    required this.text,
    required this.isCodeContent,
  });

  final int start;
  final int end;
  final int contentStart;
  final String text;
  final bool isCodeContent;
}

String _slice(String text, int start, [int? end]) {
  final int from = start.clamp(0, text.length);
  final int to = (end ?? text.length).clamp(0, text.length);
  if (to <= from) {
    return '';
  }
  return text.substring(from, to);
}

String? _charAt(String text, int index) {
  if (index < 0 || index >= text.length) {
    return null;
  }
  return text[index];
}

String _trimStart(String text) => text.replaceFirst(_leadingSpace, '');

String _trimEnd(String text) => text.replaceFirst(_trailingSpace, '');

bool _hasVisibleContent(String text) => text.replaceAll(_invisible, '') != '';

bool _hasOpenInlineCode(String text) {
  var open = 0;
  for (final RegExpMatch match in _inlineCodeRun.allMatches(text)) {
    final int length = match.end - match.start;
    if (open == 0) {
      open = length;
    } else if (open == length) {
      open = 0;
    }
  }
  return open > 0;
}

int _countLeadingSpaces(String text) {
  var spaces = 0;
  while (_charAt(text, spaces) == ' ') {
    spaces += 1;
  }
  return spaces;
}

_ListItem? _matchListItem(String text) {
  final RegExpMatch? match = _listItem.firstMatch(text);
  if (match == null || match.group(1)!.length == 1) {
    return null;
  }
  return _ListItem(
    match.group(1)!.length >> 1,
    _slice(text, match.group(0)!.length),
  );
}

bool _isBulletPointText(String text) {
  return _matchListItem(text) == null &&
      _trimStart(text).startsWith('- ') &&
      !text.startsWith('  ');
}

bool _startsBlockquote(String trimmed, _ScanScope scope) {
  return (scope.multilineQuotes && trimmed.startsWith('>>> ')) ||
      (scope.quotes && trimmed.startsWith('> '));
}

_FenceClosing? _findCodeBlockClosing(
  String line,
  String fence,
  int fenceLength,
) {
  var trimmedStart = 0;
  while (true) {
    final String? char = _charAt(line, trimmedStart);
    if (char != ' ' && char != '\t' && char != '\r') {
      break;
    }
    trimmedStart += 1;
  }
  final String trimmed = _slice(line, trimmedStart);
  final int relativeFenceIndex = trimmed.indexOf(fence);
  if (relativeFenceIndex < 0) {
    return null;
  }
  var runEnd = relativeFenceIndex;
  while (_charAt(trimmed, runEnd) == '`') {
    runEnd += 1;
  }
  final int count = runEnd - relativeFenceIndex;
  final String? after = _charAt(trimmed, runEnd);
  final String trailing = _slice(trimmed, runEnd);
  if (count < fenceLength ||
      (after != null &&
          after != ' ' &&
          after != '\t' &&
          after != '`' &&
          !trailing.contains(fence))) {
    return null;
  }
  return _FenceClosing(trimmedStart + relativeFenceIndex, count, trailing);
}

int _findOpeningFence(String text) {
  for (
    int fence = text.indexOf(_fence);
    fence >= 0;
    fence = text.indexOf(_fence, fence + 1)
  ) {
    var backslashes = 0;
    while (_charAt(text, fence - backslashes - 1) == r'\') {
      backslashes += 1;
    }
    if (backslashes.isEven) {
      return _hasOpenInlineCode(_slice(text, 0, fence)) ? -1 : fence;
    }
  }
  return -1;
}

List<_SourceLine> _splitLines(String text) {
  final List<_SourceLine> lines = <_SourceLine>[];
  var offset = 0;
  for (final String line in text.split('\n')) {
    lines.add(_SourceLine(line, offset));
    offset += line.length + 1;
  }
  return lines;
}

int _linesEnd(List<_SourceLine> lines) {
  final _SourceLine last = lines.last;
  return last.offset + last.text.length;
}

List<_SourceLine> _trimLineWindow(List<_SourceLine> lines) {
  var start = 0;
  var end = lines.length;
  while (start < end && _trimStart(lines[start].text) == '') {
    start += 1;
  }
  while (end > start && _trimStart(lines[end - 1].text) == '') {
    end -= 1;
  }
  final List<_SourceLine> window = lines.sublist(start, end);
  if (window.isEmpty) {
    return window;
  }
  final _SourceLine first = window.first;
  final String trimmed = _trimStart(first.text);
  window[0] = _SourceLine(
    trimmed,
    first.offset + first.text.length - trimmed.length,
  );
  final _SourceLine last = window.last;
  window[window.length - 1] = _SourceLine(_trimEnd(last.text), last.offset);
  return window;
}

bool _opensUnclosedBlock(_SourceLine line, int column, String info) {
  return column == line.text.length - _trimStart(line.text).length ||
      _fenceLanguage.hasMatch(info) ||
      _trimStart(info) == '';
}

int _findClosingLine(List<_SourceLine> lines, int from, String fence) {
  for (int position = from; position < lines.length; position += 1) {
    if (_findCodeBlockClosing(lines[position].text, fence, fence.length) !=
        null) {
      return position;
    }
  }
  return lines.length;
}

int _resumeAt(List<_SourceLine> lines, _LinePoint point) {
  final _SourceLine line = lines[point.index];
  if (point.column >= line.text.length) {
    return point.index + 1;
  }
  lines[point.index] = _SourceLine(
    _slice(line.text, point.column),
    line.offset + point.column,
  );
  return point.index;
}

int _resumeIndex(List<_SourceLine> lines, _LinePoint point) {
  return point.column >= lines[point.index].text.length
      ? point.index + 1
      : point.index;
}

_CodeBlockParse _parseCodeBlock(
  List<_SourceLine> lines,
  int index,
  int column,
  _ScanScope scope,
) {
  final _SourceLine line = lines[index];
  var infoStart = column;
  while (_charAt(line.text, infoStart) == '`') {
    infoStart += 1;
  }
  final String fence = _slice(line.text, column, infoStart);
  final int start = line.offset + infoStart;
  final String info = _slice(line.text, infoStart);
  final int inlineEnd = info.indexOf(fence);
  if (inlineEnd >= 0) {
    final bool visible = _hasVisibleContent(_slice(info, 0, inlineEnd));
    return _CodeBlockParse(
      _CodeBlockBody(
        start: start,
        end: start + inlineEnd,
        rendered: visible && scope.rendered,
      ),
      visible ? _LinePoint(index, infoStart + inlineEnd + fence.length) : null,
    );
  }
  final int closingLine = _findClosingLine(lines, index + 1, fence);
  if (closingLine < lines.length) {
    final StringBuffer content = StringBuffer(
      _fenceLanguage.hasMatch(info) ? '' : info,
    );
    for (int between = index + 1; between < closingLine; between += 1) {
      content.write(lines[between].text);
    }
    final _SourceLine closingSource = lines[closingLine];
    final _FenceClosing closing = _findCodeBlockClosing(
      closingSource.text,
      fence,
      fence.length,
    )!;
    content.write(_slice(closingSource.text, 0, closing.fenceIndex));
    final bool visible = _hasVisibleContent(content.toString());
    final int trailingStart =
        closing.fenceIndex +
        (closing.trailing.isNotEmpty ? closing.runLength : fence.length);
    return _CodeBlockParse(
      _CodeBlockBody(
        start: start,
        end: closingSource.offset + closing.fenceIndex,
        rendered: visible && scope.rendered,
      ),
      visible ? _LinePoint(closingLine, trailingStart) : null,
    );
  }
  if (!_opensUnclosedBlock(line, column, info)) {
    return const _CodeBlockParse(null, null);
  }
  return _CodeBlockParse(
    _CodeBlockBody(start: start, end: scope.end, rendered: false),
    null,
  );
}

int _scanParagraph(List<_SourceLine> lines, int index, _ScanScope scope) {
  var next = index + 1;
  while (next < lines.length) {
    final String trimmed = _trimStart(lines[next].text);
    if (trimmed == '' ||
        trimmed.startsWith(_fence) ||
        _matchListItem(trimmed) != null ||
        _startsBlockquote(trimmed, scope)) {
      return next;
    }
    final int fence = _findOpeningFence(lines[next].text);
    if (fence >= 0) {
      final _CodeBlockParse parsed = _parseCodeBlock(lines, next, fence, scope);
      if (parsed.resume != null) {
        return next;
      }
      if (parsed.body != null) {
        scope.bodies.add(parsed.body!);
      }
    }
    next += 1;
  }
  return next;
}

int _scanQuote(List<_SourceLine> lines, int index, _ScanScope scope) {
  final List<_SourceLine> quoted = <_SourceLine>[];
  var next = index;
  while (next < lines.length) {
    final _SourceLine line = lines[next];
    final String trimmed = _trimStart(line.text);
    if (!trimmed.startsWith('> ')) {
      break;
    }
    final int offset = line.offset + line.text.length - trimmed.length + 2;
    quoted.add(_SourceLine(_slice(trimmed, 2), offset));
    scope.quoteContentStarts.add(offset);
    next += 1;
  }
  _scanBlocks(quoted, scope.copyWith(quotes: false, end: _linesEnd(quoted)));
  return next;
}

int _scanSpoiler(List<_SourceLine> lines, int index, _ScanScope scope) {
  final _SourceLine line = lines[index];
  final int open = line.text.indexOf('||') + 2;
  final List<_SourceLine> children = <_SourceLine>[
    _SourceLine(_slice(line.text, open), line.offset + open),
  ];
  for (int next = index + 1; next < lines.length; next += 1) {
    final int close = lines[next].text.indexOf('||');
    if (close < 0) {
      children.add(lines[next]);
      continue;
    }
    children.add(
      _SourceLine(_slice(lines[next].text, 0, close), lines[next].offset),
    );
    if (!children.any((_SourceLine child) => _hasVisibleContent(child.text))) {
      return next + 1;
    }
    final List<_SourceLine> window = _trimLineWindow(children);
    _scanBlocks(window, scope.copyWith(end: _linesEnd(window)));
    return _resumeAt(lines, _LinePoint(next, close + 2));
  }
  _scanBlocks(
    children,
    scope.copyWith(rendered: false, end: _linesEnd(children)),
  );
  return lines.length;
}

int _scanListFence(List<_SourceLine> lines, int index, _ScanScope scope) {
  if (index >= lines.length) {
    return index;
  }
  final _SourceLine line = lines[index];
  final String trimmed = _trimStart(line.text);
  if (!trimmed.startsWith(_fence)) {
    return index;
  }
  final _CodeBlockParse parsed = _parseCodeBlock(
    lines,
    index,
    line.text.length - trimmed.length,
    scope,
  );
  if (parsed.body == null || parsed.resume == null) {
    return index;
  }
  scope.bodies.add(parsed.body!);
  return _resumeIndex(lines, parsed.resume!);
}

int _scanList(List<_SourceLine> lines, int index, _ScanScope scope) {
  final int level = _matchListItem(lines[index].text)?.level ?? 0;
  var next = index;
  while (next < lines.length) {
    final String text = lines[next].text;
    final String trimmed = _trimStart(text);
    if (trimmed.startsWith('#') || _startsBlockquote(trimmed, scope)) {
      return next;
    }
    final _ListItem? item = _matchListItem(text);
    if (item != null) {
      next = _matchListItem(item.content) == null
          ? _scanListFence(lines, next + 1, scope)
          : next + 1;
      continue;
    }
    if (!_isBulletPointText(text) && _countLeadingSpaces(text) <= level * 2) {
      return next;
    }
    next += 1;
  }
  return next;
}

int _scanBlock(List<_SourceLine> lines, int index, _ScanScope scope) {
  final _SourceLine line = lines[index];
  final String trimmed = _trimStart(line.text);
  if (trimmed.startsWith('>>> ')) {
    if (!scope.multilineQuotes) {
      return index + 1;
    }
    final _SourceLine quoted = _SourceLine(
      _slice(trimmed, 4),
      line.offset + line.text.length - trimmed.length + 4,
    );
    _scanBlocks(<_SourceLine>[
      quoted,
      ...lines.sublist(index + 1),
    ], scope.copyWith(quotes: true, multilineQuotes: false));
    return lines.length;
  }
  if (trimmed.startsWith('> ')) {
    return scope.quotes
        ? _scanQuote(lines, index, scope)
        : _scanParagraph(lines, index, scope);
  }
  if (_matchListItem(line.text) != null) {
    return _scanList(lines, index, scope);
  }
  if (trimmed.startsWith('||') && !trimmed.contains('||', 2)) {
    return _scanSpoiler(lines, index, scope);
  }
  final int fence = _findOpeningFence(line.text);
  if (fence >= 0) {
    final _CodeBlockParse parsed = _parseCodeBlock(lines, index, fence, scope);
    if (parsed.body != null) {
      scope.bodies.add(parsed.body!);
    }
    if (parsed.resume != null) {
      return _resumeAt(lines, parsed.resume!);
    }
  }
  return _scanParagraph(lines, index, scope);
}

void _scanBlocks(List<_SourceLine> lines, _ScanScope scope) {
  var index = 0;
  while (index < lines.length) {
    index = _trimStart(lines[index].text) == ''
        ? index + 1
        : _scanBlock(lines, index, scope);
  }
}

_ScanScope _scanSource(String text) {
  final _ScanScope scope = _ScanScope(
    bodies: <_CodeBlockBody>[],
    quoteContentStarts: <int>[],
    end: text.length,
    quotes: true,
    multilineQuotes: true,
    rendered: true,
  );
  _scanBlocks(_splitLines(text), scope);
  return scope;
}

bool isOffsetInsideCodeBlock(String text, int offset) {
  return _scanSource(text).bodies.any(
    (_CodeBlockBody body) => body.start <= offset && offset <= body.end,
  );
}

List<_PhysicalLine> _scanLines(String text) {
  final _ScanScope scope = _scanSource(text);
  return _splitLines(text).map((_SourceLine source) {
    final int start = source.offset;
    final int end = start + source.text.length;
    final int contentStart = scope.quoteContentStarts.fold<int>(
      start,
      (int current, int offset) =>
          current <= offset && offset <= end ? offset : current,
    );
    return _PhysicalLine(
      start: start,
      end: end,
      contentStart: contentStart,
      text: _slice(text, contentStart, end),
      isCodeContent: scope.bodies.any(
        (_CodeBlockBody body) =>
            contentStart >= body.start &&
            (end <= body.end ||
                _trimStart(_slice(text, contentStart, body.end)) != ''),
      ),
    );
  }).toList();
}

int _lineAt(List<_PhysicalLine> lines, int offset) {
  for (int i = 0; i < lines.length; i += 1) {
    if (offset >= lines[i].start && offset <= lines[i].end) {
      return i;
    }
  }
  return lines.length - 1;
}

CodeIndentPlan? analyzeCodeIndent(
  String text,
  int selectionStart,
  int selectionEnd, {
  required bool unindent,
}) {
  final List<_PhysicalLine> lines = _scanLines(text);
  final int startLine = _lineAt(lines, selectionStart);
  var endLine = _lineAt(lines, selectionEnd);
  if (selectionEnd > selectionStart &&
      selectionEnd == lines[endLine].start &&
      endLine > 0) {
    endLine -= 1;
  }
  for (int i = startLine; i <= endLine; i += 1) {
    if (!lines[i].isCodeContent) {
      return null;
    }
  }
  if (!unindent && selectionStart == selectionEnd) {
    return CodeIndentPlan(
      edits: <CodeIndentEdit>[
        CodeIndentEdit(
          start: selectionStart,
          end: selectionStart,
          text: _indent,
        ),
      ],
      selectionStart: selectionStart + _indent.length,
      selectionEnd: selectionStart + _indent.length,
    );
  }
  final int rangeStart = math.max(
    selectionStart,
    lines[startLine].contentStart,
  );
  final int rangeEnd = math.max(rangeStart, selectionEnd);
  final List<CodeIndentEdit> edits = <CodeIndentEdit>[];
  var startDelta = 0;
  var endDelta = 0;
  for (int i = startLine; i <= endLine; i += 1) {
    final _PhysicalLine line = lines[i];
    if (unindent) {
      var removed = 0;
      if (line.text.startsWith(_indent)) {
        removed = 1;
      } else {
        while (removed < _spaceIndentWidth &&
            _charAt(line.text, removed) == ' ') {
          removed += 1;
        }
      }
      if (removed == 0) {
        continue;
      }
      edits.add(
        CodeIndentEdit(
          start: line.contentStart,
          end: line.contentStart + removed,
          text: '',
        ),
      );
      startDelta -= math.min(
        removed,
        math.max(0, rangeStart - line.contentStart),
      );
      endDelta -= math.min(removed, math.max(0, rangeEnd - line.contentStart));
    } else {
      edits.add(
        CodeIndentEdit(
          start: line.contentStart,
          end: line.contentStart,
          text: _indent,
        ),
      );
      if (line.contentStart <= rangeStart) {
        startDelta += _indent.length;
      }
      if (line.contentStart <= rangeEnd) {
        endDelta += _indent.length;
      }
    }
  }
  if (edits.isEmpty) {
    return null;
  }
  return CodeIndentPlan(
    edits: edits,
    selectionStart: math.max(0, rangeStart + startDelta),
    selectionEnd: math.max(0, rangeEnd + endDelta),
  );
}
