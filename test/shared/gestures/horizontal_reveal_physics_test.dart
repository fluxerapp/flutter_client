import 'dart:ui' show TextDirection;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_drawer_provider.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/shared/gestures/horizontal_reveal_physics.dart';

void main() {
  group('horizontalRevealShouldOpen', () {
    test('left edge opens on fling right', () {
      expect(
        horizontalRevealShouldOpen(
          edge: HorizontalRevealEdge.left,
          translate: 0,
          maxExtent: 400,
          primaryVelocity: 800,
          completionThreshold: kHorizontalSwipeCompletionThresholdMaterial,
        ),
        isTrue,
      );
    });

    test('right edge opens on fling left', () {
      expect(
        horizontalRevealShouldOpen(
          edge: HorizontalRevealEdge.right,
          translate: 0,
          maxExtent: 400,
          primaryVelocity: -800,
          completionThreshold: kHorizontalSwipeCompletionThresholdMaterial,
        ),
        isTrue,
      );
    });
  });

  group('channelDetailsDrawerBlocksMessageSwipe', () {
    test('blocks only when fully revealed', () {
      expect(
        channelDetailsDrawerBlocksMessageSwipe(
          hasDrawerSession: true,
          revealPixels: 100,
          screenWidth: 400,
        ),
        isFalse,
      );
      expect(
        channelDetailsDrawerBlocksMessageSwipe(
          hasDrawerSession: true,
          revealPixels: 399,
          screenWidth: 400,
        ),
        isTrue,
      );
    });
  });

  group('applyHorizontalRevealDrag', () {
    test('left edge adds delta', () {
      expect(
        applyHorizontalRevealDrag(
          edge: HorizontalRevealEdge.left,
          translate: 10,
          deltaDx: 5,
          min: 0,
          max: 100,
        ),
        15,
      );
    });

    test('right edge subtracts delta', () {
      expect(
        applyHorizontalRevealDrag(
          edge: HorizontalRevealEdge.right,
          translate: 10,
          deltaDx: 5,
          min: 0,
          max: 100,
        ),
        5,
      );
    });
  });

  group('logical reveal edges', () {
    test('start and end follow the text direction', () {
      expect(
        horizontalRevealStartEdge(TextDirection.ltr),
        HorizontalRevealEdge.left,
      );
      expect(
        horizontalRevealStartEdge(TextDirection.rtl),
        HorizontalRevealEdge.right,
      );
      expect(
        horizontalRevealEndEdge(TextDirection.ltr),
        HorizontalRevealEdge.right,
      );
      expect(
        horizontalRevealEndEdge(TextDirection.rtl),
        HorizontalRevealEdge.left,
      );
    });
  });
}
