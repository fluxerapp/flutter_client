import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/media_load_error_placeholder.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/utils/embeds/embed_animated_image_url.dart';
import 'package:fluxer_app/features/chat/utils/embeds/embed_media_viewer_utils.dart';
import 'package:fluxer_app/features/chat/utils/media/hdr_aware_image_url.dart';
import 'package:fluxer_app/features/chat/utils/media/media_dimension_utils.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_media_overlay.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

/// An inline image / gifv embed
class EmbedImage extends ConsumerWidget {
  final Embed embed;
  final MediaDimensionSize dimensionSize;
  final bool isSpoiler;
  final bool revealSpoiler;
  final FluxerSpoilerSyncController? spoilerSyncController;
  final List<String> spoilerSyncKeys;
  final String? channelId;
  final String? messageId;
  final int? embedIndex;
  final MessageMediaActionScope? mediaActionScope;

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
    this.mediaActionScope,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EmbedMedia? media = embed.image ?? embed.thumbnail;
    if (media == null) {
      return const SizedBox.shrink();
    }
    final HdrDisplayMode hdrDisplayMode = ref.watch(
      appearancePreferencesProvider.select(
        (AppearancePreferencesState state) => state.hdrDisplayMode,
      ),
    );
    final FluxerMediaDimensions dimensions = mediaDimensionsForSize(
      dimensionSize,
    );
    final Size? displaySize = constrainMediaSize(
      dimensions: dimensions,
      width: media.width,
      height: media.height,
    );
    final bool animate = embed.type == EmbedType.gifv || media.isAnimated;
    final double cellWidth = displaySize?.width ?? dimensions.maxWidth;
    final double cellHeight = displaySize?.height ?? kEmbedMediaFallbackHeight;
    final Widget placeholder = ColoredBox(
      color: context.colors.backgroundSecondaryAlt,
      child: SizedBox(width: cellWidth, height: cellHeight),
    );
    const Widget errorPlaceholder = MediaLoadErrorPlaceholder();
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
            child: FluxerGestureDetector(
              onTap: canOpenEmbedMediaViewer(media)
                  ? () => openEmbedMediaViewer(
                      context,
                      media: media,
                      title: embed.title,
                      animated: animate,
                      embedIndex: embedIndex,
                      channelId: channelId,
                      messageId: messageId,
                      actionScope: mediaActionScope,
                    )
                  : null,
              child: animate
                  ? SizedBox(
                      width: cellWidth,
                      height: cellHeight,
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
                        fit: BoxFit.contain,
                        placeholder: placeholder,
                        errorPlaceholder: errorPlaceholder,
                      ),
                    )
                  : _EmbedStaticImage(
                      imageUrl: buildHdrAwareImageUrl(
                        url: embedMediaEffectiveUrl(media),
                        mode: hdrDisplayMode,
                        contentType: media.contentType,
                      ),
                      cellWidth: cellWidth,
                      cellHeight: cellHeight,
                      sourceWidth: media.width,
                      sourceHeight: media.height,
                      placeholder: placeholder,
                      errorPlaceholder: errorPlaceholder,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmbedStaticImage extends StatelessWidget {
  const _EmbedStaticImage({
    required this.imageUrl,
    required this.cellWidth,
    required this.cellHeight,
    required this.sourceWidth,
    required this.sourceHeight,
    required this.placeholder,
    required this.errorPlaceholder,
  });

  final String imageUrl;
  final double cellWidth;
  final double cellHeight;
  final int? sourceWidth;
  final int? sourceHeight;
  final Widget placeholder;
  final Widget errorPlaceholder;

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final ({int? width, int? height}) cache = containDecodeCacheSize(
      cellWidth: cellWidth,
      cellHeight: cellHeight,
      devicePixelRatio: devicePixelRatio,
      sourceWidth: sourceWidth,
      sourceHeight: sourceHeight,
    );
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: cellWidth,
      height: cellHeight,
      memCacheWidth: cache.width,
      memCacheHeight: cache.height,
      fit: BoxFit.contain,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      placeholder: (_, _) => placeholder,
      errorBuilder: (_, Object _, StackTrace? _) => errorPlaceholder,
    );
  }
}
