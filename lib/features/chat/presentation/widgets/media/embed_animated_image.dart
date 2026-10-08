import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/accessibility/domain/motion_preferences.dart';
import 'package:fluxer_app/features/accessibility/providers/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/animated_image_playback_controller.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' show StickerAnimationOptions;
import 'package:visibility_detector/visibility_detector.dart';

/// Plays [animatedUrl] while visible. On screen, the animated image stays
/// loaded and pauses instead of swapping to [staticUrl]. Respects the
/// nearest [AnimatedImagePlaybackScope] for visibility coordination.
class EmbedAnimatedImage extends ConsumerStatefulWidget {
  const EmbedAnimatedImage({
    required this.animatedUrl,
    required this.staticUrl,
    required this.visibilityKey,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorPlaceholder,
    this.useStickerAnimationPreference = false,
    super.key,
  });

  final String animatedUrl;

  final String staticUrl;

  final String visibilityKey;

  final BoxFit fit;

  final Widget? placeholder;

  final Widget? errorPlaceholder;

  /// When true, uses [MotionPreferencesModel.effectiveAnimateStickers] instead
  /// of GIF autoplay.
  final bool useStickerAnimationPreference;

  @override
  ConsumerState<EmbedAnimatedImage> createState() => _EmbedAnimatedImageState();
}

class _EmbedAnimatedImageState extends ConsumerState<EmbedAnimatedImage> {
  AnimatedImagePlaybackController? _controller;
  late final ValueNotifier<({bool playing, bool loadAnimated})> _playback;
  bool _localVisible = false;
  bool _hideScheduled = false;
  bool _interacting = false;
  bool _gifAutoPlay = true;
  StickerAnimationOptions _stickerMode = StickerAnimationOptions.alwaysAnimate;

  @override
  void initState() {
    super.initState();
    _playback = ValueNotifier<({bool playing, bool loadAnimated})>((
      playing: false,
      loadAnimated: false,
    ));
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
    _hideScheduled = false;
    _controller?.removeListener(_onControllerChanged);
    _controller?.unregister(widget.visibilityKey);
    _playback.dispose();
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

  bool get _playbackAllowed {
    if (!widget.useStickerAnimationPreference) {
      return _gifAutoPlay;
    }
    return resolveStickerPlaybackActive(
      mode: _stickerMode,
      interacting: _interacting,
    );
  }

  bool get _loadAllowed {
    if (!widget.useStickerAnimationPreference) {
      return _gifAutoPlay;
    }
    return _stickerMode != StickerAnimationOptions.neverAnimate;
  }

  void _applyMotion(MotionPreferencesModel motion) {
    if (_gifAutoPlay == motion.effectiveGifAutoPlay &&
        _stickerMode == motion.effectiveAnimateStickers) {
      return;
    }
    _gifAutoPlay = motion.effectiveGifAutoPlay;
    _stickerMode = motion.effectiveAnimateStickers;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _syncPlaying();
      }
    });
  }

  void _syncPlaying() {
    if (!mounted) {
      return;
    }
    final bool playbackActive =
        _controller?.isPlaying(widget.visibilityKey) ?? _localVisible;
    final ({bool playing, bool loadAnimated}) next = (
      playing: _playbackAllowed && playbackActive,
      loadAnimated: _loadAllowed && _localVisible,
    );
    if (_playback.value == next) {
      return;
    }
    _playback.value = next;
  }

  void _applyVisibility(VisibilityInfo info, {required bool visible}) {
    _localVisible = visible;
    _controller?.updateVisibility(widget.visibilityKey, info.visibleFraction);
    _syncPlaying();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) {
      return;
    }
    final bool visible = info.visibleFraction > 0;
    if (visible) {
      _hideScheduled = false;
      _applyVisibility(info, visible: true);
      return;
    }
    if (!_localVisible || _hideScheduled) {
      return;
    }
    _hideScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_hideScheduled) {
        return;
      }
      _hideScheduled = false;
      if (_localVisible) {
        _applyVisibility(info, visible: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final MotionPreferencesModel motion = effectiveMotionOf(ref, context);
    _applyMotion(motion);

    if (widget.animatedUrl.isEmpty) {
      return widget.errorPlaceholder ??
          widget.placeholder ??
          const SizedBox.shrink();
    }
    Widget content = VisibilityDetector(
      key: ObjectKey(this),
      onVisibilityChanged: _onVisibilityChanged,
      child: ListenableBuilder(
        listenable: _playback,
        builder: (BuildContext context, Widget? _) {
          final ({bool playing, bool loadAnimated}) playback = _playback.value;
          return FluxerAnimatedImage(
            animatedUrl: widget.animatedUrl,
            staticUrl: widget.staticUrl,
            playing: playback.playing,
            loadAnimated: playback.loadAnimated,
            fit: widget.fit,
            placeholder: widget.placeholder,
            errorPlaceholder: widget.errorPlaceholder,
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
