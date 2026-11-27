import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_markdown_wrap.dart';

TextEditingValue _selected(String text, int start, int end) {
  return TextEditingValue(
    text: text,
    selection: TextSelection(baseOffset: start, extentOffset: end),
  );
}

void main() {
  test('wraps an unformatted selection and keeps it selected', () {
    final TextEditingValue next = toggleMarkdownWrap(
      _selected('say hello now', 4, 9),
      '**',
    );
    expect(next.text, 'say **hello** now');
    expect(
      next.selection,
      const TextSelection(baseOffset: 6, extentOffset: 11),
    );
  });

  test('unwraps when the selection includes the markers', () {
    final TextEditingValue next = toggleMarkdownWrap(
      _selected('say __hello__ now', 4, 13),
      '__',
    );
    expect(next.text, 'say hello now');
    expect(next.selection, const TextSelection(baseOffset: 4, extentOffset: 9));
  });

  test('unwraps when the markers flank the selection', () {
    final TextEditingValue next = toggleMarkdownWrap(
      _selected('say ~~hello~~ now', 6, 11),
      '~~',
    );
    expect(next.text, 'say hello now');
    expect(next.selection, const TextSelection(baseOffset: 4, extentOffset: 9));
  });

  test('italic inside bold adds a third asterisk run', () {
    final TextEditingValue next = toggleMarkdownWrap(
      _selected('**hi**', 2, 4),
      '*',
    );
    expect(next.text, '***hi***');
    expect(next.selection, const TextSelection(baseOffset: 3, extentOffset: 5));
  });

  test('italic flanked by an odd asterisk run unwraps', () {
    final TextEditingValue next = toggleMarkdownWrap(
      _selected('*hi*', 1, 3),
      '*',
    );
    expect(next.text, 'hi');
  });

  test('keeps a backward selection backward', () {
    final TextEditingValue next = toggleMarkdownWrap(
      _selected('hello', 5, 0),
      '*',
    );
    expect(next.text, '*hello*');
    expect(next.selection, const TextSelection(baseOffset: 6, extentOffset: 1));
  });

  test('leaves a collapsed selection alone', () {
    final TextEditingValue value = _selected('hello', 2, 2);
    expect(toggleMarkdownWrap(value, '**'), same(value));
  });
}
