import 'package:flutter/material.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Plays [animatedUrl] only while visible on screen and shows [staticUrl]
/// otherwise. Callers build the URLs via `animatedEmbedImageUrl` /
/// `staticEmbedImageUrl`.
class EmbedAnimatedImage extends StatefulWidget {
  const EmbedAnimatedImage({
    required this.animatedUrl,
    required this.staticUrl,
    required this.visibilityKey,
    this.fit = BoxFit.cover,
    this.placeholder,
    super.key,
  });

  final String animatedUrl;

  final String staticUrl;

  final String visibilityKey;

  final BoxFit fit;

  final Widget? placeholder;

  @override
  State<EmbedAnimatedImage> createState() => _EmbedAnimatedImageState();
}

class _EmbedAnimatedImageState extends State<EmbedAnimatedImage> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    if (widget.animatedUrl.isEmpty) {
      return widget.placeholder ?? const SizedBox.shrink();
    }
    return VisibilityDetector(
      key: ValueKey('embed-gif-${widget.visibilityKey}'),
      onVisibilityChanged: (info) {
        final visible = info.visibleFraction > 0;
        if (visible != _visible && mounted) {
          setState(() => _visible = visible);
        }
      },
      child: FluxerAnimatedImage(
        animatedUrl: widget.animatedUrl,
        staticUrl: widget.staticUrl,
        playing: _visible,
        fit: widget.fit,
        placeholder: widget.placeholder,
      ),
    );
  }
}
