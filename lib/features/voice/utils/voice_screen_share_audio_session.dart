import 'dart:async';

import 'package:fluxer_app/features/voice/utils/voice_track_renderer_cache.dart';

/// Shares screen-share playback so the tile and the PiP do not restart the track.
class VoiceScreenShareAudioSession<T> {
  VoiceScreenShareAudioSession({
    required this.start,
    required this.stop,
    this.stopAfter = kVoiceTrackHandoffGrace,
  });

  // T is an argument of the callback, so the field is contravariant.
  // ignore: unsafe_variance
  final Future<void> Function(T track) start;

  // T is an argument of the callback, so the field is contravariant.
  // ignore: unsafe_variance
  final Future<void> Function(T track) stop;
  final Duration stopAfter;

  final Map<T, _Playback<T>> _playback = <T, _Playback<T>>{};
  var _sessionEnded = false;

  /// True when this retain is the one that started playback.
  Future<bool> retain(T track) {
    final _Playback<T> playback = _playback.putIfAbsent(
      track,
      _Playback<T>.new,
    );
    playback.stopTimer?.cancel();
    playback.stopTimer = null;
    playback.refs++;
    var started = false;
    final Future<void> done = _enqueue(playback, () async {
      if (playback.refs == 0 || playback.playing) {
        return;
      }
      await start(track);
      playback.playing = true;
      started = true;
    });
    return done.then((_) => started);
  }

  void release(T track, {bool immediate = false}) {
    final _Playback<T>? playback = _playback[track];
    if (playback == null || playback.refs <= 0) {
      return;
    }
    playback.refs--;
    if (playback.refs > 0) {
      return;
    }
    if (immediate || _sessionEnded) {
      _stopNow(track, playback);
      return;
    }
    playback.stopTimer?.cancel();
    playback.stopTimer = Timer(stopAfter, () {
      if (playback.refs > 0 || !identical(_playback[track], playback)) {
        return;
      }
      _stopNow(track, playback);
    });
  }

  void markSessionEnded() {
    _sessionEnded = true;
    for (final MapEntry<T, _Playback<T>> entry in _playback.entries.toList()) {
      final _Playback<T> playback = entry.value;
      if (playback.refs > 0) {
        continue;
      }
      _stopNow(entry.key, playback);
    }
  }

  void markSessionActive() {
    _sessionEnded = false;
  }

  Future<void> drain() async {
    markSessionEnded();
    final List<Future<void>> chains = _playback.values
        .map((_Playback<T> playback) => playback.chain)
        .toList();
    if (chains.isNotEmpty) {
      await Future.wait<void>(chains);
    }
  }

  Future<void> _enqueue(_Playback<T> playback, Future<void> Function() action) {
    final Future<void> step = playback.chain.then((_) => action());
    playback.chain = step.then<void>(
      (_) {},
      onError: (Object _, StackTrace _) {},
    );
    return step;
  }

  void _stopNow(T track, _Playback<T> playback) {
    playback.stopTimer?.cancel();
    playback.stopTimer = null;
    unawaited(
      _enqueue(playback, () async {
        if (playback.refs > 0) {
          return;
        }
        final bool wasPlaying = playback.playing;
        playback.playing = false;
        try {
          if (wasPlaying) {
            await stop(track);
          }
        } finally {
          if (playback.refs == 0 && identical(_playback[track], playback)) {
            _playback.remove(track);
          }
        }
      }),
    );
  }
}

class _Playback<T> {
  int refs = 0;
  var playing = false;
  Timer? stopTimer;
  Future<void> chain = Future<void>.value();
}
