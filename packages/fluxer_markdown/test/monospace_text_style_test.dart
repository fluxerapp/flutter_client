import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/utils/monospace_text_style.dart';

void main() {
  group('codeTextStyleFrom', () {
    test('drops package when falling back to generic monospace', () {
      const TextStyle base = TextStyle(fontSize: 16, fontFamily: 'IBMPlexSans');

      final TextStyle codeStyle = codeTextStyleFrom(base);

      expect(codeStyle.fontFamily, kDefaultMonospaceFontFamily);
      expect(codeStyle.fontSize, 16 * 0.85);
    });

    test('uses configured code text style when provided', () {
      const TextStyle base = TextStyle(fontSize: 16, fontFamily: 'IBMPlexSans');
      const TextStyle mono = TextStyle(fontSize: 14, fontFamily: 'IBMPlexMono');

      final TextStyle codeStyle = codeTextStyleFrom(
        base,
        codeTextStyle: mono,
        color: const Color(0xFF123456),
      );

      expect(codeStyle.fontFamily, 'IBMPlexMono');
      expect(codeStyle.fontSize, 14 * 0.85);
      expect(codeStyle.color, const Color(0xFF123456));
    });
  });
}
