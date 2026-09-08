import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet_drag.dart';

void main() {
  group('fluxerBottomSheetSizeAfterDrag', () {
    test('dragging down shrinks the sheet', () {
      expect(
        fluxerBottomSheetSizeAfterDrag(
          currentSize: 0.8,
          deltaDy: 80,
          availablePixels: 800,
          minChildSize: 0.4,
          maxChildSize: 0.95,
        ),
        closeTo(0.7, 0.001),
      );
    });

    test('dragging up expands the sheet', () {
      expect(
        fluxerBottomSheetSizeAfterDrag(
          currentSize: 0.6,
          deltaDy: -80,
          availablePixels: 600,
          minChildSize: 0.4,
          maxChildSize: 0.95,
        ),
        closeTo(0.733, 0.001),
      );
    });

    test('size is clamped to min and max child sizes', () {
      expect(
        fluxerBottomSheetSizeAfterDrag(
          currentSize: 0.45,
          deltaDy: 200,
          availablePixels: 450,
          minChildSize: 0.4,
          maxChildSize: 0.95,
        ),
        0.4,
      );
      expect(
        fluxerBottomSheetSizeAfterDrag(
          currentSize: 0.85,
          deltaDy: -200,
          availablePixels: 850,
          minChildSize: 0.4,
          maxChildSize: 0.95,
        ),
        0.95,
      );
    });
  });

  group('fluxerBottomSheetShouldDismissAfterDrag', () {
    test('dismisses after sufficient downward drag distance', () {
      expect(
        fluxerBottomSheetShouldDismissAfterDrag(dragDistance: 60, velocity: 0),
        isTrue,
      );
    });

    test('dismisses after fast downward fling', () {
      expect(
        fluxerBottomSheetShouldDismissAfterDrag(dragDistance: 0, velocity: 400),
        isTrue,
      );
    });

    test('does not dismiss for small drags', () {
      expect(
        fluxerBottomSheetShouldDismissAfterDrag(
          dragDistance: 20,
          velocity: 100,
        ),
        isFalse,
      );
    });
  });

  group('fluxerBottomSheetSnapTarget', () {
    const double half = 0.5;
    const double full = 0.95;

    test('dismisses when released below the half mark', () {
      expect(
        fluxerBottomSheetSnapTarget(size: 0.4, halfSize: half, fullSize: full),
        isNull,
      );
    });

    test('stays at half when released at the half mark', () {
      expect(
        fluxerBottomSheetSnapTarget(size: 0.5, halfSize: half, fullSize: full),
        half,
      );
    });

    test('snaps to whichever of half or full is closer', () {
      expect(
        fluxerBottomSheetSnapTarget(size: 0.6, halfSize: half, fullSize: full),
        half,
      );
      expect(
        fluxerBottomSheetSnapTarget(size: 0.85, halfSize: half, fullSize: full),
        full,
      );
    });

    test('from full, release before the half mark still snaps to half', () {
      expect(
        fluxerBottomSheetSnapTarget(size: 0.6, halfSize: half, fullSize: full),
        half,
      );
    });

    test('dismisses from half on a fast downward flick', () {
      expect(
        fluxerBottomSheetSnapTarget(
          size: 0.5,
          halfSize: half,
          fullSize: full,
          velocity: 400,
          availablePixels: 800,
        ),
        isNull,
      );
    });

    test('upward flick from below the midpoint expands to full', () {
      expect(
        fluxerBottomSheetSnapTarget(
          size: 0.6,
          halfSize: half,
          fullSize: full,
          velocity: -800,
          availablePixels: 800,
        ),
        full,
      );
    });
  });
}
