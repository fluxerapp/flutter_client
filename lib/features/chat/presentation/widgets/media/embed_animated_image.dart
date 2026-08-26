import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/accessibility/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/accessibility/motion_preferences.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/animated_image_playback_controller.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' show StickerAnimationOptions;
import 'package:visibility_detector/visibility_detector.dart';

/// Plays [animatedUrl] while visible and [staticUrl] otherwise. Respects the
/// nearest [AnimatedImagePlaybackScope] for visibility coordination.
class EmbedAnimatedImage extends ConsumerStatefulWidget {
  const EmbedAnimatedImage({
    required this.animatedUrl,
    required this.staticUrl,
    required this.visibilityKey,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.useStickerAnimationPreference = false,
    super.key,
  });

  final String animatedUrl;

  final String staticUrl;

  final String visibilityKey;

  final BoxFit fit;

  final Widget? placeholder;

  /// When true, uses [MotionPreferencesModel.effectiveAnimateStickers] instead
  /// of GIF autoplay.
  final bool useStickerAnimationPreference;

  @override
  ConsumerState<EmbedAnimatedImage> createState() => _EmbedAnimatedImageState();
}

class _EmbedAnimatedImageState extends ConsumerState<EmbedAnimatedImage> {
  AnimatedImagePlaybackController? _controller;
  late final ValueNotifier<bool> _playingNotifier;
  bool _localVisible = false;
  bool _hideScheduled = false;
  bool _interacting = false;
  bool? _motionAllowed;

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
    _controller?.removeListener(_onControllerChanged);
    _controller?.unregister(widget.visibilityKey);
    _playingNotifier.dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    if (!mounted) {
      return;
    }
    _syncPlaying();
  }

  void _setInteracting(bool value) {
    if (_interacting == value) {
      return;
    }
    _interacting = value;
    _syncPlaying();
  }

  bool _resolveMotionAllowed(MotionPreferencesModel motion) {
    if (!widget.useStickerAnimationPreference) {
      return motion.effectiveGifAutoPlay;
    }
    return resolveStickerPlaybackActive(
      mode: motion.effectiveAnimateStickers,
      interacting: _interacting,
    );
  }

  void _syncPlaying({bool? motionAllowed}) {
    if (!mounted) {
      return;
    }
    final bool allowed = motionAllowed ?? _motionAllowed ?? true;
    final bool playing =
        allowed &&
        (_controller?.isPlaying(widget.visibilityKey) ?? _localVisible);
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
    _controller?.updateVisibility(
      widget.visibilityKey,
      info.visibleFraction,
      top: info.visibleBounds.top,
      left: info.visibleBounds.left,
    );
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
    final MotionPreferencesModel motion = effectiveMotionOf(ref, context);
    final bool allowed = _resolveMotionAllowed(motion);
    if (_motionAllowed != allowed) {
      _motionAllowed = allowed;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _syncPlaying(motionAllowed: allowed);
        }
      });
    }

    if (widget.animatedUrl.isEmpty) {
      return widget.placeholder ?? const SizedBox.shrink();
    }
    Widget content = VisibilityDetector(
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
    if (widget.useStickerAnimationPreference &&
        motion.effectiveAnimateStickers ==
            StickerAnimationOptions.animateOnInteraction) {
      content = MouseRegion(
        onEnter: (_) => _setInteracting(true),
        onExit: (_) => _setInteracting(false),
        child: Listener(
          onPointerDown: (_) => _setInteracting(true),
          onPointerUp: (_) => _setInteracting(false),
          onPointerCancel: (_) => _setInteracting(false),
          child: content,
        ),
      );
    }
    return content;
  }
}
