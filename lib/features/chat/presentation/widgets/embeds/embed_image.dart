import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/utils/embed_animated_image_url.dart';
import 'package:fluxer_app/features/chat/utils/embed_media_viewer_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_media_overlay.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

/// An inline image / gifv embed
class EmbedImage extends StatelessWidget {
  final Embed embed;
  final MediaDimensionSize dimensionSize;
  final bool isSpoiler;
  final bool revealSpoiler;
  final FluxerSpoilerSyncController? spoilerSyncController;
  final List<String> spoilerSyncKeys;
  final String? channelId;
  final String? messageId;
  final int? embedIndex;

  const EmbedImage({
    required this.embed,
    this.dimensionSize = MediaDimensionSize.small,
    this.isSpoiler = false,
    this.revealSpoiler = false,
    this.spoilerSyncController,
    this.spoilerSyncKeys = const [],
    this.channelId,
    this.messageId,
    this.embedIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final media = embed.image ?? embed.thumbnail;
    if (media == null) {
      return const SizedBox.shrink();
    }

    final dimensions = mediaDimensionsForSize(dimensionSize);
    final displaySize = constrainMediaSize(
      dimensions: dimensions,
      width: media.width,
      height: media.height,
    );
    final bool animate = embed.type == EmbedType.gifv || media.isAnimated;

    return Container(
      margin: const EdgeInsets.only(top: 4),
      constraints: BoxConstraints(
        maxWidth: dimensions.maxWidth,
        maxHeight: dimensions.maxHeight,
      ),
      child: SpoilerOverlay(
        isSpoiler: isSpoiler,
        initiallyRevealed: revealSpoiler,
        borderRadius: BorderRadius.circular(4),
        spoilerSyncController: spoilerSyncController,
        syncKeys: spoilerSyncKeys,
        child: MatureMediaOverlay(
          channelId: channelId,
          isMatureMedia: embed.isMatureMedia,
          borderRadius: BorderRadius.circular(4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: GestureDetector(
              onTap: canOpenEmbedMediaViewer(media)
                  ? () => showAttachmentMediaViewer(
                      context,
                      items: [
                        buildEmbedMediaViewerItem(
                          media: media,
                          title: embed.title,
                          animated: animate,
                        ),
                      ],
                      onForward:
                          (channelId != null &&
                              messageId != null &&
                              embedIndex != null)
                          ? (int _) => showForwardMediaSheet(
                              context,
                              sourceChannelId: channelId!,
                              sourceMessageId: messageId!,
                              embedIndices: <int>[embedIndex!],
                            )
                          : null,
                    )
                  : null,
              child: animate
                  ? SizedBox(
                      width: displaySize?.width,
                      height: displaySize?.height,
                      child: EmbedAnimatedImage(
                        animatedUrl: animatedEmbedImageUrl(
                          embedMediaEffectiveUrl(media),
                        ),
                        staticUrl: staticEmbedImageUrl(
                          embedMediaEffectiveUrl(media),
                        ),
                        visibilityKey:
                            '${channelId}_${messageId}_'
                            '${embedIndex}_${embed.type.name}',
                        placeholder: Container(
                          width: displaySize?.width ?? dimensions.maxWidth,
                          height: displaySize?.height ?? 200,
                          color: context.colors.backgroundSecondaryAlt,
                        ),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: embedMediaEffectiveUrl(media),
                      width: displaySize?.width,
                      height: displaySize?.height,
                      fit: BoxFit.cover,
                      errorBuilder: (_, e, s) => Container(
                        width: displaySize?.width ?? dimensions.maxWidth,
                        height: displaySize?.height ?? 200,
                        color: context.colors.backgroundSecondaryAlt,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
