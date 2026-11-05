import 'dart:async';
import 'dart:math' as math;

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/widgets.dart';

typedef FluxerAnimatedEmojiFailureCallback =
    void Function(String url, Object error);

const int _kMaxRetryDelaySeconds = 60;

@visibleForTesting
Duration animatedEmojiRetryDelay(int failures) {
  final int seconds = 1 << (failures - 1).clamp(0, 6);
  return Duration(seconds: math.min(seconds, _kMaxRetryDelaySeconds));
}

class FluxerAnimatedEmojiImage extends StatefulWidget {
  const FluxerAnimatedEmojiImage({
    required this.url,
    required this.cacheKey,
    required this.size,
    required this.fallback,
    this.placeholder,
    super.key,
  });

  static FluxerAnimatedEmojiFailureCallback? onFirstFailure;

  final String url;
  final String cacheKey;
  final double size;

  final Widget fallback;

  final Widget? placeholder;

  @override
  State<FluxerAnimatedEmojiImage> createState() =>
      _FluxerAnimatedEmojiImageState();
}

class _FluxerAnimatedEmojiImageState extends State<FluxerAnimatedEmojiImage> {
  int _attempt = 0;
  int _failures = 0;
  int? _failedAttempt;
  Timer? _retryTimer;

  @override
  void didUpdateWidget(FluxerAnimatedEmojiImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url || oldWidget.cacheKey != widget.cacheKey) {
      _retryTimer?.cancel();
      _retryTimer = null;
      _failures = 0;
      _failedAttempt = null;
    }
  }

  @override
  void dispose() {
    _retryTimer?.cancel();
    super.dispose();
  }

  void _onFailure(Object error) {
    if (_failedAttempt == _attempt) {
      return;
    }
    _failedAttempt = _attempt;
    _failures += 1;
    if (_failures == 1) {
      FluxerAnimatedEmojiImage.onFirstFailure?.call(widget.url, error);
    }
    if (error is UnsupportedImageFormatException) {
      return;
    }
    unawaited(_evict(url: widget.url, cacheKey: widget.cacheKey));
    _retryTimer?.cancel();
    _retryTimer = Timer(animatedEmojiRetryDelay(_failures), _retry);
  }

  Future<void> _evict({required String url, required String cacheKey}) async {
    try {
      if (_failures >= 2) {
        await CachedNetworkImage.evictFromCache(url, cacheKey: cacheKey);
      } else {
        await CachedNetworkImageProvider(url, cacheKey: cacheKey).evict();
      }
    } on Object catch (_) {
      return;
    }
  }

  void _retry() {
    _retryTimer = null;
    if (!mounted) {
      return;
    }
    setState(() => _attempt += 1);
  }

  @override
  Widget build(BuildContext context) {
    final Widget? placeholder = widget.placeholder;
    return CachedNetworkImage(
      key: ValueKey<int>(_attempt),
      imageUrl: widget.url,
      cacheKey: widget.cacheKey,
      width: widget.size,
      height: widget.size,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      fit: BoxFit.contain,
      placeholder: placeholder == null
          ? null
          : (BuildContext _, String _) => placeholder,
      errorBuilder: (BuildContext _, Object error, StackTrace? _) {
        _onFailure(error);
        return widget.fallback;
      },
    );
  }
}
