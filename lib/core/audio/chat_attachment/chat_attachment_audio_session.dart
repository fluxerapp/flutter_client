import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_context.dart';

typedef ChatAttachmentAudioAction = Future<void> Function();
typedef ChatAttachmentAudioSeekAction =
    Future<void> Function(Duration position);

abstract class ChatAttachmentAudioPublisher {
  void publishMediaItem(MediaItem? item);

  void publishPlaybackState(PlaybackState state);
}

class ChatAttachmentAudioHostCallbacks {
  const ChatAttachmentAudioHostCallbacks({
    required this.onPauseRequested,
    required this.onResumeRequested,
    required this.onSeekRequested,
    required this.onStopRequested,
  });

  final ChatAttachmentAudioAction onPauseRequested;
  final ChatAttachmentAudioAction onResumeRequested;
  final ChatAttachmentAudioSeekAction onSeekRequested;
  final ChatAttachmentAudioAction onStopRequested;
}

class ChatAttachmentAudioSession {
  ChatAttachmentAudioSession._();

  static final ChatAttachmentAudioSession instance =
      ChatAttachmentAudioSession._();

  ChatAttachmentAudioPublisher? _handler;
  String? _activeHostId;
  ChatAttachmentAudioHostCallbacks? _activeCallbacks;
  MediaItem? _activeMediaItem;
  bool _voiceCallActive = false;

  bool get isAvailable => _handler != null;

  bool isActiveHost(String hostId) => _activeHostId == hostId;

  void registerPublisher(ChatAttachmentAudioPublisher handler) {
    _handler = handler;
  }

  Future<void> claim({
    required String hostId,
    required MediaItem mediaItem,
    required ChatAttachmentAudioHostCallbacks callbacks,
    required bool playing,
    required Duration position,
    required Duration bufferedPosition,
    required double speed,
    bool loading = false,
  }) async {
    if (_voiceCallActive) {
      return;
    }
    final String? previousHostId = _activeHostId;
    final ChatAttachmentAudioHostCallbacks? previousCallbacks =
        _activeCallbacks;
    if (previousHostId != null &&
        previousHostId != hostId &&
        previousCallbacks != null) {
      await previousCallbacks.onPauseRequested();
    }
    _activeHostId = hostId;
    _activeCallbacks = callbacks;
    _activeMediaItem = mediaItem;
    await configureChatAttachmentAudioSession();
    await activateChatAttachmentAudioSession();
    await _publish(
      mediaItem: mediaItem,
      playing: playing,
      position: position,
      bufferedPosition: bufferedPosition,
      speed: speed,
      loading: loading,
      completed: false,
    );
  }

  void update({
    required String hostId,
    required MediaItem mediaItem,
    required bool playing,
    required Duration position,
    required Duration bufferedPosition,
    required double speed,
    bool loading = false,
    bool completed = false,
  }) {
    if (_activeHostId != hostId) {
      return;
    }
    _activeMediaItem = mediaItem;
    unawaited(
      _publish(
        mediaItem: _activeMediaItem,
        playing: playing,
        position: position,
        bufferedPosition: bufferedPosition,
        speed: speed,
        loading: loading,
        completed: completed,
      ),
    );
  }

  void release(String hostId) {
    if (_activeHostId != hostId) {
      return;
    }
    _clearActiveHost();
    _publishIdle();
    unawaited(restoreMixableSfxAudioSession());
  }

  Future<void> clearForVoiceCall() async {
    _voiceCallActive = true;
    final ChatAttachmentAudioHostCallbacks? callbacks = _activeCallbacks;
    if (callbacks != null) {
      await callbacks.onStopRequested();
    }
    _clearActiveHost();
    _publishIdle();
    await restoreMixableSfxAudioSession();
  }

  void restoreAfterVoiceCall() {
    _voiceCallActive = false;
  }

  @visibleForTesting
  void resetForTest() {
    _handler = null;
    _activeHostId = null;
    _activeCallbacks = null;
    _activeMediaItem = null;
    _voiceCallActive = false;
  }

  Future<void> handleSystemPlay() => _withActiveCallbacks(
    (ChatAttachmentAudioHostCallbacks callbacks) =>
        callbacks.onResumeRequested(),
  );

  Future<void> handleSystemPause() => _withActiveCallbacks(
    (ChatAttachmentAudioHostCallbacks callbacks) =>
        callbacks.onPauseRequested(),
  );

  Future<void> handleSystemStop() async {
    final ChatAttachmentAudioHostCallbacks? callbacks = _activeCallbacks;
    if (callbacks == null) {
      return;
    }
    await callbacks.onStopRequested();
    _clearActiveHost();
    _publishIdle();
    await restoreMixableSfxAudioSession();
  }

  Future<void> handleSystemSeek(Duration position) => _withActiveCallbacks(
    (ChatAttachmentAudioHostCallbacks callbacks) =>
        callbacks.onSeekRequested(position),
  );

  Future<void> _withActiveCallbacks(
    Future<void> Function(ChatAttachmentAudioHostCallbacks callbacks) action,
  ) async {
    final ChatAttachmentAudioHostCallbacks? callbacks = _activeCallbacks;
    if (callbacks == null) {
      return;
    }
    await action(callbacks);
  }

  void _clearActiveHost() {
    _activeHostId = null;
    _activeCallbacks = null;
    _activeMediaItem = null;
  }

  Future<void> _publish({
    required MediaItem? mediaItem,
    required bool playing,
    required Duration position,
    required Duration bufferedPosition,
    required double speed,
    required bool loading,
    required bool completed,
  }) async {
    final ChatAttachmentAudioPublisher? handler = _handler;
    if (handler == null) {
      return;
    }
    handler.publishMediaItem(mediaItem);
    if (mediaItem != null) {
      await Future<void>.delayed(Duration.zero);
    }
    handler.publishPlaybackState(
      _buildPlaybackState(
        playing: playing,
        position: position,
        bufferedPosition: bufferedPosition,
        speed: speed,
        loading: loading,
        completed: completed,
      ),
    );
  }

  void _publishIdle() {
    final ChatAttachmentAudioPublisher? handler = _handler;
    if (handler == null) {
      return;
    }
    handler
      ..publishMediaItem(null)
      ..publishPlaybackState(PlaybackState(controls: <MediaControl>[]));
  }

  PlaybackState _buildPlaybackState({
    required bool playing,
    required Duration position,
    required Duration bufferedPosition,
    required double speed,
    required bool loading,
    required bool completed,
  }) {
    final AudioProcessingState processingState;
    if (completed) {
      processingState = AudioProcessingState.completed;
    } else if (loading) {
      processingState = AudioProcessingState.loading;
    } else {
      processingState = AudioProcessingState.ready;
    }
    return PlaybackState(
      controls: <MediaControl>[
        if (playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
      ],
      systemActions: const <MediaAction>{
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const <int>[0, 1],
      processingState: processingState,
      playing: playing,
      updatePosition: position,
      bufferedPosition: bufferedPosition,
      speed: speed,
    );
  }
}
