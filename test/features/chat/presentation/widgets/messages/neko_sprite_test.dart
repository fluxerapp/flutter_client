import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/neko_sprite.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:visibility_detector/visibility_detector.dart';

class _AlwaysIdleAnimationRandom implements Random {
  @override
  bool nextBool() => false;

  @override
  double nextDouble() => 0;

  @override
  int nextInt(int max) => 0;
}

class _NeverIdleAnimationRandom implements Random {
  @override
  bool nextBool() => false;

  @override
  double nextDouble() => 1;

  @override
  int nextInt(int max) => 0;
}

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

  Rect? nekoRect(WidgetTester tester) {
    final CustomPainter? painter = nekoPainter(tester);
    if (painter == null) {
      return null;
    }
    return nekoSpritePaintRect(painter);
  }

  Widget wrapTickerMode({required bool enabled, Random? random}) =>
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: TickerMode(
              enabled: enabled,
              child: NekoSprite(random: random ?? _NeverIdleAnimationRandom()),
            ),
          ),
        ),
      );

  // Keeps NekoSprite painted and in the tree (so its painter stays findable and
  // its State is preserved), but pushes it far off-screen when [onScreen] is
  // false so VisibilityDetector reports visibleFraction == 0. TickerMode stays
  // enabled, mirroring "another channel open / PageView page swiped away".
  Widget wrapOffScreen({required bool onScreen, Random? random}) =>
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: ClipRect(
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    left: 0,
                    top: onScreen ? 0 : 5000,
                    child: NekoSprite(
                      random: random ?? _AlwaysIdleAnimationRandom(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // The sprite renders nothing until assets/images/neko.gif decodes (real async,
  // so this runs inside tester.runAsync). Returns the first painter once present.
  Future<Rect> awaitSprite(WidgetTester tester) async {
    for (int i = 0; i < 40; i++) {
      await tester.pump();
      await Future<void>.delayed(const Duration(milliseconds: 25));
      final CustomPainter? painter = nekoPainter(tester);
      if (painter != null && nekoSpriteImageReady(painter)) {
        return nekoSpritePaintRect(painter)!;
      }
    }
    fail('neko.gif never decoded/rendered');
  }

  Future<bool> didAnimate(WidgetTester tester, Rect from) async {
    for (int i = 0; i < 12; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      await tester.pump();
      if (nekoRect(tester) != from) {
        return true;
      }
    }
    return false;
  }

  testWidgets('idle sprite animates while visible', (
    WidgetTester tester,
  ) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        wrapTickerMode(enabled: true, random: _AlwaysIdleAnimationRandom()),
      );
      final Rect first = await awaitSprite(tester);
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
      final Rect first = await awaitSprite(tester);

      for (int i = 0; i < 6; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
        await tester.pump();
        expect(
          nekoRect(tester),
          first,
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
      final Rect first = await awaitSprite(tester);
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

      final Rect frozen = nekoRect(tester)!;
      for (int i = 0; i < 6; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
        await tester.pump();
        expect(
          nekoRect(tester),
          frozen,
          reason: 'offscreen neko must not animate',
        );
      }

      await tester.pumpWidget(const SizedBox());
    });
  });

  testWidgets('tap pets neko and shows a heart', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(wrapTickerMode(enabled: true));
      await awaitSprite(tester);
      await tester.tap(find.byType(NekoSprite));
      await tester.pump();
      expect(find.text('♥'), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    });
  });
}
