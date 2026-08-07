class ChatReadAckGate {
  ChatReadAckGate({required this.minInterval});

  final Duration minInterval;
  final Set<String> _manualUnreadChannelIds = <String>{};
  final Set<String> _pendingChannelIds = <String>{};
  final Map<String, DateTime> _lastAttemptAtByChannelId = <String, DateTime>{};

  bool canAttemptAck({
    required String channelId,
    required bool isActive,
    required bool isNearBottom,
    required DateTime now,
    bool force = false,
  }) {
    if (!_canAckIgnoringThrottle(
      channelId: channelId,
      isActive: isActive,
      isNearBottom: isNearBottom,
    )) {
      return false;
    }
    if (force) {
      return true;
    }
    return retryDelay(
          channelId: channelId,
          isActive: isActive,
          isNearBottom: isNearBottom,
          now: now,
        ) ==
        Duration.zero;
  }

  Duration? retryDelay({
    required String channelId,
    required bool isActive,
    required bool isNearBottom,
    required DateTime now,
  }) {
    if (!_canAckIgnoringThrottle(
      channelId: channelId,
      isActive: isActive,
      isNearBottom: isNearBottom,
    )) {
      return null;
    }
    final lastAttemptAt = _lastAttemptAtByChannelId[channelId];
    if (lastAttemptAt == null) {
      return Duration.zero;
    }
    final elapsed = now.difference(lastAttemptAt);
    if (elapsed >= minInterval) {
      return Duration.zero;
    }
    return minInterval - elapsed;
  }

  bool _canAckIgnoringThrottle({
    required String channelId,
    required bool isActive,
    required bool isNearBottom,
  }) {
    if (channelId.isEmpty || !isActive || !isNearBottom) {
      return false;
    }
    return !_manualUnreadChannelIds.contains(channelId) &&
        !_pendingChannelIds.contains(channelId);
  }

  void markAttemptStarted(String channelId, {required DateTime now}) {
    if (channelId.isEmpty) {
      return;
    }
    _pendingChannelIds.add(channelId);
    _lastAttemptAtByChannelId[channelId] = now;
  }

  void markAttemptFinished(String channelId) {
    _pendingChannelIds.remove(channelId);
  }

  void markManualUnread(String channelId) {
    if (channelId.isNotEmpty) {
      _manualUnreadChannelIds.add(channelId);
    }
  }

  void clearManualUnread(String channelId) {
    _manualUnreadChannelIds.remove(channelId);
  }

  void advanceThrottleClockForTest(Duration offset) {
    for (final channelId in _lastAttemptAtByChannelId.keys.toList()) {
      final lastAttemptAt = _lastAttemptAtByChannelId[channelId];
      if (lastAttemptAt != null) {
        _lastAttemptAtByChannelId[channelId] = lastAttemptAt.subtract(offset);
      }
    }
  }
}
