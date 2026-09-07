import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('child is tappable after the overlay is revealed', (
    tester,
  ) async {
    var childTaps = 0;
    await tester.pumpWidget(
      _buildTestApp(
        child: SpoilerOverlay(
          isSpoiler: true,
          initiallyRevealed: false,
          child: GestureDetector(
            onTap: () => childTaps++,
            child: const SizedBox(
              width: 120,
              height: 80,
              child: ColoredBox(color: Color(0xFF123456)),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(SpoilerOverlay));
    await tester.pumpAndSettle();
    expect(childTaps, 0);

    await tester.tap(find.byType(SpoilerOverlay));
    await tester.pumpAndSettle();
    expect(childTaps, 1);
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
