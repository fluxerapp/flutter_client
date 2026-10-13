import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/features/accessibility/presentation/allow_image_frame_animation.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/media_thumb_hash_placeholder.dart';
import 'package:fluxer_app/features/chat/utils/media/media_dimension_utils.dart';
import 'package:fluxer_app/features/chat/utils/media/media_proxy_url.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerAnimatedImage extends StatelessWidget {
  const FluxerAnimatedImage({
    required this.animatedUrl,
    required this.playing,
    this.loadAnimated,
    this.staticUrl,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorPlaceholder,
    this.fadeInDuration = Duration.zero,
    super.key,
  });

  final String animatedUrl;

  final String? staticUrl;

  final bool playing;

  final bool? loadAnimated;

  final BoxFit fit;

  final Widget? placeholder;

  final Widget? errorPlaceholder;

  final Duration fadeInDuration;

  bool get _loadAnimated => loadAnimated ?? playing;

  @override
  Widget build(BuildContext context) {
    final String? resolvedStaticUrl = staticUrl;
    final String? posterUrl =
        resolvedStaticUrl == null || resolvedStaticUrl.isEmpty
        ? null
        : resolvedStaticUrl;
    if (animatedUrl.isEmpty && posterUrl == null) {
      return errorPlaceholder ?? placeholder ?? const SizedBox.shrink();
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
        final ({int? width, int? height}) posterCache = _cellCacheSize(
          constraints: constraints,
          devicePixelRatio: devicePixelRatio,
        );
        final ({int? width, int? height}) animatedProxySize = _cellCacheSize(
          constraints: constraints,
          devicePixelRatio: animatedImagePixelRatio(devicePixelRatio),
        );
        final Widget fallback = placeholder ?? const SizedBox.shrink();
        final Widget errorChild = errorPlaceholder ?? fallback;
        final Widget? poster = posterUrl == null
            ? null
            : CachedNetworkImage(
                imageUrl: posterUrl,
                fit: fit,
                memCacheWidth: posterCache.width,
                memCacheHeight: posterCache.height,
                maxWidthDiskCache: posterCache.width,
                maxHeightDiskCache: posterCache.height,
                fadeInDuration: Duration.zero,
                fadeOutDuration: placeholder == null
                    ? Duration.zero
                    : mediaPlaceholderFadeOutOf(context),
                disablePlaceholderOnCacheHit: placeholder == null,
                placeholder: (_, _) => fallback,
                errorBuilder: (_, _, _) => errorChild,
              );
        final Widget loading = poster ?? fallback;
        return SizedBox(
          width: constraints.maxWidth.isFinite ? constraints.maxWidth : null,
          height: constraints.maxHeight.isFinite ? constraints.maxHeight : null,
          child: !_loadAnimated || animatedUrl.isEmpty
              ? loading
              : AllowImageFrameAnimation(
                  child: TickerMode(
                    key: const ValueKey<String>('fluxer-animated-image-ticker'),
                    enabled: playing,
                    child: CachedNetworkImage(
                      imageUrl: buildMediaProxyUrl(
                        animatedUrl,
                        width: animatedProxySize.width,
                        height: animatedProxySize.height,
                      ),
                      fit: fit,
                      fadeInDuration: fadeInDuration,
                      fadeOutDuration: Duration.zero,
                      disablePlaceholderOnCacheHit: false,
                      placeholder: (_, _) => loading,
                      errorBuilder: (_, _, _) => errorChild,
                    ),
                  ),
                ),
        );
      },
    );
  }

  ({int? width, int? height}) _cellCacheSize({
    required BoxConstraints constraints,
    required double devicePixelRatio,
  }) {
    if (fit == BoxFit.contain) {
      return containDecodeCacheSize(
        cellWidth: constraints.maxWidth,
        cellHeight: constraints.maxHeight,
        devicePixelRatio: devicePixelRatio,
      );
    }
    return coverDecodeCacheSize(
      cellWidth: constraints.maxWidth,
      cellHeight: constraints.maxHeight,
      devicePixelRatio: devicePixelRatio,
    );
  }
}
