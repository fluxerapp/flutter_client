import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';

void main() {
  group('isNearScrollExtentEnd', () {
    test('is true at minScrollExtent with large absolute pixels', () {
      expect(isNearScrollExtentEnd(pixels: 80, minScrollExtent: 80), isTrue);
      expect(80 <= 24, isFalse);
    });

    test('is false when far from minScrollExtent', () {
      expect(isNearScrollExtentEnd(pixels: 140, minScrollExtent: 80), isFalse);
    });
  });

  group('isLiveNearBottom', () {
    test('is true at minScrollExtent with large absolute pixels', () {
      expect(isLiveNearBottom(pixels: 80, minScrollExtent: 80), isTrue);
    });

    test('is false when far from minScrollExtent', () {
      expect(isLiveNearBottom(pixels: 140, minScrollExtent: 80), isFalse);
    });
  });

  group('shouldShowUnreadBar', () {
    test('returns false when there is no unread', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: false,
          liveNearBottom: false,
          hasMoreNewerMessages: false,
          isManualReadState: false,
        ),
        isFalse,
      );
    });

    test('suppresses at bottom on latest page with unread', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: false,
          isManualReadState: false,
        ),
        isFalse,
      );
    });

    test('shows when scrolled up with unread', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: true,
          liveNearBottom: false,
          hasMoreNewerMessages: false,
          isManualReadState: false,
        ),
        isTrue,
      );
    });

    test('shows at bottom when read state is manual', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: false,
          isManualReadState: true,
        ),
        isTrue,
      );
    });

    test('suppresses at bottom without a manual read state', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: false,
          isManualReadState: false,
        ),
        isFalse,
      );
    });

    test('shows at bottom when newer pages remain', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: true,
          isManualReadState: false,
        ),
        isTrue,
      );
    });
  });

  group('distanceFromScrollExtentEnd', () {
    test('returns zero at minScrollExtent', () {
      expect(distanceFromScrollExtentEnd(pixels: 80, minScrollExtent: 80), 0);
    });

    test('returns offset above minScrollExtent', () {
      expect(distanceFromScrollExtentEnd(pixels: 140, minScrollExtent: 80), 60);
    });
  });

  group('isBeyondJumpToBottomThreshold', () {
    test('is false just below half a viewport', () {
      expect(
        isBeyondJumpToBottomThreshold(
          distanceFromBottom: 199,
          viewportHeight: 400,
        ),
        isFalse,
      );
    });

    test('is true at half a viewport', () {
      expect(
        isBeyondJumpToBottomThreshold(
          distanceFromBottom: 200,
          viewportHeight: 400,
        ),
        isTrue,
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
          distanceFromBottom: 500,
          viewportHeight: 400,
          hasMoreNewerMessages: false,
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
          distanceFromBottom: 500,
          viewportHeight: 400,
          hasMoreNewerMessages: false,
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
          distanceFromBottom: 500,
          viewportHeight: 400,
          hasMoreNewerMessages: false,
        ),
        isFalse,
      );
    });

    test('returns false within half a viewport of bottom on latest page', () {
      expect(
        shouldShowJumpToBottomButton(
          hasMessages: true,
          isLoading: false,
          isActiveReadChannel: true,
          distanceFromBottom: 199,
          viewportHeight: 400,
          hasMoreNewerMessages: false,
        ),
        isFalse,
      );
    });

    test('returns true when scrolled up at least half a viewport', () {
      expect(
        shouldShowJumpToBottomButton(
          hasMessages: true,
          isLoading: false,
          isActiveReadChannel: true,
          distanceFromBottom: 200,
          viewportHeight: 400,
          hasMoreNewerMessages: false,
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
          viewportHeight: 400,
          hasMoreNewerMessages: true,
        ),
        isTrue,
      );
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
