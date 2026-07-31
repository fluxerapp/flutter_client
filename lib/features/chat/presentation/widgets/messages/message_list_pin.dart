/// Event-sourced stick-to-bottom latch (web-parity 8/64 px hysteresis).
///
/// The latch is written ONLY by the named user/system events below - never
/// recomputed inside a messages-write handler. That preserves the
/// terminal-page contract: the final page of the user's own pagination lands
/// while `pinned == false` (the user was detached) and therefore must not
/// follow, even though it is byte-identical to a live arrival afterwards.
library;

class MessageListPin {
  bool pinned = false;

  /// A user scroll settled. Engage within 8 px of the live tail; once
  /// engaged, hold until 64 px away. A detached window (unloaded newer
  /// history) can never pin - its loaded tail is history, not the present.
  void onUserScrollEnd({
    required double distanceFromLiveTail,
    required bool hasMoreNewer,
  }) {
    pinned =
        !hasMoreNewer &&
        (distanceFromLiveTail <= 8 || (pinned && distanceFromLiveTail <= 64));
  }

  /// A jump-to-present (or an explicit to-tail intent) landed at the tail.
  void onJumpToPresentLanded() {
    pinned = true;
  }

  /// The user sent a message: their own send always re-engages the tail.
  void onOwnSend() {
    pinned = true;
  }

  /// Any write detached the window (hasMoreNewerMessages became true).
  void onDetached() {
    pinned = false;
  }
}
