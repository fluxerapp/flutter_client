import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_gallery_media.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_shared.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_inline_video_player.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/chat/utils/embed_gallery_utils.dart';
import 'package:fluxer_app/features/chat/utils/embed_media_viewer_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

/// A rich embed card
class EmbedRich extends StatelessWidget {
  final Embed embed;
  final EmbedGalleryIndex galleryIndex;
  final int embedIndex;
  final MediaDimensionSize dimensionSize;
  final bool revealSpoilers;
  final FluxerSpoilerSyncController? spoilerSyncController;
  final String? channelId;
  final String? messageId;
  final MessageMediaActionScope? videoActionScope;

  const EmbedRich({
    required this.embed,
    required this.galleryIndex,
    required this.embedIndex,
    this.dimensionSize = MediaDimensionSize.small,
    this.revealSpoilers = false,
    this.spoilerSyncController,
    this.channelId,
    this.messageId,
    this.videoActionScope,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sideColor = embed.color != null
        ? Color(0xFF000000 | (embed.color! & 0xFFFFFF))
        : context.colors.backgroundSecondaryAlt;

    final ChatVideoSource? videoSource = embed.video != null
        ? ChatVideoSource.fromEmbed(embed)
        : null;
    final bool hasVideo = videoSource != null && videoSource.hasPlayableContent;
    final ChatFullscreenVideoLaunchContext? videoLaunchContext = hasVideo
        ? ChatFullscreenVideoLaunchContext.fromEmbed(
            embed: embed,
            embedIndex: embedIndex,
            actionScope: videoActionScope,
          )
        : null;
    final bool hasImage = embed.image != null;
    final bool hasThumbnail =
        !hasVideo &&
        embed.thumbnail != null &&
        embed.type != EmbedType.image &&
        embed.type != EmbedType.gifv;
    final EmbedGalleryDisplay gallery = galleryIndex.resolveDisplay(
      embedIndex: embedIndex,
      hasAnyMedia: hasVideo || hasImage || hasThumbnail,
    );
    final bool shouldRenderInlineThumbnail =
        hasThumbnail && !gallery.showGallery;

    return Container(
      margin: const EdgeInsets.only(top: 4),
      constraints: const BoxConstraints(maxWidth: 440),
      decoration: BoxDecoration(
        color: context.colors.embedBackground,
        border: Border(left: BorderSide(color: sideColor, width: 4)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (embed.providerName != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: EmbedInlineText(
                        text: embed.providerName!,
                        style: context.textStyles.embedFooter.copyWith(
                          fontSize: 12,
                        ),
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
                      padding: const EdgeInsets.only(bottom: 6),
                      child: MessageMarkdown(
                        data: embed.description!,
                        baseStyle: context.textStyles.embedDescription,
                        markdownContext:
                            FluxerMarkdownContext.restrictedEmbedDescription,
                        revealSpoilers: revealSpoilers,
                        spoilerSyncController: spoilerSyncController,
                      ),
                    ),
                  if (embed.fields.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: _EmbedFields(
                        fields: embed.fields,
                        revealSpoilers: revealSpoilers,
                        spoilerSyncController: spoilerSyncController,
                      ),
                    ),
                  if (hasVideo)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: ChatInlineVideoPlayer(
                          source: videoLaunchContext!.source,
                          launchContext: videoLaunchContext,
                          dimensionSize: dimensionSize,
                          posterFit: BoxFit.contain,
                        ),
                      ),
                    )
                  else if (gallery.showGallery)
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
                  else if (embed.image != null && !shouldRenderInlineThumbnail)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: _EmbedMediaImage(
                        media: embed.image!,
                        dimensionSize: dimensionSize,
                        title: embed.title,
                        embedIndex: embedIndex,
                        channelId: channelId,
                        messageId: messageId,
                        actionScope: videoActionScope,
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
            if (shouldRenderInlineThumbnail) ...[
              const SizedBox(width: 12),
              FluxerGestureDetector(
                onTap: canOpenEmbedMediaViewer(embed.thumbnail!)
                    ? () => openEmbedMediaViewer(
                        context,
                        media: embed.thumbnail!,
                        title: embed.title,
                        embedIndex: embedIndex,
                        channelId: channelId,
                        messageId: messageId,
                        actionScope: videoActionScope,
                      )
                    : null,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(
                    imageUrl: embed.thumbnail!.proxyUrl ?? embed.thumbnail!.url,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    errorBuilder: (_, e, s) => const SizedBox.shrink(),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EmbedFields extends StatelessWidget {
  final List<EmbedField> fields;
  final bool revealSpoilers;
  final FluxerSpoilerSyncController? spoilerSyncController;

  const _EmbedFields({
    required this.fields,
    required this.revealSpoilers,
    this.spoilerSyncController,
  });

  @override
  Widget build(BuildContext context) {
    // inline fields: up to 3 per row; block fields always start a new row
    final rows = <List<EmbedField>>[];
    var current = <EmbedField>[];

    for (final f in fields) {
      if (!f.isInline) {
        if (current.isNotEmpty) {
          rows.add(current);
          current = [];
        }
        rows.add([f]);
      } else {
        current.add(f);
        if (current.length == 3) {
          rows.add(current);
          current = [];
        }
      }
    }
    if (current.isNotEmpty) {
      rows.add(current);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows.map((row) {
        if (row.length == 1 && !row[0].isInline) {
          return _EmbedFieldTile(
            field: row[0],
            revealSpoilers: revealSpoilers,
            spoilerSyncController: spoilerSyncController,
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: row
              .map(
                (f) => Expanded(
                  child: _EmbedFieldTile(
                    field: f,
                    revealSpoilers: revealSpoilers,
                    spoilerSyncController: spoilerSyncController,
                  ),
                ),
              )
              .toList(),
        );
      }).toList(),
    );
  }
}

class _EmbedFieldTile extends StatelessWidget {
  final EmbedField field;
  final bool revealSpoilers;
  final FluxerSpoilerSyncController? spoilerSyncController;

  const _EmbedFieldTile({
    required this.field,
    required this.revealSpoilers,
    this.spoilerSyncController,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 6, right: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EmbedInlineText(
          text: field.name,
          style: context.textStyles.smallText.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        MessageMarkdown(
          data: field.value,
          baseStyle: context.textStyles.embedDescription.copyWith(
            color: context.colors.textChat,
            fontSize: 13,
          ),
          markdownContext: FluxerMarkdownContext.restrictedEmbedDescription,
          revealSpoilers: revealSpoilers,
          spoilerSyncController: spoilerSyncController,
        ),
      ],
    ),
  );
}

class _EmbedMediaImage extends StatelessWidget {
  final EmbedMedia media;
  final MediaDimensionSize dimensionSize;
  final String? title;
  final int embedIndex;
  final String? channelId;
  final String? messageId;
  final MessageMediaActionScope? actionScope;

  const _EmbedMediaImage({
    required this.media,
    required this.dimensionSize,
    required this.embedIndex,
    this.title,
    this.channelId,
    this.messageId,
    this.actionScope,
  });

  @override
  Widget build(BuildContext context) {
    final dimensions = mediaDimensionsForSize(dimensionSize);
    final displaySize = constrainMediaSize(
      dimensions: dimensions,
      width: media.width,
      height: media.height,
    );
    final Widget image;
    if (displaySize != null) {
      image = ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          width: displaySize.width,
          height: displaySize.height,
          child: CachedNetworkImage(
            imageUrl: media.proxyUrl ?? media.url,
            width: displaySize.width,
            height: displaySize.height,
            fit: BoxFit.cover,
            errorBuilder: (_, e, s) => const SizedBox.shrink(),
          ),
        ),
      );
    } else {
      image = ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          width: dimensions.maxWidth,
          height: kEmbedMediaFallbackHeight,
          child: CachedNetworkImage(
            imageUrl: media.proxyUrl ?? media.url,
            fit: BoxFit.contain,
            errorBuilder: (_, e, s) => const SizedBox.shrink(),
          ),
        ),
      );
    }
    return FluxerGestureDetector(
      onTap: canOpenEmbedMediaViewer(media)
          ? () => openEmbedMediaViewer(
              context,
              media: media,
              title: title,
              embedIndex: embedIndex,
              channelId: channelId,
              messageId: messageId,
              actionScope: actionScope,
            )
          : null,
      child: image,
    );
  }
}
