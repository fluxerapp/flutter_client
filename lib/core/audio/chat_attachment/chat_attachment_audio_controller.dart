import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_binding.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_playback.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

/// Attachment audio playback that outlives a message-row remount.
class ChatAttachmentAudioController extends ChangeNotifier {
  factory ChatAttachmentAudioController({
    required String sourceUrl,
    required Attachment attachment,
    required String Function() title,
  }) {
    final ChatAttachmentAudioController? existing = _controllers[sourceUrl];
    if (existing != null && !existing._disposed) {
      existing
        .._attachment = attachment
        .._title = title;
      return existing;
    }
    final ChatAttachmentAudioController controller =
        ChatAttachmentAudioController._(
          sourceUrl: sourceUrl,
          attachment: attachment,
          title: title,
        );
    _controllers[sourceUrl] = controller;
    return controller;
  }

  ChatAttachmentAudioController._({
    required this.sourceUrl,
    required this._attachment,
    required this._title,
  }) {
    _binding = ChatAttachmentAudioBinding(
      hostId: sourceUrl,
      pausePlayback: pause,
      resumePlayback: resume,
      seekPlayback: _seekFromMediaSession,
      stopPlayback: stop,
    );
    _sessionReporter = ChatAttachmentAudioSessionReporter(
      binding: _binding,
      attachment: () => _attachment,
      title: () => _title(),
      totalDuration: () => _mediaSessionTotalDuration,
      playbackRate: () => _playbackRate,
      position: position,
    );
  }

  static const Duration _kSeekTimeout = Duration(seconds: 8);
  static const List<double> _kPlaybackRates = <double>[1, 1.25, 1.5, 2];

  static final Map<String, ChatAttachmentAudioController> _controllers =
      <String, ChatAttachmentAudioController>{};

  @visibleForTesting
  static bool debugContainsSource(String sourceUrl) =>
      _controllers.containsKey(sourceUrl);

  @visibleForTesting
  static void resetForTest() {
    final List<ChatAttachmentAudioController> controllers = _controllers.values
        .toList(growable: false);
    _controllers.clear();
    for (final ChatAttachmentAudioController controller in controllers) {
      controller._discard();
    }
  }

  final String sourceUrl;
  Attachment _attachment;
  String Function() _title;

  late final ChatAttachmentAudioBinding _binding;
  late final ChatAttachmentAudioSessionReporter _sessionReporter;
  final ChatAttachmentAudioPosition position = ChatAttachmentAudioPosition();

  AudioPlayer? _player;
  StreamSubscription<PlayerState>? _playerStateSubscription;
  StreamSubscription<void>? _playerCompleteSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _durationSubscription;

  bool _isPlaying = false;
  bool _isLoading = false;
  bool _hasPreparedSource = false;
  bool _hasStarted = false;
  bool _playbackFinished = false;
  bool _disposed = false;
  Duration _duration = Duration.zero;
  double _volume = 1;
  bool _isMuted = false;
  double _playbackRate = 1;

  bool get isPlaying => _isPlaying;
  bool get isLoading => _isLoading;
  bool get hasStarted => _hasStarted;
  Duration get duration => _duration;
  double get volume => _volume;
  bool get isMuted => _isMuted;
  double get playbackRate => _playbackRate;

  Duration get _mediaSessionTotalDuration {
    if (_duration > Duration.zero) {
      return _duration;
    }
    final int? attachmentDuration = _attachment.duration;
    if (attachmentDuration != null && attachmentDuration > 0) {
      return Duration(milliseconds: attachmentDuration);
    }
    return Duration.zero;
  }

  bool get _isAtEndOfTrack =>
      _duration > Duration.zero && position.value >= _duration;

  /// Releases this widget's hold. Playing audio keeps running until it stops.
  void detach() {
    if (_disposed) {
      return;
    }
    if (hasListeners || _isPlaying || _isLoading) {
      return;
    }
    _removeFromRegistry();
    _discard();
  }

  /// Returns false when the source could not be prepared.
  Future<bool> togglePlayback() async {
    if (_disposed || _isLoading || sourceUrl.isEmpty) {
      return true;
    }
    if (_isPlaying) {
      await pause();
      return true;
    }
    _hasStarted = true;
    _isLoading = true;
    _notify();
    try {
      final AudioPlayer player = _ensurePlayer();
      if (_playbackFinished || _isAtEndOfTrack) {
        await _replayFromStart(player);
        _sessionReporter.sync(playing: true);
        return true;
      }
      if (!_hasPreparedSource) {
        _sessionReporter.sync(playing: false, loading: true);
        await player.setSourceUrl(sourceUrl);
        _hasPreparedSource = true;
      }
      await player.resume();
      _sessionReporter.sync(playing: true);
      return true;
    } on Object {
      return _hasPreparedSource;
    } finally {
      _isLoading = false;
      _notify();
    }
  }

  Future<void> pause() async {
    if (_disposed) {
      return;
    }
    _isPlaying = false;
    _sessionReporter.sync(playing: false);
    _notify();
    await _player?.pause();
  }

  Future<void> resume() async {
    if (_disposed || _isLoading || sourceUrl.isEmpty) {
      return;
    }
    final AudioPlayer player = _ensurePlayer();
    if (_playbackFinished || _isAtEndOfTrack) {
      await _replayFromStart(player);
      return;
    }
    if (!_hasPreparedSource) {
      await player.setSourceUrl(sourceUrl);
      _hasPreparedSource = true;
    }
    await player.resume();
  }

