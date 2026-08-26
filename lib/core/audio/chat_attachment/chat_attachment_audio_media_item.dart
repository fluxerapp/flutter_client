import 'package:audio_service/audio_service.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_artwork.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';

MediaItem buildChatAttachmentAudioMediaItem({
  required Attachment attachment,
  required String title,
  Duration? duration,
}) {
  final String mediaId = attachmentEffectiveUrl(attachment);
  final Duration? resolvedDuration =
      duration ??
      (attachment.duration != null && attachment.duration! > 0
          ? Duration(milliseconds: attachment.duration!)
          : null);
  return MediaItem(
    id: mediaId.isNotEmpty ? mediaId : attachment.filename,
    title: title,
    duration: resolvedDuration,
    artUri: chatAttachmentAudioArtUri,
  );
}
