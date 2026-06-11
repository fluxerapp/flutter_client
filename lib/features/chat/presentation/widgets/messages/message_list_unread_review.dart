/// Read-viewport and pagination decisions during sticky-unread review mode.
library;

const double kMessageListReadBottomThreshold = 48;

bool isInUnreadReview({
  required String? stickyUnreadMessageId,
  required bool initialUnreadPivotReleased,
}) {
  return stickyUnreadMessageId != null && !initialUnreadPivotReleased;
}

bool isNearScrollExtentEnd({
  required double pixels,
  required double minScrollExtent,
  double threshold = kMessageListReadBottomThreshold,
}) {
  return (pixels - minScrollExtent) <= threshold;
}

bool shouldReleaseUnreadReviewOnScrollEnd({
  required bool inUnreadReview,
  required double pixels,
  required double minScrollExtent,
  double threshold = kMessageListReadBottomThreshold,
}) {
  return inUnreadReview &&
      isNearScrollExtentEnd(
        pixels: pixels,
        minScrollExtent: minScrollExtent,
        threshold: threshold,
      );
}

bool shouldClearPivotOnUnreadReviewRelease({
  required bool hasMoreNewerMessages,
}) {
  return !hasMoreNewerMessages;
}

bool shouldMigratePivotDuringUnreadReview({required bool inUnreadReview}) {
  return false;
}

bool canTriggerLoadNewerDuringUnreadReview({required bool inUnreadReview}) {
  return !inUnreadReview;
}

bool reportIsNearBottomForReadViewport({
  required bool inUnreadReview,
  required bool liveNearBottom,
}) {
  if (inUnreadReview) {
    return false;
  }
  return liveNearBottom;
}

bool isLiveNearBottom({
  required double pixels,
  required double minScrollExtent,
  double threshold = kMessageListReadBottomThreshold,
}) {
  return isNearScrollExtentEnd(
    pixels: pixels,
    minScrollExtent: minScrollExtent,
    threshold: threshold,
  );
}

bool shouldShowUnreadIndicators({
  required bool hasUnread,
  required bool liveNearBottom,
  required bool hasMoreNewerMessages,
  required bool isManualReadState,
  required bool inUnreadReview,
  required String? stickyUnreadMessageId,
}) {
  if (!hasUnread) {
    return false;
  }
  if (isManualReadState ||
      inUnreadReview ||
      (stickyUnreadMessageId != null && stickyUnreadMessageId.isNotEmpty)) {
    return true;
  }
  if (liveNearBottom && !hasMoreNewerMessages) {
    return false;
  }
  return true;
}
