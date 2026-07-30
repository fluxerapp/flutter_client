import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';

class MediaOptionsLaunchContext {
  const MediaOptionsLaunchContext({
    required this.fallbackUrl,
    this.actionScope,
    this.attachmentId,
    this.embedIndex,
    this.filename,
    this.proxyUrl,
    this.isExpired = false,
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
      proxyUrl: attachment?.proxyUrl,
      isExpired: attachment?.expired ?? false,
    );
  }

  factory MediaOptionsLaunchContext.fromImageViewerItem(
    AttachmentMediaViewerItem item, {
    MessageMediaActionScope? actionScope,
  }) {
    return MediaOptionsLaunchContext(
      fallbackUrl: item.url,
      actionScope: actionScope,
      attachmentId: item.attachmentId,
      embedIndex: item.embedIndex,
      filename: item.filename,
      proxyUrl: item.proxyUrl,
      isExpired: item.isExpired,
    );
  }

  final String fallbackUrl;
  final MessageMediaActionScope? actionScope;
  final String? attachmentId;
  final int? embedIndex;
  final String? filename;
  final String? proxyUrl;
  final bool isExpired;

  bool get hasOptionsMenu =>
      fallbackUrl.trim().isNotEmpty || actionScope != null;
}