  Future<void> stop() async {
    await _player?.stop();
    if (_disposed) {
      return;
    }
    _isPlaying = false;
    _playbackFinished = false;
    _hasPreparedSource = false;
    _hasStarted = false;
    position.update(Duration.zero);
    _notify();
    if (!hasListeners) {
      _removeFromRegistry();
      _discard();
    }
  }

  Future<void> seekToRelativePosition(double relative) async {
    if (_duration <= Duration.zero) {
      return;
    }
    final double normalized = relative.clamp(0, 1);
    final int targetMilliseconds = (_duration.inMilliseconds * normalized)
        .round();
    final Duration target = Duration(milliseconds: targetMilliseconds);
    final AudioPlayer player = _ensurePlayer();
    if (_playbackFinished) {
      await _prepareFromStart(player);
    }
    if (!_hasPreparedSource) {
      return;
    }
    final bool seeked = await _safeSeek(player, target);
    if (!seeked) {
      await player.setSourceUrl(sourceUrl);
      _hasPreparedSource = true;
      await _safeSeek(player, target);
    }
    if (_disposed) {
      return;
    }
    position.update(target);
    _playbackFinished = false;
    _sessionReporter.sync(playing: _isPlaying);
    _notify();
  }

  Future<void> setVolume(double value) async {
    final double clamped = value.clamp(0, 1);
    _volume = clamped;
    if (clamped > 0) {
      _isMuted = false;
    }
    _notify();
    await _player?.setVolume(_isMuted ? 0 : clamped);
  }

  Future<void> toggleMute() async {
    _isMuted = !_isMuted;
    _notify();
    await _player?.setVolume(_isMuted ? 0 : _volume);
  }

  Future<void> cyclePlaybackRate() async {
    final int index = _kPlaybackRates.indexOf(_playbackRate);
    final int nextIndex = index < 0 || index == _kPlaybackRates.length - 1
        ? 0
        : index + 1;
    final double nextRate = _kPlaybackRates[nextIndex];
    _playbackRate = nextRate;
    _notify();
    await _player?.setPlaybackRate(nextRate);
    if (_binding.isActive) {
      _sessionReporter.sync(playing: _isPlaying);
    }
  }

  Future<void> _seekFromMediaSession(Duration target) async {
    if (_duration <= Duration.zero) {
      return;
    }
    final double relative = target.inMilliseconds / _duration.inMilliseconds;
    await seekToRelativePosition(relative);
  }

  Future<void> _prepareFromStart(AudioPlayer player) async {
    _playbackFinished = false;
    if (!_hasPreparedSource) {
      await player.setSourceUrl(sourceUrl);
      _hasPreparedSource = true;
    } else {
      final bool seeked = await _safeSeek(player, Duration.zero);
      if (!seeked) {
        await player.setSourceUrl(sourceUrl);
        _hasPreparedSource = true;
      }
    }
    if (!_disposed) {
      position.update(Duration.zero);
    }
  }

  Future<void> _replayFromStart(AudioPlayer player) async {
    await _prepareFromStart(player);
    await player.resume();
  }

  Future<bool> _safeSeek(AudioPlayer player, Duration target) async {
    try {
      await player.seek(target).timeout(_kSeekTimeout);
      return true;
    } on Object {
      return false;
    }
  }

  AudioPlayer _ensurePlayer() {
    final AudioPlayer? existingPlayer = _player;
    if (existingPlayer != null) {
      return existingPlayer;
    }
    final AudioPlayer player = AudioPlayer();
    _player = player;
    unawaited(player.setReleaseMode(ReleaseMode.stop));
    unawaited(player.setVolume(_isMuted ? 0 : _volume));
    unawaited(player.setPlaybackRate(_playbackRate));
    _playerStateSubscription = player.onPlayerStateChanged.listen((
      PlayerState playerState,
    ) {
      if (_disposed) {
        return;
      }
      _isPlaying = playerState == PlayerState.playing;
      _notify();
      _sessionReporter.sync(playing: _isPlaying);
    });
    _playerCompleteSubscription = player.onPlayerComplete.listen((_) {
      if (_disposed) {
        return;
      }
      final Duration endPosition = _duration > Duration.zero
          ? _duration
          : Duration.zero;
      _isPlaying = false;
      _playbackFinished = true;
      if (endPosition > Duration.zero) {
        position.update(endPosition);
      }
      _sessionReporter.sync(playing: false, completed: true);
      _notify();
      if (!hasListeners) {
        _removeFromRegistry();
        _discard();
      }
    });
    _positionSubscription = player.onPositionChanged.listen((
      Duration nextPosition,
    ) {
      if (_disposed) {
        return;
      }
      position.update(nextPosition);
      if (_isPlaying) {
        _sessionReporter.syncPositionIfDue(playing: true);
      }
    });
    _durationSubscription = player.onDurationChanged.listen((
      Duration duration,
    ) {
      if (_disposed) {
        return;
      }
      _duration = duration;
      _notify();
      if (_binding.isActive) {
        _sessionReporter.sync(playing: _isPlaying);
      }
    });
    return player;
  }

  void _notify() {
    if (!_disposed) {
      notifyListeners();
    }
  }

  void _removeFromRegistry() {
    if (_controllers[sourceUrl] == this) {
      _controllers.remove(sourceUrl);
    }
  }

  void _discard() {
    if (_disposed) {
      return;
    }
    _disposed = true;
    _binding.release();
    position.dispose();
    unawaited(_playerStateSubscription?.cancel());
    unawaited(_playerCompleteSubscription?.cancel());
    unawaited(_positionSubscription?.cancel());
    unawaited(_durationSubscription?.cancel());
    unawaited(_player?.dispose());
    super.dispose();
  }

  @visibleForTesting
  void debugSetPlaying() {
    _isPlaying = true;
    _hasStarted = true;
  }
}
