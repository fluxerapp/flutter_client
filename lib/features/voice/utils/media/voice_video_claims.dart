import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/utils/media/video_subscription.dart';
import 'package:livekit_client/livekit_client.dart';

class VoiceVideoClaim {
  VoiceVideoClaim._(this._owner, this._source, this._quality);

  final VoiceVideoClaims _owner;
  final TrackSource _source;
  VideoQuality _quality;
  bool _released = false;

  void update(VideoQuality quality) {
    if (_released || quality == _quality) {
      return;
    }
    _quality = quality;
    _owner._sync();
  }

  void release() {
    if (_released) {
      return;
    }
    _released = true;
    _owner._release(this);
  }
}

class _SourceClaims {
  final List<VoiceVideoClaim> claims = <VoiceVideoClaim>[];
  Timer? grace;
  Timer? suspend;
  String? signature;

  bool get isIdle => claims.isEmpty && grace == null;
}

class VoiceVideoClaims {
  VoiceVideoClaims._(this._participant);

  factory VoiceVideoClaims.of(VoiceMediaParticipant participant) {
    return _byParticipant[participant] ??= VoiceVideoClaims._(participant);
  }

  static final Expando<VoiceVideoClaims> _byParticipant =
      Expando<VoiceVideoClaims>();

  static final Set<VoiceVideoClaims> _live = <VoiceVideoClaims>{};
  static bool _backgrounded = false;
  static VoiceMediaParticipant? _focusParticipant;
  static TrackSource? _focusSource;
  static VideoQuality? _focusQuality;

  static void setBackgroundFocus({
    required bool backgrounded,
    VoiceMediaParticipant? participant,
    TrackSource? source,
    VideoQuality? quality,
  }) {
    if (_backgrounded == backgrounded &&
        identical(_focusParticipant, participant) &&
        _focusSource == source &&
        _focusQuality == quality) {
      return;
    }
    _backgrounded = backgrounded;
    _focusParticipant = participant;
    _focusSource = source;
    _focusQuality = quality;
    for (final VoiceVideoClaims claims in _live.toList()) {
      claims._sync();
    }
  }

  @visibleForTesting
  static void debugResetBackgroundFocus() {
    setBackgroundFocus(backgrounded: false);
  }

  final VoiceMediaParticipant _participant;
  final Map<TrackSource, _SourceClaims> _sources =
      <TrackSource, _SourceClaims>{};
  bool _listening = false;

  VoiceVideoClaim claim(TrackSource source, {required VideoQuality quality}) {
    final _SourceClaims state = _sources.putIfAbsent(source, _SourceClaims.new);
    state.grace?.cancel();
    state.grace = null;
    final VoiceVideoClaim claim = VoiceVideoClaim._(this, source, quality);
    state.claims.add(claim);
    if (!_listening) {
      _listening = true;
      _live.add(this);
      _participant.addListener(_sync);
    }
    _sync();
    return claim;
  }

  void _release(VoiceVideoClaim claim) {
    final _SourceClaims state = _sources[claim._source]!;
    state.claims.remove(claim);
    if (state.claims.isNotEmpty) {
      _sync();
      return;
    }
    state.suspend?.cancel();
    state.suspend = null;
    state.grace = Timer(kVoiceVideoUnsubscribeGrace, () {
      state
        ..grace = null
        ..signature = null;
      _unsubscribe(claim._source);
      _stopListeningIfIdle();
    });
  }

  bool _isFocus(TrackSource source) {
    return identical(_participant, _focusParticipant) && source == _focusSource;
  }

  bool _isSuspended(TrackSource source) {
    return _backgrounded && source == TrackSource.camera && !_isFocus(source);
  }

  void _suspend(TrackSource source, _SourceClaims state) {
    if (state.signature == null || state.suspend != null) {
      return;
    }
    state.suspend = Timer(kVoiceVideoUnsubscribeGrace, () {
      state.suspend = null;
      if (state.claims.isEmpty || !_isSuspended(source)) {
        return;
      }
      state.signature = null;
      _unsubscribe(source);
    });
  }

  void _sync() {
    _sources.forEach((TrackSource source, _SourceClaims state) {
      if (state.claims.isEmpty) {
        return;
      }
      if (_isSuspended(source)) {
        _suspend(source, state);
        return;
      }
      state.suspend?.cancel();
      state.suspend = null;
      final VideoQuality quality = _backgrounded && _isFocus(source)
          ? _focusQuality ?? _highestQuality(state.claims)
          : _highestQuality(state.claims);
      final String signature = _signature(source, quality);
      if (signature == state.signature) {
        return;
      }
      state.signature = signature;
      _subscribe(source, quality, state, signature);
    });
  }

  VideoQuality _highestQuality(List<VoiceVideoClaim> claims) {
    VideoQuality highest = claims.first._quality;
    for (final VoiceVideoClaim claim in claims) {
      if (claim._quality.index > highest.index) {
        highest = claim._quality;
      }
    }
    return highest;
  }

  String _signature(TrackSource source, VideoQuality quality) {
    if (source == TrackSource.screenShareVideo) {
      return <Object>[
        _participant.hasScreenShare,
        _participant.screenShareTrack != null,
        quality.index,
        _participant.hasScreenShareAudio,
        _participant.screenShareAudioTrack != null,
      ].join('|');
    }
    return <Object>[
      _participant.hasCamera,
      _participant.cameraTrack != null,
      quality.index,
    ].join('|');
  }

  void _subscribe(
    TrackSource source,
    VideoQuality quality,
    _SourceClaims state,
    String signature,
  ) {
    unawaited(
      _run(
        () async {
          await _participant.setVideoWanted(
            source,
            wanted: true,
            quality: quality,
          );
          if (source == TrackSource.screenShareVideo) {
            await _participant.setScreenShareAudioWanted(wanted: true);
          }
        },
        onError: () {
          if (state.signature == signature) {
            state.signature = null;
          }
        },
      ),
    );
  }

  void _unsubscribe(TrackSource source) {
    unawaited(
      _run(() async {
        await _participant.setVideoWanted(source, wanted: false);
        if (source == TrackSource.screenShareVideo) {
          await _participant.setScreenShareAudioWanted(wanted: false);
        }
      }),
    );
  }

  Future<void> _run(
    Future<void> Function() operation, {
    void Function()? onError,
  }) async {
    await Future<void>.value();
    try {
      await operation();
    } on Object {
      onError?.call();
    }
  }

  void _stopListeningIfIdle() {
    if (!_listening ||
        _sources.values.any((_SourceClaims state) => !state.isIdle)) {
      return;
    }
    _listening = false;
    _live.remove(this);
    _participant.removeListener(_sync);
  }
}
