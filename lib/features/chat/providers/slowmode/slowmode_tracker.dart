import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slowmode_tracker.g.dart';

@Riverpod(keepAlive: true)
class SlowmodeTracker extends _$SlowmodeTracker {
  final Map<String, DateTime> _lastSentAt = <String, DateTime>{};
  final Map<String, DateTime> _cooldownExpiresAt = <String, DateTime>{};

  @override
  Map<String, int> build() => <String, int>{};

  void recordSend(String channelId) {
    if (channelId.isEmpty) {
      return;
    }
    _lastSentAt[channelId] = DateTime.now();
    state = {...state, channelId: (state[channelId] ?? 0) + 1};
  }

  void updateSendTimestamp(String channelId, DateTime sentAt) {
    if (channelId.isEmpty) {
      return;
    }
    final DateTime? existing = _lastSentAt[channelId];
    if (existing == sentAt) {
      return;
    }
    if (existing != null && !sentAt.isAfter(existing)) {
      return;
    }
    _lastSentAt[channelId] = sentAt;
    state = {...state, channelId: (state[channelId] ?? 0) + 1};
  }

  void updateCooldownRemaining(String channelId, int retryAfterMs) {
    if (channelId.isEmpty) {
      return;
    }
    if (retryAfterMs <= 0) {
      clearChannel(channelId);
      return;
    }
    final DateTime expiresAt = DateTime.now().add(
      Duration(milliseconds: retryAfterMs),
    );
    if (_cooldownExpiresAt[channelId] == expiresAt) {
      return;
    }
    _cooldownExpiresAt[channelId] = expiresAt;
    state = {...state, channelId: (state[channelId] ?? 0) + 1};
  }

  void syncFromResponse(
    String channelId,
    ChannelSlowmodeStateResponse response,
  ) {
    if (channelId.isEmpty) {
      return;
    }
    if (response.rateLimitPerUser <= 0 || response.canBypass) {
      clearChannel(channelId);
      return;
    }
    if (response.retryAfterMs <= 0) {
      clearChannel(channelId);
      return;
    }
    updateCooldownRemaining(channelId, response.retryAfterMs);
  }

  void clearChannel(String channelId) {
    if (channelId.isEmpty) {
      return;
    }
    final bool hadState =
        _lastSentAt.containsKey(channelId) ||
        _cooldownExpiresAt.containsKey(channelId);
    if (!hadState) {
      return;
    }
    _lastSentAt.remove(channelId);
    _cooldownExpiresAt.remove(channelId);
    state = {...state, channelId: (state[channelId] ?? 0) + 1};
  }

  Duration remainingFor(String channelId, int rateLimitPerUser) {
    if (channelId.isEmpty || rateLimitPerUser <= 0) {
      return Duration.zero;
    }
    final DateTime now = DateTime.now();
    final DateTime? serverExpiresAt = _cooldownExpiresAt[channelId];
    final Duration serverRemaining = serverExpiresAt == null
        ? Duration.zero
        : serverExpiresAt.difference(now);
    final DateTime? lastSent = _lastSentAt[channelId];
    Duration localRemaining = Duration.zero;
    if (lastSent != null) {
      final DateTime expiresAt = lastSent.add(
        Duration(seconds: rateLimitPerUser),
      );
      localRemaining = expiresAt.difference(now);
    }
    final Duration remaining = serverRemaining > localRemaining
        ? serverRemaining
        : localRemaining;
    return remaining.isNegative ? Duration.zero : remaining;
  }

  void reset() {
    _lastSentAt.clear();
    _cooldownExpiresAt.clear();
    state = <String, int>{};
  }
}
