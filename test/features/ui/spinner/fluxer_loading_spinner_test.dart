import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
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

Finder _spinnerPaintFinder() => find.descendant(
  of: find.byType(FluxerLoadingSpinner),
  matching: find.byType(CustomPaint),
);

CustomPainter _spinnerPainter(WidgetTester tester) {
  return tester.widget<CustomPaint>(_spinnerPaintFinder()).painter!;
}

Future<CustomPainter> _awaitPainter(WidgetTester tester) async {
  final Finder paintFinder = _spinnerPaintFinder();
  for (int i = 0; i < 20; i++) {
    await tester.pump();
    if (paintFinder.evaluate().isNotEmpty) {
      return _spinnerPainter(tester);
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
      final CustomPainter first = await _awaitPainter(tester);

      await tester.pump(const Duration(milliseconds: 700));
      final CustomPainter second = _spinnerPainter(tester);
      expect(
        second.shouldRepaint(first),
        isTrue,
        reason: 'control: visible spinner should animate',
      );

      await tester.pumpWidget(_wrapPositioned(onScreen: false));
      await tester.pump();
      final CustomPainter frozen = _spinnerPainter(tester);

      await tester.pump(const Duration(milliseconds: 700));
      final CustomPainter afterOffscreen = _spinnerPainter(tester);
      expect(
        afterOffscreen.shouldRepaint(frozen),
        isFalse,
        reason: 'offscreen spinner must freeze',
      );
    });

    testWidgets('pauses animation when app is paused', (tester) async {
      await tester.pumpWidget(buildTestApp(const FluxerLoadingSpinner()));
      await tester.pump();
      final CustomPainter first = await _awaitPainter(tester);

      await tester.pump(const Duration(milliseconds: 700));
      final CustomPainter second = _spinnerPainter(tester);
      expect(
        second.shouldRepaint(first),
        isTrue,
        reason: 'control: foreground spinner should animate',
      );

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      await tester.pump();
      final CustomPainter frozen = _spinnerPainter(tester);

      await tester.pump(const Duration(milliseconds: 700));
      final CustomPainter afterPause = _spinnerPainter(tester);
      expect(
        afterPause.shouldRepaint(frozen),
        isFalse,
        reason: 'backgrounded spinner must freeze',
      );
    });
  });
}
