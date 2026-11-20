import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/features/voice/providers/voice_track_handoff_provider.dart';
import 'package:fluxer_app/features/voice/utils/media/track_renderer_cache.dart';
import 'package:fluxer_app/features/voice/utils/pip/voice_video_surface_registry.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:livekit_client/livekit_client.dart';

String voiceVideoTrackCacheKey(VideoTrack track) {
  final String? sid = track.sid;
  if (sid != null && sid.isNotEmpty) {
    return sid;
  }
  final String? trackId = track.mediaStreamTrack.id;
  if (trackId != null && trackId.isNotEmpty) {
    return trackId;
  }
  return 'track-${identityHashCode(track)}';
}

class VoiceCachedVideoTrack extends ConsumerStatefulWidget {
  const VoiceCachedVideoTrack({
    required this.track,
    required this.fit,
    required this.mirrorMode,
    super.key,
  });

  final VideoTrack track;
  final VideoViewFit fit;
  final VideoViewMirrorMode mirrorMode;

  @override
  ConsumerState<VoiceCachedVideoTrack> createState() =>
      _VoiceCachedVideoTrackState();
}

class _RendererHold {
  _RendererHold(this.key);

  final String key;
  var released = false;
}

class _VoiceCachedVideoTrackState extends ConsumerState<VoiceCachedVideoTrack>
    implements VoiceVideoSurface {
  late final VoiceTrackRendererCache<RTCVideoRenderer> _cache;
  _RendererHold? _hold;
  RTCVideoRenderer? _renderer;
  VideoTrackRenderer? _built;
  String? _surfaceKey;

  @override
  Rect? get globalRect =>
      mounted ? voiceVideoSurfaceGlobalRect(context.findRenderObject()) : null;

  @override
  Size? get videoSize {
    final RTCVideoRenderer? renderer = _renderer;
    if (renderer == null) {
      return null;
    }
    final RTCVideoValue value = renderer.value;
    return voiceVideoSizeFrom(
      width: value.width,
      height: value.height,
      rotation: value.rotation,
    );
  }

  void _onRendererChanged() {
    final String? key = _surfaceKey;
    if (key != null) {
      VoiceVideoSurfaceRegistry.instance.markChanged(key);
    }
  }

  void _setRenderer(RTCVideoRenderer? renderer) {
    final RTCVideoRenderer? previous = _renderer;
    if (identical(previous, renderer)) {
      return;
    }
    _renderer = renderer;
    if (!isFluxerNativeMobileOs) {
      return;
    }
    previous?.removeListener(_onRendererChanged);
    renderer?.addListener(_onRendererChanged);
  }

  void _registerSurface(String? key) {
    if (!isFluxerNativeMobileOs) {
      return;
    }
    final String? previous = _surfaceKey;
    if (previous == key) {
      return;
    }
    if (previous != null) {
      VoiceVideoSurfaceRegistry.instance.remove(previous, this);
    }
    _surfaceKey = key;
    if (key != null) {
      VoiceVideoSurfaceRegistry.instance.add(key, this);
    }
  }

  @override
  void initState() {
    super.initState();
    _cache = ref.read(voiceTrackRendererCacheProvider);
    _bind(voiceVideoTrackCacheKey(widget.track));
  }

  @override
  void didUpdateWidget(covariant VoiceCachedVideoTrack oldWidget) {
    super.didUpdateWidget(oldWidget);
    final String key = voiceVideoTrackCacheKey(widget.track);
    if (_hold?.key != key) {
      _bind(key);
    }
  }

  @override
  void dispose() {
    _releaseHold();
    _registerSurface(null);
    super.dispose();
  }

  void _bind(String key) {
    _releaseHold();
    final _RendererHold hold = _RendererHold(key);
    _hold = hold;
    _registerSurface(key);
    final RTCVideoRenderer? ready = _cache.retainIfPresent(key);
    if (ready != null) {
      _setRenderer(ready);
      return;
    }
    _setRenderer(null);
    unawaited(_load(hold));
  }

  Future<void> _load(_RendererHold hold) async {
    try {
      final RTCVideoRenderer renderer = await _cache.retain(hold.key);
      if (hold.released) {
        return;
      }
      if (!mounted) {
        hold.released = true;
        _cache.release(hold.key);
        return;
      }
      setState(() => _setRenderer(renderer));
    } on Object {
      if (hold.released) {
        return;
      }
      hold.released = true;
      _cache.release(hold.key);
    }
  }

  void _releaseHold() {
    final _RendererHold? hold = _hold;
    _hold = null;
    _setRenderer(null);
    _built = null;
    if (hold == null || hold.released) {
      return;
    }
    hold.released = true;
    _cache.release(hold.key);
  }

  @override
  Widget build(BuildContext context) {
    final RTCVideoRenderer? renderer = _renderer;
    final _RendererHold? hold = _hold;
    if (renderer == null || hold == null) {
      return const SizedBox.shrink();
    }
    final VideoTrackRenderer? built = _built;
    if (built != null &&
        identical(built.track, widget.track) &&
        identical(built.cachedRenderer, renderer) &&
        built.fit == widget.fit &&
        built.mirrorMode == widget.mirrorMode) {
      return built;
    }
    return _built = VideoTrackRenderer(
      widget.track,
      key: ValueKey<String>(hold.key),
      fit: widget.fit,
      mirrorMode: widget.mirrorMode,
      cachedRenderer: renderer,
      autoDisposeRenderer: false,
    );
  }
}
