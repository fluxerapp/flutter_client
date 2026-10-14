import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/material_ui.dart';

const List<Duration> kMediaLoadRetryDelays = <Duration>[
  Duration(seconds: 1),
  Duration(seconds: 2),
  Duration(seconds: 4),
  Duration(seconds: 8),
];

const Duration kMediaLoadRecoveryMaxDelay = Duration(seconds: 60);

Duration mediaLoadRetryDelay(int failures) {
  if (failures <= kMediaLoadRetryDelays.length) {
    return kMediaLoadRetryDelays[failures - 1];
  }
  final Duration last = kMediaLoadRetryDelays.last;
  final int doublings = failures - kMediaLoadRetryDelays.length;
  final int seconds = last.inSeconds << doublings.clamp(0, 8);
  return seconds >= kMediaLoadRecoveryMaxDelay.inSeconds
      ? kMediaLoadRecoveryMaxDelay
      : Duration(seconds: seconds);
}

class RetryingNetworkImage extends StatefulWidget {
  const RetryingNetworkImage({
    required this.imageUrl,
    required this.errorPlaceholder,
    this.placeholder,
    this.width,
    this.height,
    this.fit,
    this.memCacheWidth,
    this.memCacheHeight,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.fadeInDuration = Duration.zero,
    this.fadeOutDuration = Duration.zero,
    this.disablePlaceholderOnCacheHit = false,
    super.key,
  });

  final String imageUrl;
  final Widget errorPlaceholder;
  final Widget? placeholder;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final int? maxWidthDiskCache;
  final int? maxHeightDiskCache;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final bool disablePlaceholderOnCacheHit;

  @override
  State<RetryingNetworkImage> createState() => _RetryingNetworkImageState();
}

class _RetryingNetworkImageState extends State<RetryingNetworkImage> {
  int _attempt = 0;
  int _failures = 0;
  int? _failedAttempt;
  bool _permanent = false;
  Timer? _retryTimer;

  @override
  void didUpdateWidget(RetryingNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _retryTimer?.cancel();
      _retryTimer = null;
      _failures = 0;
      _failedAttempt = null;
      _permanent = false;
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
    if (error is UnsupportedImageFormatException) {
      _permanent = true;
      return;
    }
    _retryTimer?.cancel();
    _retryTimer = Timer(mediaLoadRetryDelay(_failures), _retry);
  }

  void _retry() {
    _retryTimer = null;
    if (!mounted) {
      return;
    }
    setState(() => _attempt += 1);
  }

  Widget _failureChild(Object error) {
    _onFailure(error);
    if (!_permanent && _failures <= kMediaLoadRetryDelays.length) {
      return widget.placeholder ??
          SizedBox(width: widget.width, height: widget.height);
    }
    return widget.errorPlaceholder;
  }

  @override
  Widget build(BuildContext context) {
    final Widget? placeholder = widget.placeholder;
    return CachedNetworkImage(
      key: ValueKey<int>(_attempt),
      imageUrl: widget.imageUrl,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      memCacheWidth: widget.memCacheWidth,
      memCacheHeight: widget.memCacheHeight,
      maxWidthDiskCache: widget.maxWidthDiskCache,
      maxHeightDiskCache: widget.maxHeightDiskCache,
      fadeInDuration: widget.fadeInDuration,
      fadeOutDuration: widget.fadeOutDuration,
      disablePlaceholderOnCacheHit: widget.disablePlaceholderOnCacheHit,
      placeholder: placeholder == null
          ? null
          : (BuildContext _, String _) => placeholder,
      errorBuilder: (BuildContext _, Object error, StackTrace? _) =>
          _failureChild(error),
    );
  }
}
