import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';

void main() {
  group('isInUnreadReview', () {
    test('is true when sticky unread is set and pivot not released', () {
      expect(
        isInUnreadReview(
          stickyUnreadMessageId: 'msg-1',
          initialUnreadPivotReleased: false,
        ),
        isTrue,
      );
    });

    test('is false after pivot released', () {
      expect(
        isInUnreadReview(
          stickyUnreadMessageId: 'msg-1',
          initialUnreadPivotReleased: true,
        ),
        isFalse,
      );
    });
  });

  group('isNearScrollExtentEnd', () {
    test('is true at minScrollExtent with large absolute pixels', () {
      expect(isNearScrollExtentEnd(pixels: 80, minScrollExtent: 80), isTrue);
      expect(80 <= 24, isFalse);
    });

    test('is false when far from minScrollExtent', () {
      expect(isNearScrollExtentEnd(pixels: 140, minScrollExtent: 80), isFalse);
    });
  });

  group('shouldReleaseUnreadReviewOnScrollEnd', () {
    test('releases during review at bottom on scroll end', () {
      expect(
        shouldReleaseUnreadReviewOnScrollEnd(
          inUnreadReview: true,
          pixels: 0,
          minScrollExtent: 0,
        ),
        isTrue,
      );
    });

    test('releases when bottom is at positive minScrollExtent', () {
      expect(
        shouldReleaseUnreadReviewOnScrollEnd(
          inUnreadReview: true,
          pixels: 80,
          minScrollExtent: 80,
        ),
        isTrue,
      );
    });

    test('does not release during review when scrolled up', () {
      expect(
        shouldReleaseUnreadReviewOnScrollEnd(
          inUnreadReview: true,
          pixels: 100,
          minScrollExtent: 0,
        ),
        isFalse,
      );
    });

    test('does not release when offset from bottom exceeds threshold', () {
      expect(
        shouldReleaseUnreadReviewOnScrollEnd(
          inUnreadReview: true,
          pixels: 140,
          minScrollExtent: 80,
        ),
        isFalse,
      );
    });

    test('does not release after review ended at bottom', () {
      expect(
        shouldReleaseUnreadReviewOnScrollEnd(
          inUnreadReview: false,
          pixels: 0,
          minScrollExtent: 0,
        ),
        isFalse,
      );
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

  group('shouldClearPivotOnUnreadReviewRelease', () {
    test('clears pivot when at channel latest', () {
      expect(
        shouldClearPivotOnUnreadReviewRelease(hasMoreNewerMessages: false),
        isTrue,
      );
    });

    test('keeps pivot when newer pages remain', () {
      expect(
        shouldClearPivotOnUnreadReviewRelease(hasMoreNewerMessages: true),
        isFalse,
      );
    });
  });

  group('shouldMigratePivotDuringUnreadReview', () {
    test('never migrates pivot during review', () {
      expect(
        shouldMigratePivotDuringUnreadReview(inUnreadReview: true),
        isFalse,
      );
    });

    test('allows migration outside review', () {
      expect(
        shouldMigratePivotDuringUnreadReview(inUnreadReview: false),
        isFalse,
      );
    });
  });

  group('canTriggerLoadNewerDuringUnreadReview', () {
    test('blocks loadNewer during review', () {
      expect(
        canTriggerLoadNewerDuringUnreadReview(inUnreadReview: true),
        isFalse,
      );
    });

    test('allows loadNewer after review ends', () {
      expect(
        canTriggerLoadNewerDuringUnreadReview(inUnreadReview: false),
        isTrue,
      );
    });
  });

  group('reportIsNearBottomForReadViewport', () {
    test('reports false during review even at bottom', () {
      expect(
        reportIsNearBottomForReadViewport(
          inUnreadReview: true,
          liveNearBottom: true,
        ),
        isFalse,
      );
    });

    test('reports live near bottom after review ends', () {
      expect(
        reportIsNearBottomForReadViewport(
          inUnreadReview: false,
          liveNearBottom: true,
        ),
        isTrue,
      );
    });

    test('reports not near bottom when scrolled up after review', () {
      expect(
        reportIsNearBottomForReadViewport(
          inUnreadReview: false,
          liveNearBottom: false,
        ),
        isFalse,
      );
    });
  });

  group('shouldShowUnreadIndicators', () {
    test('returns false when there is no unread', () {
      expect(
        shouldShowUnreadIndicators(
          hasUnread: false,
          liveNearBottom: false,
          hasMoreNewerMessages: false,
          isManualReadState: false,
          inUnreadReview: false,
          stickyUnreadMessageId: null,
        ),
        isFalse,
      );
    });

    test('suppresses at bottom on latest page with unread', () {
      expect(
        shouldShowUnreadIndicators(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: false,
          isManualReadState: false,
          inUnreadReview: false,
          stickyUnreadMessageId: null,
        ),
        isFalse,
      );
    });

    test('shows when scrolled up with unread', () {
      expect(
        shouldShowUnreadIndicators(
          hasUnread: true,
          liveNearBottom: false,
          hasMoreNewerMessages: false,
          isManualReadState: false,
          inUnreadReview: false,
          stickyUnreadMessageId: null,
        ),
        isTrue,
      );
    });

    test('shows at bottom when read state is manual', () {
      expect(
        shouldShowUnreadIndicators(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: false,
          isManualReadState: true,
          inUnreadReview: false,
          stickyUnreadMessageId: null,
        ),
        isTrue,
      );
    });

    test('shows during unread review even at bottom', () {
      expect(
        shouldShowUnreadIndicators(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: false,
          isManualReadState: false,
          inUnreadReview: true,
          stickyUnreadMessageId: 'msg-1',
        ),
        isTrue,
      );
    });

    test('shows at bottom when sticky unread is set', () {
      expect(
        shouldShowUnreadIndicators(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: false,
          isManualReadState: false,
          inUnreadReview: false,
          stickyUnreadMessageId: 'msg-1',
        ),
        isTrue,
      );
    });

    test('shows at bottom when newer pages remain', () {
      expect(
        shouldShowUnreadIndicators(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: true,
          isManualReadState: false,
          inUnreadReview: false,
          stickyUnreadMessageId: null,
        ),
        isTrue,
      );
    });
  });
}
