import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';

class MediaOptionsLaunchContext {
  const MediaOptionsLaunchContext({
    required this.fallbackUrl,
    this.actionScope,
    this.attachmentId,
    this.embedIndex,
    this.filename,
    this.downloadUrl,
    this.contentHash,
  });

  factory MediaOptionsLaunchContext.fromVideoLaunchContext(
    ChatFullscreenVideoLaunchContext context,
  ) {
    final Attachment? attachment = context.attachment;
    return MediaOptionsLaunchContext(
      fallbackUrl: context.source.fallbackUrl,
      actionScope: context.actionScope,
      attachmentId: attachment?.id,
      embedIndex: context.embedIndex,
      filename: attachment?.filename,
      downloadUrl: _videoDownloadUrl(context),
      contentHash: attachment?.contentHash,
    );
  }

  factory MediaOptionsLaunchContext.fromImageViewerItem(
    AttachmentMediaViewerItem item, {
    MessageMediaActionScope? actionScope,
  }) {
    return MediaOptionsLaunchContext(
      fallbackUrl: item.shareableUrl,
      actionScope: actionScope,
      attachmentId: item.attachmentId,
      embedIndex: item.embedIndex,
      filename: item.filename,
      downloadUrl: item.downloadUrl,
      contentHash: item.contentHash,
    );
  }

  final String fallbackUrl;
  final MessageMediaActionScope? actionScope;
  final String? attachmentId;
  final int? embedIndex;
  final String? filename;
  final String? downloadUrl;
  final String? contentHash;

  String? get downloadFilename => attachmentId == null ? null : filename;

  bool get hasOptionsMenu =>
      fallbackUrl.trim().isNotEmpty || actionScope != null;
}

String? _videoDownloadUrl(ChatFullscreenVideoLaunchContext context) {
  final Attachment? attachment = context.attachment;
  if (attachment != null) {
    return attachmentEffectiveDownloadUrl(
      url: attachment.url,
      isExpired: attachment.expired ?? false,
      proxyUrl: attachment.proxyUrl,
    );
  }
  if (context.isYouTubeEmbed) {
    return null;
  }
  return context.source.directMediaUrl;
}
