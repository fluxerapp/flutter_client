import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/double_tap_reaction_hint.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/double_tap_action_preferences_provider.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

class _FixedAction extends DoubleTapActionPreferences {
  _FixedAction(this.action);

  final DoubleTapActionPreference action;

  @override
  DoubleTapActionPreferencesState build() =>
      DoubleTapActionPreferencesState(action: action);
}

class _FixedAppearance extends AppearancePreferences {
  _FixedAppearance({required this.alwaysUnderlineLinks});

  final bool alwaysUnderlineLinks;

  @override
  AppearancePreferencesState build() =>
      AppearancePreferencesState(alwaysUnderlineLinks: alwaysUnderlineLinks);
}

Future<void> _pumpHint(
  WidgetTester tester, {
  required DoubleTapActionPreference action,
  bool alwaysUnderlineLinks = false,
}) async {
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        currentUserIdProvider.overrideWithValue('1'),
        doubleTapActionPreferencesProvider.overrideWith(
          () => _FixedAction(action),
        ),
        appearancePreferencesProvider.overrideWith(
          () => _FixedAppearance(alwaysUnderlineLinks: alwaysUnderlineLinks),
        ),
      ],
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: const Scaffold(body: Center(child: DoubleTapReactionHint())),
      ),
    ),
  );
  await tester.pump();
}

TextStyle _styleOf(WidgetTester tester, String text) =>
    tester.renderObject<RenderParagraph>(find.text(text)).text.style!;

void main() {
  testWidgets('react shows the emoji and a link to change it', (
    WidgetTester tester,
  ) async {
    await _pumpHint(tester, action: DoubleTapActionPreference.react);

    expect(find.text(testL10n.doubleTapReactionHint), findsOneWidget);
    expect(find.byType(DoubleTapReactionGlyph), findsOneWidget);
    expect(find.byType(FluxerTextLink), findsOneWidget);
    final TextStyle link = _styleOf(tester, testL10n.doubleTapReactionEdit);
    expect(
      link.color,
      tester.element(find.byType(DoubleTapReactionHint)).colors.textLink,
    );
    expect(link.decoration, TextDecoration.none);
  });

  testWidgets('the change link follows always underline links', (
    WidgetTester tester,
  ) async {
    await _pumpHint(
      tester,
      action: DoubleTapActionPreference.react,
      alwaysUnderlineLinks: true,
    );

    expect(
      _styleOf(tester, testL10n.doubleTapReactionEdit).decoration,
      TextDecoration.underline,
    );
  });

  testWidgets('edit shows plain text with no emoji or link', (
    WidgetTester tester,
  ) async {
    await _pumpHint(
      tester,
      action: DoubleTapActionPreference.edit,
      alwaysUnderlineLinks: true,
    );

    expect(find.text(testL10n.doubleTapEditHint), findsOneWidget);
    expect(find.text(testL10n.doubleTapReactionHint), findsNothing);
    expect(find.byType(DoubleTapReactionGlyph), findsNothing);
    expect(find.byType(FluxerTextLink), findsNothing);
    final TextStyle style = _styleOf(tester, testL10n.doubleTapEditHint);
    expect(
      style.color,
      isNot(tester.element(find.byType(DoubleTapReactionHint)).colors.textLink),
    );
    expect(style.decoration, isNot(TextDecoration.underline));
  });

  testWidgets('none shows no hint', (WidgetTester tester) async {
    await _pumpHint(tester, action: DoubleTapActionPreference.none);

    expect(find.text(testL10n.doubleTapReactionHint), findsNothing);
    expect(find.text(testL10n.doubleTapEditHint), findsNothing);
    expect(find.byType(DoubleTapReactionGlyph), findsNothing);
  });
}
