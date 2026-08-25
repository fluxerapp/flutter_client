import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_shortcuts.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/test_l10n.dart';

Widget _wrap(Widget child) {
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
  testWidgets('DefaultShortcutsList shows section headings', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const SingleChildScrollView(
          child: DefaultShortcutsList(searchQuery: ''),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Defaults'), findsOneWidget);
    expect(find.text('Navigation'), findsOneWidget);
  });

  testWidgets('UserShortcuts shows search field', (WidgetTester tester) async {
    await tester.pumpWidget(_wrap(const UserShortcuts()));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.keybindsSearchShortcuts), findsOneWidget);
  });
}
