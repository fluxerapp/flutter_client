import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/neko_sprite.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  setUp(() {
    // Deliver visibility callbacks synchronously so the gating is deterministic.
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  tearDown(() {
    VisibilityDetectorController.instance.updateInterval = const Duration(
      milliseconds: 500,
    );
  });

  Finder nekoPaintFinder() => find.descendant(
    of: find.byType(NekoSprite),
    matching: find.byType(CustomPaint),
  );

  CustomPainter? nekoPainter(WidgetTester tester) {
    final Finder finder = nekoPaintFinder();
    if (finder.evaluate().isEmpty) {
      return null;
    }
    return tester.widget<CustomPaint>(finder).painter;
  }

  Widget wrapTickerMode({required bool enabled}) => ProviderScope(
    child: MaterialApp(
      home: Scaffold(
        body: TickerMode(enabled: enabled, child: const NekoSprite()),
      ),
    ),
  );

  // Keeps NekoSprite painted and in the tree (so its painter stays findable and
  // its State is preserved), but pushes it far off-screen when [onScreen] is
  // false so VisibilityDetector reports visibleFraction == 0. TickerMode stays
  // enabled, mirroring "another channel open / PageView page swiped away".
  Widget wrapOffScreen({required bool onScreen}) => ProviderScope(
    child: MaterialApp(
      home: Scaffold(
        body: ClipRect(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                left: 0,
                top: onScreen ? 0 : 5000,
                child: const NekoSprite(),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  // The sprite renders nothing until assets/images/neko.gif decodes (real async,
  // so this runs inside tester.runAsync). Returns the first painter once present.
  Future<CustomPainter> awaitSprite(WidgetTester tester) async {
    for (int i = 0; i < 40; i++) {
      await tester.pump();
      await Future<void>.delayed(const Duration(milliseconds: 25));
      final CustomPainter? painter = nekoPainter(tester);
      if (painter != null) {
        return painter;
      }
    }
    fail('neko.gif never decoded/rendered');
  }

  Future<bool> didAnimate(WidgetTester tester, CustomPainter from) async {
    for (int i = 0; i < 12; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      await tester.pump();
      if (nekoPainter(tester)!.shouldRepaint(from)) {
        return true;
      }
    }
    return false;
  }

  testWidgets('idle sprite animates while visible', (
    WidgetTester tester,
  ) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(wrapTickerMode(enabled: true));
      final CustomPainter first = await awaitSprite(tester);
      expect(
        await didAnimate(tester, first),
        isTrue,
        reason: 'visible neko should animate its idle frames',
      );
      await tester.pumpWidget(const SizedBox());
    });
  });

  testWidgets('sprite is frozen while TickerMode is disabled', (
    WidgetTester tester,
  ) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(wrapTickerMode(enabled: false));
      final CustomPainter first = await awaitSprite(tester);

      for (int i = 0; i < 6; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
        await tester.pump();
        expect(
          nekoPainter(tester)!.shouldRepaint(first),
          isFalse,
          reason: 'neko in an inactive shell branch must not animate',
        );
      }

      await tester.pumpWidget(const SizedBox());
    });
  });

  testWidgets('sprite freezes when scrolled/positioned offscreen', (
    WidgetTester tester,
  ) async {
    await tester.runAsync(() async {
      // Visible first: confirm it is genuinely animating.
      await tester.pumpWidget(wrapOffScreen(onScreen: true));
      final CustomPainter first = await awaitSprite(tester);
      expect(
        await didAnimate(tester, first),
        isTrue,
        reason: 'control: visible neko must animate before being hidden',
      );

      // Push it offscreen with TickerMode still enabled. VisibilityDetector must
      // pause the idle timer so the painted frame stops changing.
      await tester.pumpWidget(wrapOffScreen(onScreen: false));
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await tester.pump();

      final CustomPainter frozen = nekoPainter(tester)!;
      for (int i = 0; i < 6; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
        await tester.pump();
        expect(
          nekoPainter(tester)!.shouldRepaint(frozen),
          isFalse,
          reason: 'offscreen neko must not animate',
        );
      }

      await tester.pumpWidget(const SizedBox());
    });
  });
}
