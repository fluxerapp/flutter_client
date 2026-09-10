import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/voice/fluxer_live_badge.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('voice tile live badge uses the hud chip chrome', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        home: Scaffold(
          body: FluxerLiveBadge(tone: FluxerLiveBadgeTone.voiceTile),
        ),
      ),
    );
    await tester.pump();
    final DecoratedBox box = tester.widget<DecoratedBox>(
      find.descendant(
        of: find.byType(FluxerLiveBadge),
        matching: find.byType(DecoratedBox),
      ),
    );
    final BoxDecoration decoration = box.decoration as BoxDecoration;
    expect(decoration.color, kVoiceLiveBadgeRed);
    expect(
      decoration.borderRadius,
      BorderRadius.circular(kVoiceTileHudChipRadius),
    );
    expect(find.text('LIVE'), findsOneWidget);
  });
}
