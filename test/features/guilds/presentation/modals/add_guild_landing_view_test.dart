import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/add_guild_action_button.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/add_guild_landing_view.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('landing options sit on cards that stand out from the page', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(402 * 3, 874 * 3);
    tester.view.devicePixelRatio = 3;
    debugSetFluxerRuntimeMobileFormFactor(value: true);
    addTearDown(() {
      tester.view.reset();
      debugSetFluxerRuntimeMobileFormFactor(value: null);
    });
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(
          backgroundColor: colorTheme.backgroundSecondary,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AddGuildLandingView(
              onCreateTap: () {},
              onJoinTap: () {},
              onImportTap: () {},
            ),
          ),
        ),
      ),
    );

    final List<BoxDecoration> cards = tester
        .widgetList<AnimatedContainer>(
          find.descendant(
            of: find.byType(AddGuildActionButton),
            matching: find.byType(AnimatedContainer),
          ),
        )
        .map((AnimatedContainer c) => c.decoration! as BoxDecoration)
        .toList();
    expect(cards, hasLength(3));
    for (final BoxDecoration card in cards) {
      expect(card.color, isNot(colorTheme.backgroundSecondary));
      expect(card.color, cards.first.color);
      expect(card.borderRadius, cards.first.borderRadius);
    }
  });
}
