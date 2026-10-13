const double kMessageListReadBottomThreshold = 48;

const double kJumpToBottomDistance = 1100;
const double kChatReadViewportDistanceStep = 48;

double quantizeReadViewportDistance(double distance) {
  if (distance.isNaN || distance <= 0) {
    return 0;
  }
  if (!distance.isFinite) {
    return distance;
  }
  return (distance / kChatReadViewportDistanceStep).floor() *
      kChatReadViewportDistanceStep;
}

bool isNearTrailingEdge({
  required double distanceFromTrailingEdge,
  double threshold = kMessageListReadBottomThreshold,
}) {
  return distanceFromTrailingEdge <= threshold;
}

bool isBeyondJumpToBottomThreshold({required double distanceFromBottom}) {
  return distanceFromBottom >= kJumpToBottomDistance;
}

bool shouldShowChannelWelcome({
  required bool hasMoreOlderMessages,
  required bool messageLoadFailed,
}) {
  return !hasMoreOlderMessages && !messageLoadFailed;
}

bool shouldShowJumpToBottomButton({
  required bool hasMessages,
  required bool isLoading,
  required bool isActiveReadChannel,
  required double distanceFromBottom,
  required bool hasMoreNewerMessages,
  required bool messageLoadFailed,
}) {
  if (!hasMessages || isLoading || !isActiveReadChannel || messageLoadFailed) {
    return false;
  }
  if (hasMoreNewerMessages) {
    return true;
  }
  return isBeyondJumpToBottomThreshold(distanceFromBottom: distanceFromBottom);
}
