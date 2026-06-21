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
