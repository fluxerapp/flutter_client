import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_translation_indicator.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../helpers/test_l10n.dart';

const MessageTranslation _translation = MessageTranslation(
  translatedContent: 'Hello world',
  sourceLanguageCode: 'de',
  sourceContent: 'Hallo Welt',
  targetLanguageCode: 'en',
);

Widget _app(Widget child) {
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

void main() {
  testWidgets('shows translated-from copy and see original', (tester) async {
    await tester.pumpWidget(
      _app(
        const MessageTranslationIndicator(
          translation: _translation,
          onToggleOriginal: _noop,
        ),
      ),
    );

    expect(find.textContaining('Translated from German'), findsOneWidget);
    expect(find.text(testL10n.chatMessageSeeOriginal), findsOneWidget);
    expect(find.byType(PhosphorIcon), findsOneWidget);
  });

  testWidgets('tapping see original invokes the toggle', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      _app(
        MessageTranslationIndicator(
          translation: _translation,
          onToggleOriginal: () => tapped = true,
        ),
      ),
    );

    await tester.tap(find.text(testL10n.chatMessageSeeOriginal));
    expect(tapped, isTrue);
  });

  testWidgets('shows see translation when viewing the original', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        MessageTranslationIndicator(
          translation: _translation.copyWith(showOriginal: true),
          onToggleOriginal: _noop,
        ),
      ),
    );

    expect(find.text(testL10n.chatMessageSeeTranslation), findsOneWidget);
    expect(find.text(testL10n.chatMessageSeeOriginal), findsNothing);
  });

  testWidgets('shows translating copy with a translate icon', (tester) async {
    await tester.pumpWidget(_app(const MessageTranslatingIndicator()));

    expect(find.text(testL10n.chatMessageTranslating), findsOneWidget);
    expect(find.byType(PhosphorIcon), findsOneWidget);
  });
}

void _noop() {}
