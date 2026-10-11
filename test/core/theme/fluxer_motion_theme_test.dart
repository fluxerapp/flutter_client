import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('FluxerMotionTheme', () {
    test('default creates expected durations', () {
      const theme = FluxerMotionTheme.standard();
      expect(theme.hover, const Duration(milliseconds: 70));
      expect(theme.fast, const Duration(milliseconds: 100));
      expect(theme.normal, const Duration(milliseconds: 150));
      expect(theme.panel, const Duration(milliseconds: 200));
      expect(theme.slow, const Duration(milliseconds: 300));
      expect(theme.push, const Duration(milliseconds: 230));
      expect(theme.pop, const Duration(milliseconds: 180));
      expect(theme.sheet, const Duration(milliseconds: 270));
      expect(theme.curve, Curves.easeOut);
      expect(theme.emphasizedCurve, Curves.easeInOut);
    });

    test('push curve follows the measured Discord push samples', () {
      const theme = FluxerMotionTheme.standard();
      const List<(double, double)> samples = <(double, double)>[
        (1 / 7, 0.30),
        (2 / 7, 0.62),
        (3 / 7, 0.82),
        (4 / 7, 0.93),
        (5 / 7, 0.98),
      ];
      for (final (double t, double progress) in samples) {
        expect(theme.pushCurve.transform(t), closeTo(progress, 0.03));
      }
    });

    test('sheet curve settles without overshooting', () {
      const theme = FluxerMotionTheme.standard();
      for (int i = 0; i <= 100; i++) {
        expect(theme.sheetCurve.transform(i / 100), lessThanOrEqualTo(1));
      }
      expect(theme.sheetCurve.transform(0.5), greaterThan(0.9));
    });

    test('reduced zeroes all durations', () {
      const theme = FluxerMotionTheme.reduced();
      expect(theme.hover, Duration.zero);
      expect(theme.fast, Duration.zero);
      expect(theme.normal, Duration.zero);
      expect(theme.panel, Duration.zero);
      expect(theme.slow, Duration.zero);
      expect(theme.push, Duration.zero);
      expect(theme.pop, Duration.zero);
      expect(theme.sheet, Duration.zero);
    });

    test('copyWith preserves unchanged values', () {
      const theme = FluxerMotionTheme.standard();
      final copied = theme.copyWith(fast: const Duration(milliseconds: 50));
      expect(copied.fast, const Duration(milliseconds: 50));
      expect(copied.hover, const Duration(milliseconds: 70));
      expect(copied.normal, const Duration(milliseconds: 150));
      expect(copied.panel, const Duration(milliseconds: 200));
    });

    test('lerp interpolates durations', () {
      const a = FluxerMotionTheme.standard();
      final b = a.copyWith(fast: const Duration(milliseconds: 200));
      final lerped = a.lerp(b, 0.5);
      expect(lerped.fast, const Duration(milliseconds: 150));
    });
  });

  group('context.motion', () {
    testWidgets('returns reduced tokens when animations are disabled', (
      WidgetTester tester,
    ) async {
      late FluxerMotionTheme motion;
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(disableAnimations: true),
          child: Theme(
            data: ThemeData(
              extensions: const <ThemeExtension<dynamic>>[
                FluxerMotionTheme.standard(),
              ],
            ),
            child: Builder(
              builder: (BuildContext context) {
                motion = context.motion;
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
      expect(motion.panel, Duration.zero);
      expect(motion.slow, Duration.zero);
      expect(motion.hover, Duration.zero);
    });

    testWidgets('returns theme tokens when animations are enabled', (
      WidgetTester tester,
    ) async {
      late FluxerMotionTheme motion;
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(),
          child: Theme(
            data: ThemeData(
              extensions: const <ThemeExtension<dynamic>>[
                FluxerMotionTheme.standard(),
              ],
            ),
            child: Builder(
              builder: (BuildContext context) {
                motion = context.motion;
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
      expect(motion.panel, FluxerMotionTheme.panelDuration);
      expect(motion.normal, FluxerMotionTheme.normalDuration);
    });
  });
}
