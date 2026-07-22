import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_typing_status_indicator.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:visibility_detector/visibility_detector.dart';

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

Finder _firstDotFinder() => find
    .descendant(
      of: find.byType(FluxerTypingStatusIndicator),
      matching: find.byType(Opacity),
    )
    .first;

double _firstDotOpacity(WidgetTester tester) {
  return tester.widget<Opacity>(_firstDotFinder()).opacity;
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

    testWidgets('animates typing dots while visible', (tester) async {
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
      final double firstOpacity = _firstDotOpacity(tester);

      await tester.pump(const Duration(milliseconds: 600));
      final double secondOpacity = _firstDotOpacity(tester);
      expect(secondOpacity, isNot(firstOpacity));
    });

    testWidgets('pauses animation when scrolled offscreen', (tester) async {
      await tester.pumpWidget(_wrapPositioned(onScreen: true));
      await tester.pump();
      final double firstOpacity = _firstDotOpacity(tester);

      await tester.pump(const Duration(milliseconds: 600));
      final double secondOpacity = _firstDotOpacity(tester);
      expect(
        secondOpacity,
        isNot(firstOpacity),
        reason: 'control: visible typing indicator should animate',
      );

      await tester.pumpWidget(_wrapPositioned(onScreen: false));
      await tester.pump();
      final double frozenOpacity = _firstDotOpacity(tester);

      await tester.pump(const Duration(milliseconds: 600));
      final double afterOffscreen = _firstDotOpacity(tester);
      expect(
        afterOffscreen,
        frozenOpacity,
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
      final double firstOpacity = _firstDotOpacity(tester);

      await tester.pump(const Duration(milliseconds: 600));
      final double secondOpacity = _firstDotOpacity(tester);
      expect(
        secondOpacity,
        isNot(firstOpacity),
        reason: 'control: foreground typing indicator should animate',
      );

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      await tester.pump();
      final double frozenOpacity = _firstDotOpacity(tester);

      await tester.pump(const Duration(milliseconds: 600));
      final double afterPause = _firstDotOpacity(tester);
      expect(
        afterPause,
        frozenOpacity,
        reason: 'backgrounded typing indicator must freeze',
      );
    });
  });
}
