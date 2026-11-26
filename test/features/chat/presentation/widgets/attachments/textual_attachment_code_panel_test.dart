import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_fonts.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_code_panel.dart';
import 'package:fluxer_app/features/chat/utils/attachments/textual_attachment_content.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/fluxer_bounded_text_widgets.dart'
    as bounded;
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart' as flutter;

import '../../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('plain text preview uses the theme monospace font', (
    tester,
  ) async {
    await tester.pumpWidget(
      _buildTestApp(
        child: const TextualAttachmentCodePanel(
          status: TextualAttachmentPreviewStatus.loaded,
          visibleLineCount: 4,
          wrapText: true,
          textContent: 'hello world',
        ),
      ),
    );

    final bounded.Text panelText = tester.widget<bounded.Text>(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is bounded.Text && widget.data == 'hello world',
      ),
    );
    expect(panelText.style?.fontFamily, FluxerFonts.mono);

    final flutter.Text renderedText = tester.widget<flutter.Text>(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is flutter.Text && widget.data == 'hello world',
      ),
    );
    expect(renderedText.style?.fontFamily, FluxerFonts.mono);
  });

  testWidgets('highlighted preview shows plain text until parsed', (
    tester,
  ) async {
    const String source = 'print("highlight me")';
    final BackgroundCodeHighlight? highlight = await tester.runAsync(
      () async => backgroundCodeHighlight(code: source, language: 'python'),
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: const TextualAttachmentCodePanel(
          status: TextualAttachmentPreviewStatus.loaded,
          visibleLineCount: 4,
          wrapText: true,
          textContent: source,
          languageCode: 'python',
        ),
      ),
    );

    TextSpan rootSpan() =>
        tester
                .widget<flutter.RichText>(
                  find.byWidgetPredicate(
                    (Widget widget) =>
                        widget is flutter.RichText &&
                        widget.text.toPlainText() == source,
                  ),
                )
                .text
            as TextSpan;

    expect(rootSpan().text, source);
    expect(rootSpan().children, isNull);
    expect(rootSpan().style?.fontFamily, FluxerFonts.mono);

    await tester.runAsync(() => highlight!.done);
    await tester.pump();

    final TextSpan highlighted = rootSpan();
    expect(highlighted.text, isNull);
    expect(highlighted.children, isNotEmpty);
    expect(highlighted.style?.fontFamily, FluxerFonts.mono);
    expect(
      highlighted.children!.any(
        (InlineSpan span) =>
            span.style?.color != null &&
            span.style?.fontFamily == FluxerFonts.mono,
      ),
      isTrue,
    );
  });

  testWidgets('stale highlight results are not applied after input changes', (
    tester,
  ) async {
    const String first = 'value = "first"';
    const String second = 'value = "second"';
    final List<BackgroundCodeHighlight>? highlights = await tester.runAsync(
      () async => <BackgroundCodeHighlight>[
        backgroundCodeHighlight(code: first, language: 'python'),
        backgroundCodeHighlight(code: second, language: 'python'),
      ],
    );

    Widget panel(String text) => _buildTestApp(
      child: TextualAttachmentCodePanel(
        status: TextualAttachmentPreviewStatus.loaded,
        visibleLineCount: 4,
        wrapText: true,
        textContent: text,
        languageCode: 'python',
      ),
    );

    TextSpan rootSpanFor(String text) =>
        tester
                .widget<flutter.RichText>(
                  find.byWidgetPredicate(
                    (Widget widget) =>
                        widget is flutter.RichText &&
                        widget.text.toPlainText() == text,
                  ),
                )
                .text
            as TextSpan;

    await tester.pumpWidget(panel(first));
    await tester.pumpWidget(panel(second));

    await tester.runAsync(() => highlights![0].done);
    await tester.pump();
    expect(rootSpanFor(second).children, isNull);

    await tester.runAsync(() => highlights![1].done);
    await tester.pump();
    expect(rootSpanFor(second).children, isNotEmpty);
  });
}

Widget _buildTestApp({required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: fluxerLocalizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}
