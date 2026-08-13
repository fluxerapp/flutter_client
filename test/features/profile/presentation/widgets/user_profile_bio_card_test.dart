import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_bio_card.dart';
import '../../../../helpers/test_l10n.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  group('UserProfileBioCard', () {
    testWidgets('hides About Me when bio is null', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const UserProfileBioCard(bio: null, userId: '1')),
      );
      await tester.pumpAndSettle();
      expect(find.text('About Me'), findsNothing);
      expect(find.text('Member Since'), findsOneWidget);
    });

    testWidgets('hides About Me when bio is whitespace', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const UserProfileBioCard(bio: '   ', userId: '1')),
      );
      await tester.pumpAndSettle();
      expect(find.text('About Me'), findsNothing);
    });

    testWidgets('shows About Me when bio has content', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const UserProfileBioCard(bio: 'hi', userId: '1')),
      );
      await tester.pumpAndSettle();
      expect(find.text('About Me'), findsOneWidget);
    });

    testWidgets('hides local time when timezone offset is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(const UserProfileBioCard(bio: null, userId: '1')),
      );
      await tester.pumpAndSettle();
      expect(find.text('Local time'), findsNothing);
    });

    testWidgets('shows local time when timezone offset is set', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const UserProfileBioCard(
            bio: null,
            userId: '1',
            timezoneOffset: -300,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Local time'), findsOneWidget);
      expect(find.text('Same time as you'), findsNothing);
    });
  });
}
