import 'package:audio_service/audio_service.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_artwork.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

MediaItem buildChatAttachmentAudioMediaItem({
  required Attachment attachment,
  required String title,
  Duration? duration,
}) {
  final String mediaId = (attachment.proxyUrl?.trim().isNotEmpty ?? false)
      ? attachment.proxyUrl!.trim()
      : attachment.url.trim();
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
