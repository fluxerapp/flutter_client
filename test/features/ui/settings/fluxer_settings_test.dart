import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
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
  group('FluxerSettings primitives', () {
    testWidgets('header renders title, description, and back action', (
      tester,
    ) async {
      var backPressed = false;

      await tester.pumpWidget(
        buildTestApp(
          Material(
            child: FluxerSettingsHeader(
              title: 'Settings',
              description: 'Manage your app preferences.',
              onBack: () => backPressed = true,
            ),
          ),
        ),
      );

      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Manage your app preferences.'), findsOneWidget);

      await tester.tap(find.byTooltip('Back'));
      await tester.pump();

      expect(backPressed, isTrue);
    });

    testWidgets('group and row render shared mobile settings layout', (
      tester,
    ) async {
      var tapped = false;

      await tester.pumpWidget(
        buildTestApp(const Material(child: SizedBox.shrink())),
      );

      await tester.pumpWidget(
        buildTestApp(
          Material(
            child: FluxerSettingsGroup(
              children: [
                FluxerSettingsRow(
                  title: 'Notifications',
                  description: 'Push, desktop, and badge settings.',
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => tapped = true,
                ),
                const FluxerSettingsRow(
                  title: 'Appearance',
                  description: 'Theme, density, and font sizing.',
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Push, desktop, and badge settings.'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);

      await tester.tap(find.text('Notifications'));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('form section and danger zone preserve hierarchy', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const Material(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FluxerSettingsFormSection(
                  title: 'Profile',
                  description: 'Shown on your public account.',
                  children: [Text('Display Name'), Text('Bio')],
                ),
                FluxerSettingsDangerZone(
                  title: 'Danger Zone',
                  description: 'These actions are permanent.',
                  child: Text('Delete Account'),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Shown on your public account.'), findsOneWidget);
      expect(find.text('Display Name'), findsOneWidget);
      expect(find.text('Danger Zone'), findsOneWidget);
      expect(find.text('These actions are permanent.'), findsOneWidget);
      expect(find.text('Delete Account'), findsOneWidget);
    });
  });
}
