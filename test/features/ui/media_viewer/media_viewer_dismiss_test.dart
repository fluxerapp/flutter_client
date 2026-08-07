import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/media_viewer/media_viewer_dismiss.dart';

void main() {
  group('mediaViewerDismissProgress', () {
    test('returns 0 when drag offset is zero', () {
      expect(mediaViewerDismissProgress(dragOffset: 0, viewportHeight: 800), 0);
    });

    test('returns 1 when drag exceeds dismiss distance', () {
      expect(
        mediaViewerDismissProgress(dragOffset: 200, viewportHeight: 800),
        1,
      );
    });

    test('returns partial progress for mid drag', () {
      expect(
        mediaViewerDismissProgress(dragOffset: 72, viewportHeight: 800),
        closeTo(0.5, 0.01),
      );
    });
  });

  group('mediaViewerDismissBackdropOpacity', () {
    test('fades backdrop with dismiss progress', () {
      expect(
        mediaViewerDismissBackdropOpacity(
          baseOpacity: 0.85,
          dismissProgress: 0.5,
        ),
        closeTo(0.425, 0.001),
      );
    });
  });

  group('mediaViewerDismissChromeOpacity', () {
    test('fades chrome with dismiss progress', () {
      expect(mediaViewerDismissChromeOpacity(dismissProgress: 0.25), 0.75);
    });
  });

  group('mediaViewerDismissContentScale', () {
    test('scales down content while dismissing', () {
      expect(
        mediaViewerDismissContentScale(dismissProgress: 1),
        kMediaViewerDismissMinScale,
      );
    });
  });

  group('mediaViewerShouldDismissAfterDrag', () {
    test('dismisses when drag distance exceeds threshold', () {
      expect(
        mediaViewerShouldDismissAfterDrag(
          dragOffset: 150,
          velocity: 0,
          viewportHeight: 800,
        ),
        isTrue,
      );
    });

    test('dismisses when fling velocity exceeds threshold', () {
      expect(
        mediaViewerShouldDismissAfterDrag(
          dragOffset: 20,
          velocity: -900,
          viewportHeight: 800,
        ),
        isTrue,
      );
    });

    test('does not dismiss for small drag and low velocity', () {
      expect(
        mediaViewerShouldDismissAfterDrag(
          dragOffset: 40,
          velocity: 100,
          viewportHeight: 800,
        ),
        isFalse,
      );
    });
  });

  group('mediaViewerDismissExitOffset', () {
    test('continues drag direction past viewport height', () {
      expect(
        mediaViewerDismissExitOffset(dragOffset: 120, viewportHeight: 800),
        800,
      );
      expect(
        mediaViewerDismissExitOffset(dragOffset: -120, viewportHeight: 800),
        -800,
      );
    });
  });
}
