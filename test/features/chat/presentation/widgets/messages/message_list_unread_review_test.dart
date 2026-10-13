import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';

void main() {
  group('isBeyondJumpToBottomThreshold', () {
    test('is false just below the jump distance', () {
      expect(
        isBeyondJumpToBottomThreshold(
          distanceFromBottom: kJumpToBottomDistance - 1,
        ),
        isFalse,
      );
    });

    test('is true at the jump distance', () {
      expect(
        isBeyondJumpToBottomThreshold(
          distanceFromBottom: kJumpToBottomDistance,
        ),
        isTrue,
      );
    });
  });

  group('shouldShowChannelWelcome', () {
    test('returns true only at channel start with no load failure', () {
      expect(
        shouldShowChannelWelcome(
          hasMoreOlderMessages: false,
          messageLoadFailed: false,
        ),
        isTrue,
      );
      expect(
        shouldShowChannelWelcome(
          hasMoreOlderMessages: true,
          messageLoadFailed: false,
        ),
        isFalse,
      );
      expect(
        shouldShowChannelWelcome(
          hasMoreOlderMessages: false,
          messageLoadFailed: true,
        ),
        isFalse,
      );
    });
  });

  group('shouldShowJumpToBottomButton', () {
    test('returns false when there are no messages', () {
      expect(
        shouldShowJumpToBottomButton(
          hasMessages: false,
          isLoading: false,
          isActiveReadChannel: true,
          distanceFromBottom: kJumpToBottomDistance,
          hasMoreNewerMessages: false,
          messageLoadFailed: false,
        ),
        isFalse,
      );
    });

    test('returns false when loading', () {
      expect(
        shouldShowJumpToBottomButton(
          hasMessages: true,
          isLoading: true,
          isActiveReadChannel: true,
          distanceFromBottom: kJumpToBottomDistance,
          hasMoreNewerMessages: false,
          messageLoadFailed: false,
        ),
        isFalse,
      );
    });

    test('returns false when channel is not actively read', () {
      expect(
        shouldShowJumpToBottomButton(
          hasMessages: true,
          isLoading: false,
          isActiveReadChannel: false,
          distanceFromBottom: kJumpToBottomDistance,
          hasMoreNewerMessages: false,
          messageLoadFailed: false,
        ),
        isFalse,
      );
    });

    test('returns false when message history failed to load', () {
      expect(
        shouldShowJumpToBottomButton(
          hasMessages: true,
          isLoading: false,
          isActiveReadChannel: true,
          distanceFromBottom: 500,
          hasMoreNewerMessages: true,
          messageLoadFailed: true,
        ),
        isFalse,
      );
    });

    test('returns false within the jump distance on the latest page', () {
      expect(
        shouldShowJumpToBottomButton(
          hasMessages: true,
          isLoading: false,
          isActiveReadChannel: true,
          distanceFromBottom: kJumpToBottomDistance - 1,
          hasMoreNewerMessages: false,
          messageLoadFailed: false,
        ),
        isFalse,
      );
    });

    test('returns true when scrolled up past the jump distance', () {
      expect(
        shouldShowJumpToBottomButton(
          hasMessages: true,
          isLoading: false,
          isActiveReadChannel: true,
          distanceFromBottom: kJumpToBottomDistance,
          hasMoreNewerMessages: false,
          messageLoadFailed: false,
        ),
        isTrue,
      );
    });

    test('returns true when newer pages remain even near bottom of slice', () {
      expect(
        shouldShowJumpToBottomButton(
          hasMessages: true,
          isLoading: false,
          isActiveReadChannel: true,
          distanceFromBottom: 0,
          hasMoreNewerMessages: true,
          messageLoadFailed: false,
        ),
        isTrue,
      );
    });
  });

  group('quantizeReadViewportDistance', () {
    test('returns zero for non-positive distances', () {
      expect(quantizeReadViewportDistance(0), 0);
      expect(quantizeReadViewportDistance(-12), 0);
    });

    test('rounds distances to 48px steps', () {
      expect(quantizeReadViewportDistance(1), 0);
      expect(quantizeReadViewportDistance(47), 0);
      expect(quantizeReadViewportDistance(48), 48);
      expect(quantizeReadViewportDistance(95), 48);
      expect(quantizeReadViewportDistance(240), 240);
    });

    test('preserves non-finite distances', () {
      expect(quantizeReadViewportDistance(double.infinity), double.infinity);
      expect(quantizeReadViewportDistance(double.nan), 0);
    });
  });

  group('isNearTrailingEdge', () {
    test('is true below the threshold', () {
      expect(isNearTrailingEdge(distanceFromTrailingEdge: 47), isTrue);
    });

    test('is true at the threshold', () {
      expect(isNearTrailingEdge(distanceFromTrailingEdge: 48), isTrue);
    });

    test('is false above the threshold', () {
      expect(isNearTrailingEdge(distanceFromTrailingEdge: 49), isFalse);
    });

    test('uses the supplied threshold', () {
      expect(
        isNearTrailingEdge(distanceFromTrailingEdge: 12, threshold: 12),
        isTrue,
      );
      expect(
        isNearTrailingEdge(distanceFromTrailingEdge: 13, threshold: 12),
        isFalse,
      );
    });
  });
}
