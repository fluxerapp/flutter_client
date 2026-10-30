import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/presentation/widgets/role_icon.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';

import '../../../../helpers/test_l10n.dart';

Widget _wrap(Widget child) {
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
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  testWidgets('renders unicode emoji when role has unicode icon', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const RoleIcon(
          role: MemberRole(id: '1', name: 'Mod', color: 0, unicodeEmoji: '🛡️'),
          size: 20,
          decorative: true,
        ),
      ),
    );
    expect(find.byType(UnicodeEmojiWidget), findsOneWidget);
  });

  testWidgets('renders nothing when role has no icon', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const RoleIcon(
          role: MemberRole(id: '1', name: 'Mod', color: 0),
          size: 20,
        ),
      ),
    );
    expect(find.byType(UnicodeEmojiWidget), findsNothing);
    expect(find.byType(RoleIcon), findsOneWidget);
    expect(tester.getSize(find.byType(RoleIcon)), Size.zero);
  });
}
