import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_header.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../helpers/test_l10n.dart';

Widget _buildApp(Widget child) {
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

Widget _buildHeader(String displayName) {
  return UserProfileHeader(
    username: 'sampleuser',
    discriminator: '0000',
    displayName: displayName,
    flags: 0,
    hasPlutonium: false,
    customStatus: null,
  );
}

void main() {
  group('UserProfileHeader', () {
    testWidgets(
      'uses resolved display name as title and username tag subtitle',
      (tester) async {
        for (final titleText in ['Sample User', 'sampleuser']) {
          await tester.pumpWidget(_buildApp(_buildHeader(titleText)));

          final header = find.byType(UserProfileHeader);
          final titleFinder = find.descendant(
            of: header,
            matching: find.text(titleText),
          );
          final tagFinder = find.descendant(
            of: header,
            matching: find.text('sampleuser#0000'),
          );
          final title = tester.widget<Text>(titleFinder);
          final tag = tester.widget<Text>(tagFinder);

          expect(header, findsOneWidget);
          expect(titleFinder, findsOneWidget);
          expect(title.style?.fontSize, 24);
          expect(tagFinder, findsOneWidget);
          expect(tag.style?.fontSize, isNot(24));
        }
      },
    );

    testWidgets('shows caret and calls onDisplayNameTap when provided', (
      tester,
    ) async {
      var tapped = false;
      await tester.pumpWidget(
        _buildApp(
          UserProfileHeader(
            username: 'sampleuser',
            discriminator: '0000',
            displayName: 'Sample User',
            flags: 0,
            hasPlutonium: false,
            customStatus: null,
            onDisplayNameTap: () => tapped = true,
          ),
        ),
      );

      expect(find.byIcon(PhosphorIconsBold.caretDown), findsOneWidget);
      await tester.tap(find.text('Sample User'));
      await tester.pumpAndSettle();
      expect(tapped, isTrue);
    });
  });
}
