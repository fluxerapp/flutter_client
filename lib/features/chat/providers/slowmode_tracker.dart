import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slowmode_tracker.g.dart';

@Riverpod(keepAlive: true)
class SlowmodeTracker extends _$SlowmodeTracker {
  final Map<String, DateTime> _lastSentAt = <String, DateTime>{};

  @override
  int build() => 0;

  void recordSend(String channelId) {
    if (channelId.isEmpty) {
      return;
    }
    _lastSentAt[channelId] = DateTime.now();
    state = state + 1;
  }

  Duration remainingFor(String channelId, int rateLimitPerUser) {
    if (channelId.isEmpty || rateLimitPerUser <= 0) {
      return Duration.zero;
    }
    final lastSent = _lastSentAt[channelId];
    if (lastSent == null) {
      return Duration.zero;
    }
    final expiresAt = lastSent.add(Duration(seconds: rateLimitPerUser));
    final remaining = expiresAt.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  }

  void reset() {
    _lastSentAt.clear();
    state = state + 1;
  }
}
