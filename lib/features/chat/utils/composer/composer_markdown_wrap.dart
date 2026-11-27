import 'package:flutter/services.dart';

enum _WrapClass { inside, flank, none }

const Map<String, ({bool shift, String wrapper})> _markdownShortcuts =
    <String, ({bool shift, String wrapper})>{
      'b': (shift: false, wrapper: '**'),
      'i': (shift: false, wrapper: '*'),
      'u': (shift: false, wrapper: '__'),
      's': (shift: true, wrapper: '~~'),
    };

String? composerMarkdownShortcutWrapper(KeyEvent event) {
  final HardwareKeyboard keyboard = HardwareKeyboard.instance;
  if (!(keyboard.isControlPressed || keyboard.isMetaPressed) ||
      keyboard.isAltPressed) {
    return null;
  }
  final String label = event.logicalKey.keyLabel.toLowerCase();
  final ({bool shift, String wrapper})? shortcut = _markdownShortcuts[label];
  if (shortcut == null || keyboard.isShiftPressed != shortcut.shift) {
    return null;
  }
  return shortcut.wrapper;
}

int _countRunForward(String text, int start, String character) {
  var end = start;
  while (end < text.length && text[end] == character) {
    end += 1;
  }
  return end - start;
}

int _countRunBackward(String text, int end, String character) {
  var start = end;
  while (start > 0 && text[start - 1] == character) {
    start -= 1;
  }
  return end - start;
}

bool _asteriskRunContainsFormat(int runLength, int markerLength) {
  return markerLength == 1 ? runLength.isOdd : runLength >= 2;
}

_WrapClass _classifyAsteriskWrap(
  String text,
  int start,
  int end,
  int markerLength,
) {
  final int selectedLeading = _countRunForward(text, start, '*');
  final int selectedTrailing = _countRunBackward(text, end, '*');
  if (_asteriskRunContainsFormat(selectedLeading, markerLength) &&
      _asteriskRunContainsFormat(selectedTrailing, markerLength) &&
      end - start >= selectedLeading + selectedTrailing) {
    return _WrapClass.inside;
  }
  final int flankingLeading = _countRunBackward(text, start, '*');
  final int flankingTrailing = _countRunForward(text, end, '*');
  if (_asteriskRunContainsFormat(flankingLeading, markerLength) &&
      _asteriskRunContainsFormat(flankingTrailing, markerLength)) {
    return _WrapClass.flank;
  }
  return _WrapClass.none;
}

_WrapClass _classifyWrap(String text, int start, int end, String wrapper) {
  if (wrapper == '*' || wrapper == '**') {
    return _classifyAsteriskWrap(text, start, end, wrapper.length);
  }
  final String selected = text.substring(start, end);
  if (selected.length >= wrapper.length * 2 &&
      selected.startsWith(wrapper) &&
      selected.endsWith(wrapper)) {
    return _WrapClass.inside;
  }
  if (start >= wrapper.length &&
      end + wrapper.length <= text.length &&
      text.substring(start - wrapper.length, start) == wrapper &&
      text.substring(end, end + wrapper.length) == wrapper) {
    return _WrapClass.flank;
  }
  return _WrapClass.none;
}

TextEditingValue toggleMarkdownWrap(TextEditingValue value, String wrapper) {
  final TextSelection selection = value.selection;
  if (!selection.isValid || selection.isCollapsed) {
    return value;
  }
  final String text = value.text;
  final int start = selection.start;
  final int end = selection.end;
  final bool backward = selection.baseOffset > selection.extentOffset;
  final int length = wrapper.length;
  TextSelection select(int nextStart, int nextEnd) {
    return backward
        ? TextSelection(baseOffset: nextEnd, extentOffset: nextStart)
        : TextSelection(baseOffset: nextStart, extentOffset: nextEnd);
  }

  switch (_classifyWrap(text, start, end, wrapper)) {
    case _WrapClass.inside:
      return TextEditingValue(
        text:
            text.substring(0, start) +
            text.substring(start + length, end - length) +
            text.substring(end),
        selection: select(start, end - length * 2),
      );
    case _WrapClass.flank:
      return TextEditingValue(
        text:
            text.substring(0, start - length) +
            text.substring(start, end) +
            text.substring(end + length),
        selection: select(start - length, end - length),
      );
    case _WrapClass.none:
      return TextEditingValue(
        text:
            text.substring(0, start) +
            wrapper +
            text.substring(start, end) +
            wrapper +
            text.substring(end),
        selection: select(start + length, end + length),
      );
  }
}
