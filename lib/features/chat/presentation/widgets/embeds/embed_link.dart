import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_gallery_media.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_shared.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/chat/utils/embed_gallery_utils.dart';
import 'package:fluxer_app/features/chat/utils/embed_media_viewer_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

/// A link preview card.
class EmbedLink extends StatelessWidget {
  final Embed embed;
  final EmbedGalleryIndex galleryIndex;
  final int embedIndex;
  final MediaDimensionSize dimensionSize;
  final bool revealSpoilers;
  final FluxerSpoilerSyncController? spoilerSyncController;
  final String? channelId;
  final String? messageId;

  const EmbedLink({
    required this.embed,
    required this.galleryIndex,
    required this.embedIndex,
    this.dimensionSize = MediaDimensionSize.small,
    this.revealSpoilers = false,
    this.spoilerSyncController,
    this.channelId,
    this.messageId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sideColor = embed.color != null
        ? Color(0xFF000000 | (embed.color! & 0xFFFFFF))
        : context.colors.backgroundSecondaryAlt;

    final dimensions = mediaDimensionsForSize(dimensionSize);
    final EmbedGalleryDisplay gallery = galleryIndex.resolveDisplay(
      embedIndex: embedIndex,
      hasAnyMedia:
          embed.thumbnail != null || embed.image != null || embed.video != null,
    );

    return Container(
      margin: const EdgeInsets.only(top: 4),
      constraints: BoxConstraints(maxWidth: dimensions.maxWidth),
      decoration: BoxDecoration(
        color: context.colors.embedBackground,
        border: Border(left: BorderSide(color: sideColor, width: 4)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (embed.providerName != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: EmbedInlineText(
                  text: embed.providerName!,
                  style: context.textStyles.embedFooter.copyWith(fontSize: 12),
                ),
              ),
            if (embed.author != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: EmbedAuthorRow(author: embed.author!),
              ),
            if (embed.title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: EmbedTitle(title: embed.title!, url: embed.url),
              ),
            if (embed.description != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: MessageMarkdown(
                  data: embed.description!,
                  baseStyle: context.textStyles.embedDescription,
                  markdownContext:
                      FluxerMarkdownContext.restrictedEmbedDescription,
                  revealSpoilers: revealSpoilers,
                  spoilerSyncController: spoilerSyncController,
                ),
              ),
            if (gallery.showGallery)
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: EmbedGalleryMedia(
                  embed: embed,
                  galleryImages: gallery.galleryImages,
                  embedIndex: embedIndex,
                  dimensionSize: dimensionSize,
                  revealSpoilers: revealSpoilers,
                  channelId: channelId,
                  messageId: messageId,
                ),
              )
            else if (embed.thumbnail != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: GestureDetector(
                  onTap: canOpenEmbedMediaViewer(embed.thumbnail!)
                      ? () => openEmbedMediaViewer(
                          context,
                          media: embed.thumbnail!,
                          title: embed.title,
                          embedIndex: embedIndex,
                          channelId: channelId,
                          messageId: messageId,
                        )
                      : null,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    // Reserve the extent from metadata, capped by the layout
                    // dimensions (fixed fallback when absent), so the load
                    // never shifts the chat and portrait sources cannot
                    // reserve unbounded height.
                    child: _thumbnailBox(
                      thumbnail: embed.thumbnail!,
                      dimensions: dimensions,
                    ),
                  ),
                ),
              ),
            if (embed.footer != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: EmbedFooterRow(
                  footer: embed.footer!,
                  timestamp: embed.timestamp,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _thumbnailBox({
    required EmbedMedia thumbnail,
    required FluxerMediaDimensions dimensions,
  }) {
    final Size? displaySize = constrainMediaSize(
      dimensions: dimensions,
      width: thumbnail.width,
      height: thumbnail.height,
    );
    final Widget image = CachedNetworkImage(
      imageUrl: thumbnail.proxyUrl ?? thumbnail.url,
      fit: BoxFit.cover,
      errorBuilder: (_, e, s) => const SizedBox.shrink(),
    );
    if (displaySize != null) {
      return SizedBox(
        width: displaySize.width,
        height: displaySize.height,
        child: image,
      );
    }
    return SizedBox(
      width: double.infinity,
      height: kEmbedMediaFallbackHeight,
      child: image,
    );
  }
}
