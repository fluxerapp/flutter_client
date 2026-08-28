import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/material_ui.dart';

/// Renders an animated image through Flutter's native image pipeline,
/// showing [animatedUrl] while [playing] and [staticUrl] otherwise.
class FluxerAnimatedImage extends StatelessWidget {
  const FluxerAnimatedImage({
    required this.animatedUrl,
    required this.playing,
    this.staticUrl,
    this.fit = BoxFit.cover,
    this.placeholder,
    super.key,
  });

  final String animatedUrl;

  final String? staticUrl;

  final bool playing;

  final BoxFit fit;

  /// Shown while loading, on error, and when the resolved URL is empty.
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    final String url = playing ? animatedUrl : (staticUrl ?? '');
    if (url.isEmpty) {
      return placeholder ?? const SizedBox.shrink();
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
        // Skip resize while playing; ResizeImage freezes animated WebP.
        final ({int? width, int? height}) cacheSize;
        if (playing) {
          cacheSize = (width: null, height: null);
        } else if (fit == BoxFit.contain) {
          cacheSize = containDecodeCacheSize(
            cellWidth: constraints.maxWidth,
            cellHeight: constraints.maxHeight,
            devicePixelRatio: devicePixelRatio,
          );
        } else {
          cacheSize = coverDecodeCacheSize(
            cellWidth: constraints.maxWidth,
            cellHeight: constraints.maxHeight,
            devicePixelRatio: devicePixelRatio,
          );
        }
        final int? cacheWidth = cacheSize.width;
        final int? cacheHeight = cacheSize.height;
        final Widget fallback = placeholder ?? const SizedBox.shrink();
        return SizedBox(
          width: constraints.maxWidth.isFinite ? constraints.maxWidth : null,
          height: constraints.maxHeight.isFinite ? constraints.maxHeight : null,
          child: AnimatedSwitcher(
            duration: Duration.zero,
            layoutBuilder:
                (Widget? currentChild, List<Widget> previousChildren) {
                  return Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: <Widget>[...previousChildren, ?currentChild],
                  );
                },
            child: CachedNetworkImage(
              key: ValueKey<String>(url),
              imageUrl: url,
              fit: fit,
              memCacheWidth: cacheWidth,
              memCacheHeight: cacheHeight,
              maxWidthDiskCache: cacheWidth,
              maxHeightDiskCache: cacheHeight,
              fadeInDuration: Duration.zero,
              fadeOutDuration: Duration.zero,
              placeholder: (_, _) => fallback,
              errorBuilder: (_, _, _) => fallback,
            ),
          ),
        );
      },
    );
  }
}
