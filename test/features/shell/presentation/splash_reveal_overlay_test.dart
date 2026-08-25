import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/presentation/splash_reveal_overlay.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SplashRevealOverlay', () {
    testWidgets('completes zoom transition without throwing', (tester) async {
      var completed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: TextButton(
                    onPressed: () {
                      SplashRevealOverlay.show(
                        context: context,
                        coverColor: const Color(0xFF080616),
                        logoBrandColor: const Color(0xFF7A57BF),
                        logoBrandSymbolColor: Colors.white,
                        logoCenterGlobal: const Offset(200, 400),
                        useLogoZoomTransition: true,
                        animationsEnabled: true,
                        onComplete: () => completed = true,
                      );
                    },
                    child: const Text('reveal'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('reveal'));
      await tester.pump();
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(completed, isTrue);
    });

    testWidgets('disposing mid-animation does not throw', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: TextButton(
                    onPressed: () {
                      SplashRevealOverlay.show(
                        context: context,
                        coverColor: const Color(0xFF080616),
                        logoBrandColor: const Color(0xFF7A57BF),
                        logoBrandSymbolColor: Colors.white,
                        logoCenterGlobal: const Offset(200, 400),
                        useLogoZoomTransition: true,
                        animationsEnabled: true,
                      );
                    },
                    child: const Text('reveal'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('reveal'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 80));
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  });

  group('splashRevealSymbolOpacity', () {
    test('stays solid through the pulse phase', () {
      expect(splashRevealSymbolOpacity(0), 1);
      expect(
        splashRevealSymbolOpacity(SplashRevealOverlay.pulseEndFraction),
        1,
      );
    });

    test('dissolves monotonically to zero as the logo expands', () {
      var previous = splashRevealSymbolOpacity(
        SplashRevealOverlay.pulseEndFraction,
      );
      for (double p = 0.1; p <= 1.0; p += 0.05) {
        final double next = splashRevealSymbolOpacity(p);
        expect(next, lessThanOrEqualTo(previous));
        previous = next;
      }
      expect(splashRevealSymbolOpacity(1), 0);
    });

    test('fade is visible while the waves still fit on screen', () {
      // Solid at the start of the growth, clearly translucent by the time the
      // strokes span the viewport, gone by mid-expansion.
      expect(splashRevealSymbolOpacity(0.15), greaterThan(0.9));
      expect(splashRevealSymbolOpacity(0.36), lessThan(0.5));
      expect(splashRevealSymbolOpacity(0.54), 0);
    });

    test('starts more opaque than the cover so the app shows behind first', () {
      for (double p = 0.12; p <= 0.24; p += 0.06) {
        expect(
          splashRevealSymbolOpacity(p),
          greaterThan(splashRevealLayerOpacity(p, reducedMotion: false)),
        );
      }
    });
  });
}
