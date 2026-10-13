const double kMessageListPinEngageDistance = 8;
const double kMessageListPinHoldDistance = 64;

class MessageListPin {
  bool pinned = false;

  void onUserScrollEnd({
    required double distanceFromLiveTail,
    required bool hasMoreNewer,
  }) {
    pinned =
        !hasMoreNewer &&
        (distanceFromLiveTail <= kMessageListPinEngageDistance ||
            (pinned && distanceFromLiveTail <= kMessageListPinHoldDistance));
  }

  void onJumpToPresentLanded() {
    pinned = true;
  }

  void onOwnSend() {
    pinned = true;
  }

  void onDetached() {
    pinned = false;
  }
}
