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
  late final ValueNotifier<bool> _visibleNotifier;
  bool _hideScheduled = false;

  @override
  void initState() {
    super.initState();
    _visibleNotifier = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _hideScheduled = false;
    _visibleNotifier.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) {
      return;
    }
    final bool visible = info.visibleFraction > 0;
    if (visible) {
      _hideScheduled = false;
      if (!_visibleNotifier.value) {
        _visibleNotifier.value = true;
      }
      return;
    }
    if (!_visibleNotifier.value || _hideScheduled) {
      return;
    }
    _hideScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _hideScheduled = false;
      if (_visibleNotifier.value) {
        _visibleNotifier.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animatedUrl.isEmpty) {
      return widget.placeholder ?? const SizedBox.shrink();
    }
    return VisibilityDetector(
      key: ValueKey<String>('embed-gif-${widget.visibilityKey}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: ListenableBuilder(
        listenable: _visibleNotifier,
        builder: (BuildContext context, Widget? _) {
          return FluxerAnimatedImage(
            animatedUrl: widget.animatedUrl,
            staticUrl: widget.staticUrl,
            playing: _visibleNotifier.value,
            fit: widget.fit,
            placeholder: widget.placeholder,
          );
        },
      ),
    );
  }
}
