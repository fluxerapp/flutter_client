import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_media_grid.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_renderer.dart';
import 'package:fluxer_app/features/chat/utils/spoiler_utils.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

class AttachmentListRenderer extends StatelessWidget {
  const AttachmentListRenderer({
    required this.attachments,
    required this.inlineAttachmentMedia,
    required this.dimensionSize,
    required this.revealSpoilers,
    this.spoilerSyncController,
    this.topPadding = 0,
    this.messageId,
    this.spoilerSyncScope,
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
  final FluxerSpoilerSyncController? spoilerSyncController;
  final double topPadding;
  final String? messageId;
  final String? spoilerSyncScope;
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
    final String syncScope = spoilerSyncScope ?? messageId ?? '';
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
                spoilerSyncController: spoilerSyncController,
                dimensionSize: dimensionSize,
                channelId: channelId,
                messageId: messageId,
                spoilerSyncScope: syncScope,
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
          spoilerSyncController: spoilerSyncController,
          spoilerSyncKeys: spoilerSyncKeysForAttachment(
            scope: syncScope,
            attachment: attachment,
          ),
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
