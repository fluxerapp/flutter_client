import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/features/voice/providers/voice_track_handoff_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_track_renderer_cache.dart';
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

class _VoiceCachedVideoTrackState extends ConsumerState<VoiceCachedVideoTrack> {
  late final VoiceTrackRendererCache<RTCVideoRenderer> _cache;
  _RendererHold? _hold;
  RTCVideoRenderer? _renderer;

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
    super.dispose();
  }

  void _bind(String key) {
    _releaseHold();
    final _RendererHold hold = _RendererHold(key);
    _hold = hold;
    final RTCVideoRenderer? ready = _cache.retainIfPresent(key);
    if (ready != null) {
      _renderer = ready;
      return;
    }
    _renderer = null;
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
      setState(() => _renderer = renderer);
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
    _renderer = null;
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
    return VideoTrackRenderer(
      widget.track,
      key: ValueKey<String>(hold.key),
      fit: widget.fit,
      mirrorMode: widget.mirrorMode,
      cachedRenderer: renderer,
      autoDisposeRenderer: false,
    );
  }
}
