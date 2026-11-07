import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/utils/first_strong_text_direction.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

import 'support/native_test_parser.dart';

String? _noEmojiUrl(String unicode) => null;

String _noCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

Future<TextDirection?> _paragraphDirection(
  WidgetTester tester,
  String data,
  TextDirection ambient,
) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Directionality(
        textDirection: ambient,
        child: Scaffold(
          body: FluxerMarkdown(
            astParser: parseTestMarkdownAst,
            data: data,
            config: const FluxerMarkdownConfig(
              unicodeEmojiUrlBuilder: _noEmojiUrl,
              customEmojiUrlBuilder: _noCustomEmojiUrl,
            ),
            baseStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return tester.widget<RichText>(find.byType(RichText).first).textDirection;
}

void main() {
  group('firstStrongTextDirection', () {
    test('detects Hebrew and Arabic', () {
      expect(firstStrongTextDirection('שלום'), TextDirection.rtl);
      expect(firstStrongTextDirection('مرحبا'), TextDirection.rtl);
    });

    test('detects Latin and other LTR scripts', () {
      expect(firstStrongTextDirection('hello'), TextDirection.ltr);
      expect(firstStrongTextDirection('Привет'), TextDirection.ltr);
    });

    test('skips neutral characters', () {
      expect(firstStrongTextDirection('123, (שלום) hello'), TextDirection.rtl);
      expect(firstStrongTextDirection('!? 42 hello שלום'), TextDirection.ltr);
    });

    test('returns null without a strong character', () {
      expect(firstStrongTextDirection(''), isNull);
      expect(firstStrongTextDirection('123 !?'), isNull);
    });
  });

  group('paragraph direction', () {
    testWidgets('Hebrew message is RTL in an LTR UI', (tester) async {
      expect(
        await _paragraphDirection(tester, 'שלום world', TextDirection.ltr),
        TextDirection.rtl,
      );
    });

    testWidgets('English message is LTR in an RTL UI', (tester) async {
      expect(
        await _paragraphDirection(tester, 'hello עולם', TextDirection.rtl),
        TextDirection.ltr,
      );
    });

    testWidgets('formatting does not hide the first strong character', (
      tester,
    ) async {
      expect(
        await _paragraphDirection(tester, '**שלום** world', TextDirection.ltr),
        TextDirection.rtl,
      );
    });
  });
}
