import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/chat_loading_spinner.dart';
import 'package:fluxer_app/features/chat/utils/chat_spinner_debug.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_typing_dots.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../helpers/test_l10n.dart';

Widget buildTestApp(Widget child) {
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
    home: Scaffold(body: child),
  );
}

Finder _spinnerPaintFinder() => find.descendant(
  of: find.byType(FluxerLoadingSpinner),
  matching: find.byType(CustomPaint),
);

double _dotsProgress(WidgetTester tester) {
  final CustomPaint paint = tester.widget<CustomPaint>(_spinnerPaintFinder());
  return (paint.painter! as FluxerTypingDotsPainter).progress.value;
}

Future<double> _awaitProgress(WidgetTester tester) async {
  final Finder paintFinder = _spinnerPaintFinder();
  for (int i = 0; i < 20; i++) {
    await tester.pump();
    if (paintFinder.evaluate().isNotEmpty) {
      return _dotsProgress(tester);
    }
  }
  fail('spinner painter not found');
}

Widget _wrapPositioned({required bool onScreen}) => buildTestApp(
  ClipRect(
    child: Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          left: 0,
          top: onScreen ? 0 : 5000,
          child: const FluxerLoadingSpinner(),
        ),
      ],
    ),
  ),
);

void main() {
  group('FluxerLoadingSpinner', () {
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

    testWidgets('announces loading label to screen readers', (tester) async {
      await tester.pumpWidget(buildTestApp(const FluxerLoadingSpinner()));

      expect(find.bySemanticsLabel('Loading'), findsOneWidget);
    });

    testWidgets('animates dots via CustomPainter without Opacity layers', (
      tester,
    ) async {
      await tester.pumpWidget(buildTestApp(const FluxerLoadingSpinner()));
      await tester.pump();

      final Finder spinnerPaint = find.descendant(
        of: find.byType(FluxerLoadingSpinner),
        matching: find.byType(CustomPaint),
      );
      expect(spinnerPaint, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(FluxerLoadingSpinner),
          matching: find.byType(Opacity),
        ),
        findsNothing,
      );

      await tester.pump(const Duration(milliseconds: 350));
      await tester.pump();
    });

    testWidgets('pauses animation when scrolled offscreen', (tester) async {
      await tester.pumpWidget(_wrapPositioned(onScreen: true));
      final double first = await _awaitProgress(tester);

      await tester.pump(const Duration(milliseconds: 700));
      final double second = _dotsProgress(tester);
      expect(
        second,
        isNot(first),
        reason: 'control: visible spinner should animate',
      );

      await tester.pumpWidget(_wrapPositioned(onScreen: false));
      await tester.pump();
      final double frozen = _dotsProgress(tester);

      await tester.pump(const Duration(milliseconds: 700));
      final double afterOffscreen = _dotsProgress(tester);
      expect(afterOffscreen, frozen, reason: 'offscreen spinner must freeze');
    });

    testWidgets('pauses animation when app is paused', (tester) async {
      await tester.pumpWidget(buildTestApp(const FluxerLoadingSpinner()));
      await tester.pump();
      final double first = await _awaitProgress(tester);

      await tester.pump(const Duration(milliseconds: 700));
      final double second = _dotsProgress(tester);
      expect(
        second,
        isNot(first),
        reason: 'control: foreground spinner should animate',
      );

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      await tester.pump();
      final double frozen = _dotsProgress(tester);

      await tester.pump(const Duration(milliseconds: 700));
      final double afterPause = _dotsProgress(tester);
      expect(afterPause, frozen, reason: 'backgrounded spinner must freeze');
    });

    testWidgets(
      'typing dots repaint only their own layer, not the enclosing chat chrome (#713)',
      (tester) async {
        final DebugPrintCallback originalDebugPrint = debugPrint;
        debugPrint = (String? message, {int? wrapWidth}) {};
        int chromePaints = 0;
        await tester.pumpWidget(
          buildTestApp(
            RepaintBoundary(
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _CountingPainter(() => chromePaints++),
                    ),
                  ),
                  LayoutBuilder(
                    builder: (_, _) => const ChatLoadingSpinner(
                      reason: ChatSpinnerReason.typing,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        debugPrint = originalDebugPrint;
        await _awaitProgress(tester);
        final RenderObject dots = tester.renderObject(_spinnerPaintFinder());
        expect(chromePaints, 1);

        Duration clock = tester.binding.currentSystemFrameTimeStamp;
        for (int frame = 0; frame < 5; frame++) {
          clock += const Duration(milliseconds: 16);
          tester.binding.handleBeginFrame(clock);
          expect(
            dots.debugNeedsPaint,
            isTrue,
            reason: 'tick $frame must schedule a dots repaint',
          );
          tester.binding.handleDrawFrame();
          expect(dots.debugNeedsPaint, isFalse);
        }
        expect(chromePaints, 1);
      },
    );
  });
}

class _CountingPainter extends CustomPainter {
  _CountingPainter(this.onPaint);

  final VoidCallback onPaint;

  @override
  void paint(Canvas canvas, Size size) => onPaint();

  @override
  bool shouldRepaint(_CountingPainter oldDelegate) => false;
}
