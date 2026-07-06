import 'dart:async';

import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';

typedef MessageNotificationSfxPlayCallback = void Function(FluxerSfxClip clip);

class MessageNotificationSfxScheduler {
  MessageNotificationSfxScheduler({
    this.debounceMs = 120,
    this.cooldownMs = 900,
    this.maxWaitMs = 1000,
  });

  final int debounceMs;
  final int cooldownMs;
  final int maxWaitMs;

  Timer? _debounceTimer;
  FluxerSfxClip? _pendingClip;
  DateTime? _queuedAt;
  DateTime? _lastPlayedAt;

  void schedule({
    required FluxerSfxClip clip,
    required MessageNotificationSfxPlayCallback play,
  }) {
    final DateTime now = DateTime.now();
    _pendingClip = clip;
    _queuedAt ??= now;
    _debounceTimer?.cancel();
    final int elapsedMs = now.difference(_queuedAt!).inMilliseconds;
    final int delayMs = elapsedMs >= maxWaitMs ? 0 : _resolveDelayMs(now: now);
    if (delayMs <= 0) {
      _flush(play);
      return;
    }
    _debounceTimer = Timer(Duration(milliseconds: delayMs), () {
      _flush(play);
    });
  }

  int _resolveDelayMs({required DateTime now}) {
    final DateTime? lastPlayed = _lastPlayedAt;
    if (lastPlayed == null) {
      return debounceMs;
    }
    final int sinceLastMs = now.difference(lastPlayed).inMilliseconds;
    if (sinceLastMs >= cooldownMs) {
      return debounceMs;
    }
    return cooldownMs - sinceLastMs;
  }

  void _flush(MessageNotificationSfxPlayCallback play) {
    _debounceTimer?.cancel();
    _debounceTimer = null;
    final FluxerSfxClip? clip = _pendingClip;
    _pendingClip = null;
    _queuedAt = null;
    if (clip == null) {
      return;
    }
    _lastPlayedAt = DateTime.now();
    play(clip);
  }

  void dispose() {
    _debounceTimer?.cancel();
    _debounceTimer = null;
    _pendingClip = null;
    _queuedAt = null;
  }
}
