import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CachedEmojiImage extends StatefulWidget {
  const CachedEmojiImage({
    required this.emojiId,
    required this.animated,
    required this.requestSize,
    required this.size,
    this.errorBuilder,
    this.pauseWhenOffscreen = true,
    super.key,
  });

  final String emojiId;
  final bool animated;
  final int requestSize;
  final double size;
  final WidgetBuilder? errorBuilder;
  final bool pauseWhenOffscreen;

  @override
  State<CachedEmojiImage> createState() => _CachedEmojiImageState();
}

class _CachedEmojiImageState extends State<CachedEmojiImage> {
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

  bool get _shouldAnimate {
    if (!widget.animated) {
      return false;
    }
    if (!widget.pauseWhenOffscreen) {
      return true;
    }
    return _visibleNotifier.value;
  }

  Widget _buildImage(BuildContext context, bool shouldAnimate) {
    final String url = FluxerMediaUrl.customEmoji(
      id: widget.emojiId,
      animated: shouldAnimate,
      size: widget.requestSize,
    );
    final cache = containDecodeCacheSize(
      cellWidth: widget.size,
      cellHeight: widget.size,
      devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
    );
    return CachedNetworkImage(
      imageUrl: url,
      cacheKey:
          'emoji_${widget.emojiId}_${shouldAnimate ? 'a' : 's'}_${widget.requestSize}',
      width: widget.size,
      height: widget.size,
      memCacheWidth: cache.width,
      memCacheHeight: cache.height,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      fit: BoxFit.contain,
      placeholder: (_, _) => SizedBox(width: widget.size, height: widget.size),
      errorBuilder: widget.errorBuilder != null
          ? (ctx, _, _) => widget.errorBuilder!(ctx)
          : (_, _, _) => SizedBox(width: widget.size, height: widget.size),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.animated || !widget.pauseWhenOffscreen) {
      return _buildImage(context, _shouldAnimate);
    }
    return VisibilityDetector(
      key: ValueKey<String>('emoji-${widget.emojiId}-${widget.requestSize}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: ListenableBuilder(
        listenable: _visibleNotifier,
        builder: (BuildContext context, Widget? _) {
          return _buildImage(context, _shouldAnimate);
        },
      ),
    );
  }
}
