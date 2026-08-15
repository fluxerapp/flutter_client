import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/presentation/splash_reveal_overlay.dart';
import 'package:material_ui/material_ui.dart';

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
}
