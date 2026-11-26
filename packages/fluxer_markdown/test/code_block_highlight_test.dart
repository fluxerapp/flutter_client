import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:fluxer_markdown/src/utils/code_block_highlight.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  setUp(() {
    ensureFluxerMarkdownLanguagesRegistered();
    clearMarkdownParseCaches();
  });

  test('caches highlight spans by code, language, and brightness', () {
    const String code = 'void main() {}';
    final List<TextSpan> first = highlightedCodeSpans(
      code: code,
      language: 'dart',
      isDark: false,
    );
    final List<TextSpan> second = highlightedCodeSpans(
      code: code,
      language: 'dart',
      isDark: false,
    );
    expect(identical(first, second), isTrue);
    expect(first, isNotEmpty);

    final List<TextSpan> dark = highlightedCodeSpans(
      code: code,
      language: 'dart',
      isDark: true,
    );
    expect(identical(first, dark), isFalse);
  });

  test('background highlight parses in an isolate and is cached', () async {
    final BackgroundCodeHighlight first = backgroundCodeHighlight(
      code: 'final\tx = 1;',
      language: 'dart',
    );
    expect(first.isComplete, isFalse);
    expect(first.code, 'final        x = 1;');
    await first.done;
    expect(first.isComplete, isTrue);
    final List<TextSpan>? spans = first.colorSpans(isDark: true);
    expect(spans, isNotNull);
    expect(spans!.any((TextSpan span) => span.style?.color != null), isTrue);
    expect(
      identical(
        first,
        backgroundCodeHighlight(code: 'final\tx = 1;', language: 'dart'),
      ),
      isTrue,
    );
  });

  test('background highlight cache evicts least recently used', () async {
    final BackgroundCodeHighlight oldest = backgroundCodeHighlight(
      code: 'var a0 = 0;',
      language: 'dart',
    );
    final List<Future<void>> pending = <Future<void>>[oldest.done];
    for (var i = 1; i <= kBackgroundHighlightCacheMaxEntries; i++) {
      pending.add(
        backgroundCodeHighlight(code: 'var a$i = $i;', language: 'dart').done,
      );
    }
    final BackgroundCodeHighlight again = backgroundCodeHighlight(
      code: 'var a0 = 0;',
      language: 'dart',
    );
    pending.add(again.done);
    await Future.wait(pending);
    expect(identical(oldest, again), isFalse);
  });

  testWidgets('large code blocks render plain text until highlighted', (
    tester,
  ) async {
    final String code = List<String>.filled(
      800,
      'final value = 42;',
    ).join('\n');
    expect(code.length, greaterThan(kHighlightSpanCacheMaxCodeLength));
    final BackgroundCodeHighlight? highlight = await tester.runAsync(
      () async => backgroundCodeHighlight(code: code, language: 'dart'),
    );

    await tester.pumpWidget(_HighlightHost(code: code));

    TextSpan rootSpan() =>
        tester.widget<RichText>(find.byType(RichText)).text as TextSpan;
    List<InlineSpan> children = rootSpan().children!;
    expect(children, hasLength(1));
    expect((children.single as TextSpan).text, code);
    expect((children.single as TextSpan).style, isNull);

    await tester.runAsync(() => highlight!.done);
    await tester.pump();

    children = rootSpan().children!;
    expect(children.length, greaterThan(1));
    expect(
      children.any((InlineSpan span) => span.style?.color != null),
      isTrue,
    );
  });

  testWidgets('small code blocks highlight synchronously', (tester) async {
    await tester.pumpWidget(const _HighlightHost(code: 'final value = 42;'));

    final TextSpan root =
        tester.widget<RichText>(find.byType(RichText)).text as TextSpan;
    expect(
      root.children!.any((InlineSpan span) => span.style?.color != null),
      isTrue,
    );
  });
}

class _HighlightHost extends StatelessWidget {
  const _HighlightHost({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SingleChildScrollView(
        child: FluxerHighlightedCode(
          code: code,
          language: 'dart',
          isDark: true,
          textStyle: const TextStyle(fontSize: 12),
          backgroundColor: const Color(0xFF000000),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
