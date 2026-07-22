import 'package:flutter/material.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_media_grid.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_renderer.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';

class AttachmentListRenderer extends StatelessWidget {
  const AttachmentListRenderer({
    required this.attachments,
    required this.inlineAttachmentMedia,
    required this.dimensionSize,
    required this.revealSpoilers,
    this.topPadding = 0,
    this.messageId,
    this.messageNonce,
    this.channelId,
    this.messageFlags = 0,
    this.mediaActionScope,
    super.key,
  });

  final List<Attachment> attachments;
  final bool inlineAttachmentMedia;
  final MediaDimensionSize dimensionSize;
  final bool revealSpoilers;
  final double topPadding;
  final String? messageId;
  final String? messageNonce;
  final String? channelId;
  final int messageFlags;
  final MessageMediaActionScope? mediaActionScope;

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) {
      return const SizedBox.shrink();
    }
    final List<Attachment> mediaAttachments = attachments
        .where(
          (Attachment attachment) =>
              inlineAttachmentMedia &&
              attachment.isPreviewMedia &&
              attachment.url.isNotEmpty,
        )
        .toList();
    final bool shouldRenderMediaGrid = mediaAttachments.length > 1;
    bool hasRenderedGrid = false;
    final List<Widget> children = <Widget>[];
    for (final Attachment attachment in attachments) {
      final bool isMediaAttachment =
          inlineAttachmentMedia &&
          attachment.isPreviewMedia &&
          attachment.url.isNotEmpty;
      if (shouldRenderMediaGrid && isMediaAttachment) {
        if (!hasRenderedGrid) {
          children.add(
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: AttachmentMediaGrid(
                attachments: mediaAttachments,
                revealSpoilers: revealSpoilers,
                dimensionSize: dimensionSize,
                channelId: channelId,
                messageId: messageId,
                mediaActionScope: mediaActionScope,
              ),
            ),
          );
          hasRenderedGrid = true;
        }
        continue;
      }
      children.add(
        AttachmentRenderer(
          attachment: attachment,
          inlineAttachmentMedia: inlineAttachmentMedia,
          dimensionSize: dimensionSize,
          revealSpoilers: revealSpoilers,
          imageGallery: mediaAttachments,
          imageGalleryIndex: isMediaAttachment
              ? mediaAttachments.indexOf(attachment)
              : 0,
          messageId: messageId,
          messageNonce: messageNonce,
          channelId: channelId,
          messageFlags: messageFlags,
          mediaActionScope: mediaActionScope,
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
