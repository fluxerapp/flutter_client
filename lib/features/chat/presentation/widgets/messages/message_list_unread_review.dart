/// Read-viewport and unread-indicator decisions for the message list.
library;

const double kMessageListReadBottomThreshold = 48;

const double kJumpToBottomViewportFraction = 0.5;

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

bool isNearTrailingEdge({
  required double distanceFromTrailingEdge,
  double threshold = kMessageListReadBottomThreshold,
}) {
  return distanceFromTrailingEdge <= threshold;
}

double distanceFromScrollExtentEnd({
  required double pixels,
  required double minScrollExtent,
}) {
  return (pixels - minScrollExtent).clamp(0, double.infinity);
}

bool isBeyondJumpToBottomThreshold({
  required double distanceFromBottom,
  required double viewportHeight,
}) {
  return viewportHeight > 0 &&
      distanceFromBottom >= viewportHeight * kJumpToBottomViewportFraction;
}

/// Visibility of the top "new messages" bar: driven by the unread count and
/// suppressed at the bottom of the latest page.
bool shouldShowUnreadBar({
  required bool hasUnread,
  required bool liveNearBottom,
  required bool hasMoreNewerMessages,
  required bool isManualReadState,
}) {
  if (!hasUnread) {
    return false;
  }
  if (isManualReadState) {
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
  return isBeyondJumpToBottomThreshold(
    distanceFromBottom: distanceFromBottom,
    viewportHeight: viewportHeight,
  );
}
