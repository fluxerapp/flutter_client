import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_network_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/media_alt_text.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/media_load_error_placeholder.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/media_thumb_hash_placeholder.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_double_tap_exemption.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/embeds/embed_animated_image_url.dart';
import 'package:fluxer_app/features/chat/utils/media/hdr_aware_image_url.dart';
import 'package:fluxer_app/features/chat/utils/media/media_dimension_utils.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AttachmentImage extends ConsumerWidget {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HdrDisplayMode hdrDisplayMode = ref.watch(
      appearancePreferencesProvider.select(
        (AppearancePreferencesState state) => state.hdrDisplayMode,
      ),
    );
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          _buildImage(
            context,
            hdrDisplayMode: hdrDisplayMode,
            dimensions: mediaDimensionsWithinWidth(
              mediaDimensionsForSize(dimensionSize),
              constraints.maxWidth,
            ),
          ),
    );
  }

  Widget _buildImage(
    BuildContext context, {
    required HdrDisplayMode hdrDisplayMode,
    required FluxerMediaDimensions dimensions,
  }) {
    final Size? displaySize = constrainMediaSize(
      dimensions: dimensions,
      width: attachment.width,
      height: attachment.height,
    );
    if (displaySize == null) {
      return const SizedBox.shrink();
    }
    final List<Attachment> gallery = _buildGallery();
    final bool animate = attachment.isAnimated;
    final String effectiveUrl = attachmentEffectiveUrl(attachment);
    final Widget image = Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 3),
      child: MediaAltText(
        altText: attachment.description,
        captionWidth: displaySize.width,
        child: SizedBox(
          width: displaySize.width,
          height: displaySize.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Semantics(
                  button: gallery.isNotEmpty,
                  image: true,
                  label: _semanticLabel(context),
                  child: MessageDoubleTapExempt(
                    child: FluxerGestureDetector(
                      onTap: gallery.isEmpty
                          ? null
                          : () => showAttachmentMediaViewer(
                              context,
                              items: gallery
                                  .map(AttachmentMediaViewerItem.fromAttachment)
                                  .toList(),
                              initialIndex: imageGalleryIndex.clamp(
                                0,
                                gallery.length - 1,
                              ),
                              channelId: channelId,
                              onForward:
                                  (channelId != null && messageId != null)
                                  ? (int index) => showForwardMediaSheet(
                                      context,
                                      sourceChannelId: channelId!,
                                      sourceMessageId: messageId!,
                                      attachmentIds: <String>[
                                        gallery[index].id,
                                      ],
                                    )
                                  : null,
                              actionScope: mediaActionScope,
                            ),
                      child: SizedBox.expand(
                        child: animate
                            ? EmbedAnimatedImage(
                                animatedUrl: animatedEmbedImageUrl(
                                  effectiveUrl,
                                ),
                                staticUrl: staticEmbedImageUrl(effectiveUrl),
                                placeholder: _buildImagePlaceholder(context),
                                errorPlaceholder:
                                    const MediaLoadErrorPlaceholder(),
                              )
                            : _AttachmentStaticImage(
                                imageUrl: buildHdrAwareImageUrl(
                                  url: effectiveUrl,
                                  mode: hdrDisplayMode,
                                  contentType: attachment.contentType,
                                ),
                                filename: attachment.filename,
                                contentType: attachment.contentType,
                                displaySize: displaySize,
                                placeholder: _buildImagePlaceholder(context),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
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
            ),
          ),
        ),
      ),
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
    final String? description = resolvedMediaAltText(attachment.description);
    if (description != null) {
      return description;
    }
    final String filename = attachment.filename.trim();
    if (filename.isNotEmpty) {
      return filename;
    }
    return FluxerLocalizations.of(context).messageAccessibilityImageSummary;
  }

  Widget _buildImagePlaceholder(BuildContext context) {
    return ColoredBox(
      color: context.colors.backgroundSecondaryAlt,
      child: MediaThumbHashPlaceholder(
        thumbHash: attachment.placeholder,
        fallback: const Skeletonizer(child: SizedBox.expand()),
      ),
    );
  }

  List<Attachment> _buildGallery() {
    if (imageGallery != null && imageGallery!.isNotEmpty) {
      return imageGallery!;
    }
    if (!attachmentHasLoadableUrl(attachment)) {
      return const <Attachment>[];
    }
    return <Attachment>[attachment];
  }
}

class _AttachmentStaticImage extends StatelessWidget {
  const _AttachmentStaticImage({
    required this.imageUrl,
    required this.filename,
    required this.contentType,
    required this.displaySize,
    required this.placeholder,
  });

  final String imageUrl;
  final String filename;
  final String? contentType;
  final Size displaySize;
  final Widget placeholder;

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    return ChatNetworkImage(
      imageUrl: imageUrl,
      filename: filename,
      contentType: contentType,
      width: displaySize.width,
      height: displaySize.height,
      memCacheWidth: (displaySize.width * devicePixelRatio).round(),
      memCacheHeight: (displaySize.height * devicePixelRatio).round(),
      fit: BoxFit.cover,
      placeholder: placeholder,
      errorPlaceholder: const MediaLoadErrorPlaceholder(),
    );
  }
}
