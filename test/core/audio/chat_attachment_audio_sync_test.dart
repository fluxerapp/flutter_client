import 'package:audio_service/audio_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_binding.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_handler.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_sync.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

void main() {
  late ChatAttachmentAudioSession session;
  late ChatAttachmentAudioHandler handler;
  late ChatAttachmentAudioBinding binding;

  const Attachment attachment = Attachment(
    id: 'attachment-id',
    url: 'https://example.com/audio.mp3',
    filename: 'audio.mp3',
    size: 1024,
  );

  setUp(() {
    session = ChatAttachmentAudioSession.instance..resetForTest();
    handler = ChatAttachmentAudioHandler(session);
    binding = ChatAttachmentAudioBinding(
      hostId: attachment.url,
      pausePlayback: () async {},
      resumePlayback: () async {},
      seekPlayback: (_) async {},
      stopPlayback: () async {},
      session: session,
    );
  });

  test(
    'completed playback releases the media session without republishing',
    () async {
      await binding.claim(
        mediaItem: const MediaItem(id: 'audio', title: 'audio.mp3'),
        playing: true,
        position: Duration.zero,
        bufferedPosition: const Duration(seconds: 30),
        speed: 1,
      );

      syncChatAttachmentAudioSession(
        binding: binding,
        attachment: attachment,
        title: attachment.filename,
        playing: false,
        position: const Duration(seconds: 30),
        totalDuration: const Duration(seconds: 30),
        playbackRate: 1,
        completed: true,
      );

      expect(session.isActiveHost(attachment.url), isFalse);
      expect(handler.mediaItem.value, isNull);
      expect(
        handler.playbackState.value.processingState,
        AudioProcessingState.idle,
      );

      await pumpEventQueue();

      expect(handler.mediaItem.value, isNull);
      expect(
        handler.playbackState.value.processingState,
        AudioProcessingState.idle,
      );
    },
  );
}
