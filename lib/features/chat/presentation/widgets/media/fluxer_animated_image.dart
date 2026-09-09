import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_proxy_url.dart';
import 'package:fluxer_app/material_ui.dart';

/// Renders an animated image through Flutter's native image pipeline.
///
/// Animated bytes load while [loadAnimated] is true (defaults to [playing])
/// and advance only while [playing] is true.
class FluxerAnimatedImage extends StatelessWidget {
  const FluxerAnimatedImage({
    required this.animatedUrl,
    required this.playing,
    this.loadAnimated,
    this.staticUrl,
    this.fit = BoxFit.cover,
    this.placeholder,
    super.key,
  });

  final String animatedUrl;

  final String? staticUrl;

  final bool playing;

  /// Defaults to [playing]. False unloads the animated decoder.
  final bool? loadAnimated;

  final BoxFit fit;

  /// Shown while loading, on error, and when the resolved URL is empty.
  final Widget? placeholder;

  bool get _loadAnimated => loadAnimated ?? playing;

  @override
  Widget build(BuildContext context) {
    final String? resolvedStaticUrl = staticUrl;
    final String? posterUrl =
        resolvedStaticUrl == null || resolvedStaticUrl.isEmpty
        ? null
        : resolvedStaticUrl;
    if (animatedUrl.isEmpty && posterUrl == null) {
      return placeholder ?? const SizedBox.shrink();
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
                fadeOutDuration: Duration.zero,
                placeholder: (_, _) => fallback,
                errorBuilder: (_, _, _) => fallback,
              );
        final Widget loading = poster ?? fallback;
        if (!_loadAnimated || animatedUrl.isEmpty) {
          return SizedBox(
            width: constraints.maxWidth.isFinite ? constraints.maxWidth : null,
            height: constraints.maxHeight.isFinite
                ? constraints.maxHeight
                : null,
            child: loading,
          );
        }
        final String sizedAnimatedUrl = buildMediaProxyUrl(
          animatedUrl,
          width: animatedProxySize.width,
          height: animatedProxySize.height,
        );
        return SizedBox(
          width: constraints.maxWidth.isFinite ? constraints.maxWidth : null,
          height: constraints.maxHeight.isFinite ? constraints.maxHeight : null,
          child: TickerMode(
            key: const ValueKey<String>('fluxer-animated-image-ticker'),
            enabled: playing,
            child: CachedNetworkImage(
              imageUrl: sizedAnimatedUrl,
              fit: fit,
              fadeInDuration: Duration.zero,
              fadeOutDuration: Duration.zero,
              placeholder: (_, _) => loading,
              errorBuilder: (_, _, _) => loading,
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
