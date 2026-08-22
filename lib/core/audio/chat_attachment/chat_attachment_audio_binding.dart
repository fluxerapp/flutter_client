import 'package:audio_service/audio_service.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';

class ChatAttachmentAudioBinding {
  ChatAttachmentAudioBinding({
    required this.hostId,
    required ChatAttachmentAudioAction pausePlayback,
    required ChatAttachmentAudioAction resumePlayback,
    required ChatAttachmentAudioSeekAction seekPlayback,
    required ChatAttachmentAudioAction stopPlayback,
    ChatAttachmentAudioSession? session,
  }) : _session = session ?? ChatAttachmentAudioSession.instance {
    _callbacks = ChatAttachmentAudioHostCallbacks(
      onPauseRequested: pausePlayback,
      onResumeRequested: resumePlayback,
      onSeekRequested: seekPlayback,
      onStopRequested: stopPlayback,
    );
  }

  final String hostId;
  final ChatAttachmentAudioSession _session;
  late final ChatAttachmentAudioHostCallbacks _callbacks;

  bool get isAvailable => _session.isAvailable;

  bool get isActive => _session.isActiveHost(hostId);

  Future<void> claim({
    required MediaItem mediaItem,
    required bool playing,
    required Duration position,
    required Duration bufferedPosition,
    required double speed,
    bool loading = false,
  }) {
    if (!isAvailable) {
      return Future<void>.value();
    }
    return _session.claim(
      hostId: hostId,
      mediaItem: mediaItem,
      callbacks: _callbacks,
      playing: playing,
      position: position,
      bufferedPosition: bufferedPosition,
      speed: speed,
      loading: loading,
    );
  }

  void update({
    required MediaItem mediaItem,
    required bool playing,
    required Duration position,
    required Duration bufferedPosition,
    required double speed,
    bool loading = false,
  }) {
    if (!isAvailable) {
      return;
    }
    _session.update(
      hostId: hostId,
      mediaItem: mediaItem,
      playing: playing,
      position: position,
      bufferedPosition: bufferedPosition,
      speed: speed,
      loading: loading,
    );
  }

  void updatePosition({
    required bool playing,
    required Duration position,
    required Duration bufferedPosition,
    required double speed,
  }) {
    if (!isAvailable) {
      return;
    }
    _session.updatePosition(
      hostId: hostId,
      playing: playing,
      position: position,
      bufferedPosition: bufferedPosition,
      speed: speed,
    );
  }

  void release() {
    if (!isAvailable) {
      return;
    }
    _session.release(hostId);
  }
}
