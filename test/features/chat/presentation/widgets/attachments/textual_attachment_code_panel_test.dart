import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_fonts.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_code_panel.dart';
import 'package:fluxer_app/features/chat/utils/textual_attachment_content.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/fluxer_bounded_text_widgets.dart'
    as bounded;
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

  testWidgets('highlighted preview uses the theme monospace font', (
    tester,
  ) async {
    await tester.pumpWidget(
      _buildTestApp(
        child: const TextualAttachmentCodePanel(
          status: TextualAttachmentPreviewStatus.loaded,
          visibleLineCount: 4,
          wrapText: true,
          textContent: 'print("hi")',
          languageCode: 'python',
        ),
      ),
    );

    final Finder highlightFinder = find.byWidgetPredicate(
      (Widget widget) => widget is HighlightView,
    );
    expect(highlightFinder, findsOneWidget);
    final HighlightView view = tester.widget<HighlightView>(highlightFinder);
    expect(view.textStyle?.fontFamily, FluxerFonts.mono);
    expect(view.theme['root']?.fontFamily, FluxerFonts.mono);
  });
}

Widget _buildTestApp({required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}
