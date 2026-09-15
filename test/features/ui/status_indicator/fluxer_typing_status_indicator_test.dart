import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_typing_dots.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_typing_status_indicator.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../helpers/test_l10n.dart';

Widget buildTestApp(Widget child) {
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

Finder _typingPaintFinder() => find.descendant(
  of: find.byType(FluxerTypingStatusIndicator),
  matching: find.byType(CustomPaint),
);

CustomPainter _typingPainter(WidgetTester tester) {
  return tester.widget<CustomPaint>(_typingPaintFinder()).painter!;
}

Future<CustomPainter> _awaitPainter(WidgetTester tester) async {
  final Finder paintFinder = _typingPaintFinder();
  for (int i = 0; i < 20; i++) {
    await tester.pump();
    if (paintFinder.evaluate().isNotEmpty) {
      return _typingPainter(tester);
    }
  }
  fail('typing indicator painter not found');
}

Widget _wrapPositioned({required bool onScreen}) => buildTestApp(
  ClipRect(
    child: Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          left: 0,
          top: onScreen ? 0 : 5000,
          child: const FluxerTypingStatusIndicator(
            status: 'online',
            width: 22,
            height: 12,
          ),
        ),
      ],
    ),
  ),
);

void main() {
  group('fluxerTypingDotWave', () {
    test('animates left-to-right', () {
      expect(
        fluxerTypingDotWave(0, kFluxerTypingDotDelays[0]),
        greaterThan(fluxerTypingDotWave(0, kFluxerTypingDotDelays[2])),
      );
      expect(
        fluxerTypingDotWave(0.6, kFluxerTypingDotDelays[2]),
        greaterThan(fluxerTypingDotWave(0.6, kFluxerTypingDotDelays[0])),
      );
    });
  });

  group('FluxerTypingStatusIndicator', () {
    setUp(() {
      VisibilityDetectorController.instance.updateInterval = Duration.zero;
    });

    tearDown(() {
      VisibilityDetectorController.instance.updateInterval = const Duration(
        milliseconds: 500,
      );
      TestWidgetsFlutterBinding.instance.handleAppLifecycleStateChanged(
        AppLifecycleState.resumed,
      );
    });

    testWidgets('animates dots via CustomPainter without Opacity layers', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerTypingStatusIndicator(
            status: 'online',
            width: 22,
            height: 12,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(FluxerTypingDots), findsOneWidget);
      expect(_typingPaintFinder(), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(FluxerTypingStatusIndicator),
          matching: find.byType(Opacity),
        ),
        findsNothing,
      );

      final CustomPainter first = _typingPainter(tester);
      await tester.pump(const Duration(milliseconds: 600));
      final CustomPainter second = _typingPainter(tester);
      expect(second.shouldRepaint(first), isTrue);
    });

    testWidgets('keeps dots inset from the pill edges', (tester) async {
      const double width = 22;
      const double height = 12;
      await tester.pumpWidget(
        buildTestApp(
          const FluxerTypingStatusIndicator(
            status: 'online',
            width: width,
            height: height,
          ),
        ),
      );
      await tester.pump();

      final Size dotsSize = tester.getSize(find.byType(FluxerTypingDots));
      expect(dotsSize.width, lessThan(width));
      expect(dotsSize.height, lessThan(height));
    });

    testWidgets('animates dots left-to-right in RTL layouts', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const Directionality(
            textDirection: TextDirection.rtl,
            child: FluxerTypingStatusIndicator(
              status: 'online',
              width: 22,
              height: 12,
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(FluxerTypingDots), findsOneWidget);
      expect(
        fluxerTypingDotWave(0, kFluxerTypingDotDelays[0]),
        greaterThan(fluxerTypingDotWave(0, kFluxerTypingDotDelays[2])),
      );
      expect(
        fluxerTypingDotWave(0.6, kFluxerTypingDotDelays[2]),
        greaterThan(fluxerTypingDotWave(0.6, kFluxerTypingDotDelays[0])),
      );
    });

    testWidgets('pauses animation when scrolled offscreen', (tester) async {
      await tester.pumpWidget(_wrapPositioned(onScreen: true));
      final CustomPainter first = await _awaitPainter(tester);

      await tester.pump(const Duration(milliseconds: 600));
      final CustomPainter second = _typingPainter(tester);
      expect(
        second.shouldRepaint(first),
        isTrue,
        reason: 'control: visible typing indicator should animate',
      );

      await tester.pumpWidget(_wrapPositioned(onScreen: false));
      await tester.pump();
      final CustomPainter frozen = _typingPainter(tester);

      await tester.pump(const Duration(milliseconds: 600));
      final CustomPainter afterOffscreen = _typingPainter(tester);
      expect(
        afterOffscreen.shouldRepaint(frozen),
        isFalse,
        reason: 'offscreen typing indicator must freeze',
      );
    });

    testWidgets('pauses animation when app is paused', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerTypingStatusIndicator(
            status: 'online',
            width: 22,
            height: 12,
          ),
        ),
      );
      await tester.pump();
      final CustomPainter first = await _awaitPainter(tester);

      await tester.pump(const Duration(milliseconds: 600));
      final CustomPainter second = _typingPainter(tester);
      expect(
        second.shouldRepaint(first),
        isTrue,
        reason: 'control: foreground typing indicator should animate',
      );

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      await tester.pump();
      final CustomPainter frozen = _typingPainter(tester);

      await tester.pump(const Duration(milliseconds: 600));
      final CustomPainter afterPause = _typingPainter(tester);
      expect(
        afterPause.shouldRepaint(frozen),
        isFalse,
        reason: 'backgrounded typing indicator must freeze',
      );
    });
  });
}
