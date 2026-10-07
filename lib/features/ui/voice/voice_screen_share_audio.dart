import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_stream_audio_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_track_handoff_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_screen_share_audio_session.dart';
import 'package:fluxer_app/features/voice/utils/voice_stream_audio_utils.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:livekit_client/livekit_client.dart';

class VoiceScreenShareAudio extends ConsumerStatefulWidget {
  const VoiceScreenShareAudio({
    required this.audioTrack,
    required this.streamKey,
    this.enabled = true,
    super.key,
  });

  final AudioTrack audioTrack;
  final String? streamKey;
  final bool enabled;

  @override
  ConsumerState<VoiceScreenShareAudio> createState() =>
      _VoiceScreenShareAudioState();
}

class _VoiceScreenShareAudioState extends ConsumerState<VoiceScreenShareAudio> {
  late final VoiceScreenShareAudioSession<AudioTrack> _session;
  AudioTrack? _heldTrack;
  var _started = false;

  @override
  void initState() {
    super.initState();
    _session = ref.read(voiceScreenShareAudioSessionProvider);
    _syncPlayback();
  }

  @override
  void didUpdateWidget(covariant VoiceScreenShareAudio oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.audioTrack != widget.audioTrack ||
        oldWidget.enabled != widget.enabled) {
      _syncPlayback();
    }
    unawaited(_applyVolume());
  }

  @override
  void dispose() {
    _release(immediate: false);
    super.dispose();
  }

  void _syncPlayback() {
    if (widget.enabled) {
      _hold(widget.audioTrack);
      return;
    }
    _release(immediate: true);
  }

  void _hold(AudioTrack track) {
    if (_heldTrack == track) {
      return;
    }
    _release(immediate: false);
    _heldTrack = track;
    unawaited(_start(track));
  }

  Future<void> _start(AudioTrack track) async {
    final bool startedPlayback;
    try {
      startedPlayback = await _session.retain(track);
    } on Object {
      if (_heldTrack == track) {
        _release(immediate: true);
      }
      return;
    }
    if (!mounted || _heldTrack != track) {
      return;
    }
    _started = true;
    final bool flipEnabled =
        startedPlayback && defaultTargetPlatform == TargetPlatform.android;
    await _applyVolume(flipEnabled: flipEnabled);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _heldTrack != track || !_started) {
        return;
      }
      unawaited(_applyVolume());
    });
  }

  void _release({required bool immediate}) {
    final AudioTrack? track = _heldTrack;
    _heldTrack = null;
    _started = false;
    if (track == null) {
      return;
    }
    _session.release(track, immediate: immediate);
  }

  bool get _muted {
    final String? streamKey = widget.streamKey;
    if (streamKey == null) {
      return false;
    }
    return ref.read(voiceStreamAudioProvider).isMuted(streamKey);
  }

  Future<void> _applyVolume({bool flipEnabled = false}) async {
    final AudioTrack? track = _heldTrack;
    if (track == null || !_started) {
      return;
    }
    final String? streamKey = widget.streamKey;
    final bool muted = _muted;
    final int outputVolume = ref.read(voiceSettingsProvider).outputVolume;
    final int streamVolume = streamKey == null
        ? kDefaultVoiceVolumePercent
        : ref.read(voiceStreamAudioProvider).volumeFor(streamKey);
    try {
      await applyScreenShareAudibleToTrack(
        track: track,
        muted: muted,
        streamVolumePercent: streamVolume,
        outputVolumePercent: outputVolume,
        flipEnabled: flipEnabled,
      );
    } on Object {
      return;
    }
    if (!mounted || _heldTrack != track || !_started || _muted == muted) {
      return;
    }
    // Mute changed while the gain update was in flight.
    await _applyVolume();
  }

  void _onPrefsChanged() {
    unawaited(_applyVolume());
  }

  @override
  Widget build(BuildContext context) {
    ref
      ..listen<VoiceStreamAudioPrefsState>(
        voiceStreamAudioProvider,
        (_, _) => _onPrefsChanged(),
      )
      ..listen<VoiceSettingsState>(
        voiceSettingsProvider,
        (_, _) => unawaited(_applyVolume()),
      );
    return const SizedBox.shrink();
  }
}
