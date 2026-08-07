import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thumbhash/flutter_thumbhash.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/utils/embed_animated_image_url.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AttachmentImage extends StatelessWidget {
  static const double _defaultAspectRatio = 16 / 9;

  final Attachment attachment;
  final MediaDimensionSize dimensionSize;
  final bool revealSpoiler;
  final bool wrapWithSpoiler;
  final List<Attachment>? imageGallery;
  final int imageGalleryIndex;
  final String? channelId;
  final String? messageId;
  final MessageMediaActionScope? mediaActionScope;
  final bool showGifIndicator;

  const AttachmentImage({
    required this.attachment,
    this.dimensionSize = MediaDimensionSize.small,
    this.revealSpoiler = false,
    this.wrapWithSpoiler = true,
    this.imageGallery,
    this.imageGalleryIndex = 0,
    this.channelId,
    this.messageId,
    this.mediaActionScope,
    this.showGifIndicator = true,
    super.key,
  });

  double _resolveAspectRatio() {
    final int? width = attachment.width;
    final int? height = attachment.height;
    if (width != null && height != null && width > 0 && height > 0) {
      return width / height;
    }
    return _defaultAspectRatio;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerMediaDimensions dimensions = mediaDimensionsForSize(
      dimensionSize,
    );
    final List<Attachment> gallery = _buildGallery();
    final Size? displaySize = constrainMediaSize(
      dimensions: dimensions,
      width: attachment.width,
      height: attachment.height,
    );
    final bool animate = attachment.isAnimated;
    final String effectiveUrl = attachment.proxyUrl ?? attachment.url;
    final Widget image = Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4, bottom: 3),
          constraints: BoxConstraints(
            maxWidth: dimensions.maxWidth,
            maxHeight: dimensions.maxHeight,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Semantics(
              button: gallery.isNotEmpty,
              image: true,
              label: _semanticLabel(context),
              child: GestureDetector(
                onTap: gallery.isEmpty
                    ? null
                    : () => showAttachmentMediaViewer(
                        context,
                        items: gallery.map(_buildMediaViewerItem).toList(),
                        initialIndex: imageGalleryIndex.clamp(
                          0,
                          gallery.length - 1,
                        ),
                        channelId: channelId,
                        onForward: (channelId != null && messageId != null)
                            ? (int index) => showForwardMediaSheet(
                                context,
                                sourceChannelId: channelId!,
                                sourceMessageId: messageId!,
                                attachmentIds: <String>[gallery[index].id],
                              )
                            : null,
                        actionScope: mediaActionScope,
                      ),
                child: AspectRatio(
                  aspectRatio: _resolveAspectRatio(),
                  child: animate
                      ? EmbedAnimatedImage(
                          animatedUrl: animatedEmbedImageUrl(effectiveUrl),
                          staticUrl: staticEmbedImageUrl(effectiveUrl),
                          visibilityKey:
                              '${channelId}_${messageId}_${attachment.id}',
                          fit: BoxFit.contain,
                          placeholder: _buildImagePlaceholder(context),
                        )
                      : _AttachmentStaticImage(
                          imageUrl: attachment.url,
                          displaySize: displaySize,
                          dimensions: dimensions,
                          sourceWidth: attachment.width,
                          sourceHeight: attachment.height,
                          placeholder: _buildImagePlaceholder(context),
                        ),
                ),
              ),
            ),
          ),
        ),
        if (showGifIndicator && animate)
          Positioned(
            left: 8,
            bottom: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.72),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Text(
                  'GIF',
                  style: context.textStyles.smallText.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
    if (!wrapWithSpoiler) {
      return image;
    }
    return SpoilerOverlay(
      isSpoiler: attachment.isSpoiler,
      initiallyRevealed: revealSpoiler,
      child: image,
    );
  }

  String _semanticLabel(BuildContext context) {
    final String? description = attachment.description?.trim();
    if (description != null && description.isNotEmpty) {
      return description;
    }
    final String filename = attachment.filename.trim();
    if (filename.isNotEmpty) {
      return filename;
    }
    return FluxerLocalizations.of(context).messageAccessibilityImageSummary;
  }

  Widget _buildImagePlaceholder(BuildContext context) {
    final Widget child;
    if (attachment.placeholder != null) {
      child = Image(
        image: ThumbHash.fromBase64(attachment.placeholder!).toImage(),
        fit: BoxFit.contain,
      );
    } else {
      child = const Skeletonizer(
        child: SizedBox(height: double.maxFinite, width: double.maxFinite),
      );
    }
    return ColoredBox(
      color: context.colors.backgroundSecondaryAlt,
      child: child,
    );
  }

  List<Attachment> _buildGallery() {
    if (imageGallery != null && imageGallery!.isNotEmpty) {
      return imageGallery!;
    }
    if (attachment.url.isEmpty) {
      return const <Attachment>[];
    }
    return <Attachment>[attachment];
  }

  AttachmentMediaViewerItem _buildMediaViewerItem(Attachment value) {
    return AttachmentMediaViewerItem(
      url: value.url,
      filename: value.filename,
      width: value.width,
      height: value.height,
      isMatureMedia: value.isMatureMedia,
      attachmentId: value.id,
      proxyUrl: value.proxyUrl,
      isExpired: value.expired ?? false,
    );
  }
}

class _AttachmentStaticImage extends StatelessWidget {
  const _AttachmentStaticImage({
    required this.imageUrl,
    required this.displaySize,
    required this.dimensions,
    required this.sourceWidth,
    required this.sourceHeight,
    required this.placeholder,
  });

  final String imageUrl;
  final Size? displaySize;
  final FluxerMediaDimensions dimensions;
  final int? sourceWidth;
  final int? sourceHeight;
  final Widget placeholder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
        final int? memCacheWidth;
        final int? memCacheHeight;
        if (displaySize != null) {
          memCacheWidth = (displaySize!.width * devicePixelRatio).round();
          memCacheHeight = (displaySize!.height * devicePixelRatio).round();
        } else {
          final ({int? width, int? height}) cache = containDecodeCacheSize(
            cellWidth: constraints.maxWidth.isFinite
                ? constraints.maxWidth
                : dimensions.maxWidth,
            cellHeight: constraints.maxHeight.isFinite
                ? constraints.maxHeight
                : dimensions.maxHeight,
            devicePixelRatio: devicePixelRatio,
            sourceWidth: sourceWidth,
            sourceHeight: sourceHeight,
          );
          memCacheWidth = cache.width;
          memCacheHeight = cache.height;
        }
        return CachedNetworkImage(
          imageUrl: imageUrl,
          memCacheWidth: memCacheWidth,
          memCacheHeight: memCacheHeight,
          fit: BoxFit.contain,
          placeholder: (BuildContext _, String _) => placeholder,
        );
      },
    );
  }
}
