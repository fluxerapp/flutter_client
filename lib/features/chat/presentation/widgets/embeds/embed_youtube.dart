import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_thumbhash/flutter_thumbhash.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_inline_video_player.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_mobile_fullscreen_video.dart';
import 'package:fluxer_app/features/chat/utils/chat_video_playback_utils.dart';
import 'package:fluxer_app/features/chat/utils/embed_youtube_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EmbedYouTube extends StatelessWidget {
  const EmbedYouTube({
    required this.embed,
    required this.launchContext,
    this.dimensionSize = MediaDimensionSize.small,
    super.key,
  });

  final Embed embed;
  final ChatFullscreenVideoLaunchContext launchContext;
  final MediaDimensionSize dimensionSize;

  Future<void> _openFullscreen(BuildContext context) async {
    await showChatMobileFullscreenVideo(context, launchContext: launchContext);
  }

  @override
  Widget build(BuildContext context) {
    if (!canRenderYouTubeEmbed(embed)) {
      return const SizedBox.shrink();
    }

    final EmbedMedia video = embed.video!;
    final EmbedMedia thumbnail = embed.thumbnail!;
    final FluxerMediaDimensions dimensions = mediaDimensionsForSize(
      dimensionSize,
    );
    final Size? displaySize = constrainMediaSize(
      dimensions: dimensions,
      width: video.width,
      height: video.height,
    );
    final double aspectRatio = resolveChatVideoAspectRatio(
      width: video.width,
      height: video.height,
    );
    final double width = displaySize?.width ?? dimensions.maxWidth;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: dimensions.maxWidth),
      child: SizedBox(
        width: width,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: _YouTubeThumbnail(
              thumbnail: thumbnail,
              onPlay: () => unawaited(_openFullscreen(context)),
              onOpenInBrowser: embed.url == null
                  ? null
                  : () => handleExternalLinkTap(context, embed.url!),
            ),
          ),
        ),
      ),
    );
  }
}

class _YouTubeThumbnail extends StatelessWidget {
  const _YouTubeThumbnail({
    required this.thumbnail,
    required this.onPlay,
    this.onOpenInBrowser,
  });

  final EmbedMedia thumbnail;
  final VoidCallback onPlay;
  final VoidCallback? onOpenInBrowser;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String posterUrl = thumbnail.proxyUrl!;
    final String? placeholder = thumbnail.placeholder;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        if (placeholder != null && placeholder.isNotEmpty)
          Image(
            image: ThumbHash.fromBase64(placeholder).toImage(),
            fit: BoxFit.cover,
          )
        else
          const ColoredBox(color: Colors.black),
        Positioned.fill(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double dpr = MediaQuery.devicePixelRatioOf(context);
              final ({int? width, int? height}) cache = coverDecodeCacheSize(
                cellWidth: constraints.maxWidth,
                cellHeight: constraints.maxHeight,
                devicePixelRatio: dpr,
                sourceWidth: thumbnail.width,
                sourceHeight: thumbnail.height,
              );
              return CachedNetworkImage(
                imageUrl: posterUrl,
                fit: BoxFit.cover,
                memCacheWidth: cache.width,
                memCacheHeight: cache.height,
                fadeInDuration: Duration.zero,
                fadeOutDuration: Duration.zero,
                placeholder: (_, _) => const SizedBox.shrink(),
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              );
            },
          ),
        ),
        ColoredBox(color: Colors.black.withValues(alpha: 0.18)),
        Positioned.fill(
          child: FluxerGestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onPlay,
            child: const SizedBox.expand(),
          ),
        ),
        const Center(child: IgnorePointer(child: VideoPlayButtonOverlay())),
        if (onOpenInBrowser != null)
          Positioned(
            right: 12,
            bottom: 12,
            child: _YouTubeOverlayButton(
              onPressed: onOpenInBrowser,
              icon: PhosphorIconsBold.arrowSquareOut,
              label: l10n.mediaViewerOpenInBrowser,
            ),
          ),
      ],
    );
  }
}

class _YouTubeOverlayButton extends StatelessWidget {
  const _YouTubeOverlayButton({
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: Material(
        color: Colors.black.withValues(alpha: 0.6),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: PhosphorIcon(icon, color: Colors.white, size: 20),
            ),
          ),
        ),
      ),
    );
  }
}
