import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_stream_preview.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VoiceStreamPreviewImage extends ConsumerStatefulWidget {
  const VoiceStreamPreviewImage({
    required this.previewUrl,
    required this.fallback,
    super.key,
  });

  final String previewUrl;
  final Widget fallback;

  @override
  ConsumerState<VoiceStreamPreviewImage> createState() =>
      _VoiceStreamPreviewImageState();
}

class _VoiceStreamPreviewImageState
    extends ConsumerState<VoiceStreamPreviewImage> {
  Uint8List? _bytes;
  Timer? _timer;
  CancelToken? _cancelToken;
  int _missingAttempts = 0;
  int _loadGeneration = 0;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  @override
  void didUpdateWidget(covariant VoiceStreamPreviewImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.previewUrl == widget.previewUrl) {
      return;
    }
    _missingAttempts = 0;
    _bytes = null;
    unawaited(_load());
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cancelToken?.cancel();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    final bool visible = info.visibleFraction > 0;
    if (visible == _visible) {
      return;
    }
    _visible = visible;
    if (visible) {
      unawaited(_load());
      return;
    }
    _timer?.cancel();
    _cancelToken?.cancel();
  }

  Future<void> _load() async {
    if (!_visible) {
      return;
    }
    final int generation = ++_loadGeneration;
    _cancelToken?.cancel();
    final CancelToken cancelToken = CancelToken();
    _cancelToken = cancelToken;
    final Dio dio = ref.read(fluxerDioProvider);
    final Uint8List? bytes = await fetchStreamPreviewBytes(
      dio: dio,
      previewUrl: widget.previewUrl,
      cancelToken: cancelToken,
    );
    if (!mounted || generation != _loadGeneration) {
      return;
    }
    if (bytes != null) {
      setState(() {
        _bytes = bytes;
        _missingAttempts = 0;
      });
      _arm(kStreamPreviewRefreshInterval);
      return;
    }
    if (cancelToken.isCancelled) {
      return;
    }
    _missingAttempts += 1;
    final Duration delay =
        _missingAttempts < kStreamPreviewInitialRetryMaxAttempts
        ? kStreamPreviewInitialRetryInterval
        : kStreamPreviewRefreshInterval;
    _arm(delay);
  }

  void _arm(Duration delay) {
    _timer?.cancel();
    if (!_visible) {
      return;
    }
    _timer = Timer(delay, () {
      unawaited(_load());
    });
  }

  @override
  Widget build(BuildContext context) {
    final Uint8List? bytes = _bytes;
    final Widget child = bytes == null
        ? widget.fallback
        : Image.memory(
            bytes,
            fit: BoxFit.contain,
            gaplessPlayback: true,
            errorBuilder: (BuildContext _, Object _, StackTrace? _) {
              return widget.fallback;
            },
          );
    return VisibilityDetector(
      key: ValueKey<String>('stream-preview-${widget.previewUrl}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: ColoredBox(
        color: const Color(0xFF000000),
        child: ColorFiltered(
          colorFilter: kStreamPreviewBrightnessFilter,
          child: child,
        ),
      ),
    );
  }
}
