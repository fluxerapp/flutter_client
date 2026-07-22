import 'package:flutter/material.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/animated_image_playback_controller.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Plays [animatedUrl] while visible and [staticUrl] otherwise. Respects the
/// nearest [AnimatedImagePlaybackScope] for scrolling pause and cap.
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
  AnimatedImagePlaybackController? _controller;
  late final ValueNotifier<bool> _playingNotifier;
  bool _localVisible = false;
  bool _hideScheduled = false;

  @override
  void initState() {
    super.initState();
    _playingNotifier = ValueNotifier<bool>(false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final AnimatedImagePlaybackController? controller =
        AnimatedImagePlaybackScope.of(context);
    if (controller == _controller) {
      return;
    }
    _controller?.unregister(widget.visibilityKey);
    _controller?.removeListener(_onControllerChanged);
    _controller = controller;
    _controller?.register(widget.visibilityKey, _localVisible ? 1 : 0);
    _controller?.addListener(_onControllerChanged);
    _syncPlaying();
  }

  @override
  void dispose() {
    _controller?.unregister(widget.visibilityKey);
    _controller?.removeListener(_onControllerChanged);
    _playingNotifier.dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    _syncPlaying();
  }

  void _syncPlaying() {
    final bool playing =
        _controller?.isPlaying(widget.visibilityKey) ?? _localVisible;
    if (_playingNotifier.value == playing) {
      return;
    }
    _playingNotifier.value = playing;
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    final bool visible = info.visibleFraction > 0;
    if (_localVisible == visible) {
      return;
    }
    _localVisible = visible;
    _controller?.updateVisibility(widget.visibilityKey, info.visibleFraction);
    if (visible) {
      _hideScheduled = false;
      _syncPlaying();
      return;
    }
    if (_hideScheduled) {
      return;
    }
    _hideScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _hideScheduled = false;
      _syncPlaying();
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
        listenable: _playingNotifier,
        builder: (BuildContext context, Widget? _) {
          return FluxerAnimatedImage(
            animatedUrl: widget.animatedUrl,
            staticUrl: widget.staticUrl,
            playing: _playingNotifier.value,
            fit: widget.fit,
            placeholder: widget.placeholder,
          );
        },
      ),
    );
  }
}
