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
          maxChildSize: 0.9,
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
          maxChildSize: 0.9,
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
          maxChildSize: 0.9,
        ),
        0.4,
      );
      expect(
        fluxerBottomSheetSizeAfterDrag(
          currentSize: 0.85,
          deltaDy: -200,
          availablePixels: 850,
          minChildSize: 0.4,
          maxChildSize: 0.9,
        ),
        0.9,
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
}
