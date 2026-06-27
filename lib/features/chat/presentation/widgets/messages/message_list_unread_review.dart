/// Read-viewport and unread-indicator decisions for the message list.
library;

const double kMessageListReadBottomThreshold = 48;

bool isNearScrollExtentEnd({
  required double pixels,
  required double minScrollExtent,
  double threshold = kMessageListReadBottomThreshold,
}) {
  return (pixels - minScrollExtent) <= threshold;
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

double distanceFromScrollExtentEnd({
  required double pixels,
  required double minScrollExtent,
}) {
  return (pixels - minScrollExtent).clamp(0, double.infinity);
}

bool isAtLeastOneViewportFromBottom({
  required double distanceFromBottom,
  required double viewportHeight,
}) {
  return viewportHeight > 0 && distanceFromBottom >= viewportHeight;
}

/// Visibility of the top "new messages" bar: driven by the unread count and
/// suppressed at the bottom of the latest page.
bool shouldShowUnreadBar({
  required bool hasUnread,
  required bool liveNearBottom,
  required bool hasMoreNewerMessages,
  required bool isManualReadState,
  required String? stickyUnreadMessageId,
}) {
  if (!hasUnread) {
    return false;
  }
  if (isManualReadState ||
      (stickyUnreadMessageId != null && stickyUnreadMessageId.isNotEmpty)) {
    return true;
  }
  if (liveNearBottom && !hasMoreNewerMessages) {
    return false;
  }
  return true;
}

/// Visibility of the jump-to-bottom overlay button.
bool shouldShowJumpToBottomButton({
  required bool hasMessages,
  required bool isLoading,
  required bool isActiveReadChannel,
  required double distanceFromBottom,
  required double viewportHeight,
  required bool hasMoreNewerMessages,
}) {
  if (!hasMessages || isLoading || !isActiveReadChannel) {
    return false;
  }
  if (hasMoreNewerMessages) {
    return true;
  }
  return isAtLeastOneViewportFromBottom(
    distanceFromBottom: distanceFromBottom,
    viewportHeight: viewportHeight,
  );
}
