import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/utils/ansi_palette.dart';
import 'package:fluxer_markdown/src/utils/ansi_text_parser.dart';
import 'package:material_ui/material_ui.dart';

TextSpan _onlySpan(List<InlineSpan> spans) {
  expect(spans, hasLength(1));
  return spans.single as TextSpan;
}

TextSpan _spanAt(List<InlineSpan> spans, int index) => spans[index] as TextSpan;

void main() {
  const TextStyle base = TextStyle(
    fontFamily: 'monospace',
    fontSize: 14,
    color: Color(0xFFCCCCCC),
  );

  late AnsiPalette palette;

  setUp(() {
    palette = AnsiPalette.fallback(isDark: true);
  });

  group('parseAnsiTextSpans', () {
    test('applies standard foreground red', () {
      final spans = parseAnsiTextSpans(
        '\x1B[31mhello\x1B[0m',
        base,
        palette: palette,
      );
      final TextSpan colored = _onlySpan(spans);
      expect(colored.text, 'hello');
      expect(colored.style?.color, palette.foreground[AnsiFg.red]);
    });

    test('applies standard background blue', () {
      final spans = parseAnsiTextSpans(
        '\x1B[44mline\x1B[0m',
        base,
        palette: palette,
      );
      final TextSpan colored = _onlySpan(spans);
      expect(colored.style?.backgroundColor, palette.background[AnsiBg.blue]);
    });

    test('reset restores base style', () {
      final spans = parseAnsiTextSpans(
        '\x1B[31mred\x1B[0mplain',
        base,
        palette: palette,
      );
      expect(spans, hasLength(2));
      expect(_spanAt(spans, 0).style?.color, palette.foreground[AnsiFg.red]);
      expect(_spanAt(spans, 1).style?.color, base.color);
      expect(_spanAt(spans, 1).text, 'plain');
    });

    test('256-color foreground', () {
      final spans = parseAnsiTextSpans(
        '\x1B[38;5;196mbright\x1B[0m',
        base,
        palette: palette,
      );
      final TextSpan colored = _onlySpan(spans);
      expect(colored.style?.color, const Color(0xFFFF0000));
    });

    test('truecolor foreground', () {
      final spans = parseAnsiTextSpans(
        '\x1B[38;2;255;128;0morange\x1B[0m',
        base,
        palette: palette,
      );
      final TextSpan colored = _onlySpan(spans);
      expect(colored.style?.color, const Color(0xFFFF8000));
    });

    test('bold and red combine', () {
      final spans = parseAnsiTextSpans(
        '\x1B[1;31mbold red\x1B[0m',
        base,
        palette: palette,
      );
      final TextSpan colored = _onlySpan(spans);
      expect(colored.style?.fontWeight, FontWeight.bold);
      expect(colored.style?.color, palette.foreground[AnsiFg.red]);
    });

    test('inverse swaps default fg and bg', () {
      final spans = parseAnsiTextSpans(
        '\x1B[7minverse\x1B[0m',
        base,
        palette: palette,
      );
      final TextSpan colored = _onlySpan(spans);
      expect(colored.style?.color, palette.codeBlockBg);
      expect(colored.style?.backgroundColor, palette.textPrimary);
    });

    test('conceal uses transparent foreground', () {
      final spans = parseAnsiTextSpans(
        '\x1B[8mhidden\x1B[0m',
        base,
        palette: palette,
      );
      final TextSpan colored = _onlySpan(spans);
      expect(colored.style?.color, Colors.transparent);
    });

    test('merges adjacent text with the same style', () {
      final spans = parseAnsiTextSpans(
        '\x1B[31ma\x1B[0m\x1B[31mb\x1B[0m',
        base,
        palette: palette,
      );
      final TextSpan merged = _onlySpan(spans);
      expect(merged.text, 'ab');
      expect(merged.style?.color, palette.foreground[AnsiFg.red]);
    });

    test('plain text without escapes uses base style', () {
      final spans = parseAnsiTextSpans('plain', base, palette: palette);
      final TextSpan span = _onlySpan(spans);
      expect(span.text, 'plain');
      expect(span.style, base);
    });
  });
}
