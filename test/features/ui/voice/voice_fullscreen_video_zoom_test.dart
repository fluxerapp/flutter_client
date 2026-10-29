import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/voice/voice_fullscreen_video_zoom.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/test_l10n.dart';

Widget _wrap(Widget child) {
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: fluxerLocalizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: buildDarkColorTheme(),
      textTheme: FluxerTextTheme.fromColors(buildDarkColorTheme()),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: SizedBox(width: 320, height: 240, child: child)),
  );
}

void main() {
  testWidgets('disabled mode omits InteractiveViewer', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const VoiceFullscreenVideoZoom(
          enabled: false,
          child: ColoredBox(color: Color(0xFF112233)),
        ),
      ),
    );
    expect(find.byType(InteractiveViewer), findsNothing);
  });

  testWidgets('enabled mode inserts InteractiveViewer', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const VoiceFullscreenVideoZoom(
          enabled: true,
          child: ColoredBox(color: Color(0xFF112233)),
        ),
      ),
    );
    expect(find.byType(InteractiveViewer), findsOneWidget);
  });

  testWidgets('pinch shows scale label above 1.0', (WidgetTester tester) async {
    await tester.pumpWidget(
      _wrap(
        const VoiceFullscreenVideoZoom(
          enabled: true,
          child: ColoredBox(color: Color(0xFF112233)),
        ),
      ),
    );
    final Offset center = tester.getCenter(find.byType(InteractiveViewer));
    final TestGesture first = await tester.startGesture(
      center - const Offset(0, 20),
    );
    final TestGesture second = await tester.startGesture(
      center + const Offset(0, 20),
    );
    await first.moveBy(const Offset(0, -120));
    await second.moveBy(const Offset(0, 120));
    await tester.pump();
    final Finder label = find.textContaining(RegExp(r'^\d\.\d$'));
    expect(label, findsOneWidget);
    final String shown = (tester.widget(label) as dynamic).data! as String;
    expect(double.parse(shown), greaterThan(1.0));
    await first.up();
    await second.up();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump(const Duration(milliseconds: 250));
    final AnimatedOpacity opacity = tester.widget<AnimatedOpacity>(
      find.byType(AnimatedOpacity),
    );
    expect(opacity.opacity, 0);
  });
}
