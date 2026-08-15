import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/accessibility/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CachedEmojiImage extends ConsumerStatefulWidget {
  const CachedEmojiImage({
    required this.emojiId,
    required this.animated,
    required this.requestSize,
    required this.size,
    this.errorBuilder,
    this.pauseWhenOffscreen = true,
    this.isInView,
    super.key,
  });

  final String emojiId;
  final bool animated;
  final int requestSize;
  final double size;
  final WidgetBuilder? errorBuilder;
  final bool pauseWhenOffscreen;
  final bool? isInView;

  @override
  ConsumerState<CachedEmojiImage> createState() => _CachedEmojiImageState();
}

class _CachedEmojiImageState extends ConsumerState<CachedEmojiImage> {
  late final ValueNotifier<bool> _visibleNotifier;
  bool _hideScheduled = false;

  @override
  void initState() {
    super.initState();
    _visibleNotifier = ValueNotifier<bool>(!widget.pauseWhenOffscreen);
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

  bool get _usesPickerVisibility => widget.animated && widget.isInView != null;

  Widget _buildImage(
    BuildContext context, {
    required bool animated,
    Widget Function(BuildContext context, String url)? loadingPlaceholder,
  }) {
    final String url = FluxerMediaUrl.customEmoji(
      id: widget.emojiId,
      animated: animated,
      size: widget.requestSize,
    );
    final ({int? width, int? height}) cache = animated
        ? (width: null, height: null)
        : containDecodeCacheSize(
            cellWidth: widget.size,
            cellHeight: widget.size,
            devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
          );
    return CachedNetworkImage(
      imageUrl: url,
      cacheKey:
          'emoji_${widget.emojiId}_${animated ? 'a' : 's'}_${widget.requestSize}',
      width: widget.size,
      height: widget.size,
      memCacheWidth: cache.width,
      memCacheHeight: cache.height,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      fit: BoxFit.contain,
      placeholder:
          loadingPlaceholder ??
          (_, _) => SizedBox(width: widget.size, height: widget.size),
      errorBuilder: widget.errorBuilder != null
          ? (ctx, _, _) => widget.errorBuilder!(ctx)
          : (_, _, _) => SizedBox(width: widget.size, height: widget.size),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool animateEmoji = effectiveMotionOf(
      ref,
      context,
    ).effectiveAnimateEmoji;

    if (_usesPickerVisibility) {
      final bool showAnimated = widget.isInView! && animateEmoji;
      if (showAnimated) {
        return _buildImage(
          context,
          animated: true,
          loadingPlaceholder: (BuildContext context, String _) =>
              _buildImage(context, animated: false),
        );
      }
      return _buildImage(context, animated: false);
    }
    if (!widget.animated || !widget.pauseWhenOffscreen) {
      return _buildImage(context, animated: widget.animated && animateEmoji);
    }
    return VisibilityDetector(
      key: ValueKey<String>('emoji-vis-${widget.emojiId}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: ValueListenableBuilder<bool>(
        valueListenable: _visibleNotifier,
        builder: (BuildContext context, bool visible, Widget? _) {
          return _buildImage(context, animated: animateEmoji && visible);
        },
      ),
    );
  }
}
