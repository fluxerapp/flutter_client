import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/message_character_counter.dart';
import 'package:fluxer_app/features/ui/character_counter/fluxer_character_counter.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Widget _buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );
}

void main() {
  group('MessageCharacterCounter', () {
    testWidgets('hides below 80% threshold', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          const MessageCharacterCounter(
            currentLength: 100,
            maxLength: 200,
            canUpgrade: false,
            premiumMaxLength: 4000,
          ),
        ),
      );

      expect(find.byType(FluxerCharacterCounter), findsNothing);
    });

    testWidgets('shows counter above 80% threshold', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          const MessageCharacterCounter(
            currentLength: 170,
            maxLength: 200,
            canUpgrade: false,
            premiumMaxLength: 4000,
            showTooltip: false,
          ),
        ),
      );

      expect(find.byType(FluxerCharacterCounter), findsOneWidget);
      expect(find.text('30'), findsOneWidget);
    });
  });
}
