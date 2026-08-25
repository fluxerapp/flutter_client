import 'package:fluxer_app/core/audio/app_media_audio_session.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_context.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';

Future<void> restorePreferredAppAudioSession() async {
  if (ChatAttachmentAudioSession.instance.isVoiceCallActive) {
    return;
  }
  if (ChatAttachmentAudioSession.instance.hasActivePlayback) {
    await activateChatAttachmentAudioSession();
    return;
  }
  await releaseAppAudioSessionForMixing();
}
