import 'package:audio_service/audio_service.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';

class ChatAttachmentAudioHandler extends BaseAudioHandler
    with SeekHandler
    implements ChatAttachmentAudioPublisher {
  ChatAttachmentAudioHandler(this._session) {
    _session.registerPublisher(this);
  }

  final ChatAttachmentAudioSession _session;

  @override
  Future<void> play() => _session.handleSystemPlay();

  @override
  Future<void> pause() => _session.handleSystemPause();

  @override
  Future<void> stop() => _session.handleSystemStop();

  @override
  Future<void> seek(Duration position) => _session.handleSystemSeek(position);

  @override
  void publishMediaItem(MediaItem? item) {
    mediaItem.add(item);
  }

  @override
  void publishPlaybackState(PlaybackState state) {
    playbackState.add(state);
  }
}
