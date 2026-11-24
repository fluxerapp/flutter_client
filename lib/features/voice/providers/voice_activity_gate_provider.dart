import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_noise_filter_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_transmit_provider.dart';
import 'package:fluxer_app/features/voice/services/voice_settings_applicator.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_activity_gate_provider.g.dart';

const Duration _kVoiceActivityHangover = Duration(milliseconds: 300);

typedef VoiceActivityGateConfig = ({
  bool active,
  int threshold,
  String inputDeviceId,
});

bool voiceActivityGateApplies(VoiceSettingsState settings) =>
    settings.voiceProcessingMode == VoiceProcessingMode.custom &&
    !settings.vadAutoSensitivity;

double voiceActivityThresholdLevel(int threshold) =>
    (threshold.clamp(0, 100)) / 100;

@Riverpod(keepAlive: true)
class VoiceActivityGateController extends _$VoiceActivityGateController {
  LocalAudioTrack? _track;
  AudioVisualizer? _visualizer;
  EventsListener<AudioVisualizerEvent>? _listener;
  Timer? _hangover;
  double _thresholdLevel = 0.5;
  int _generation = 0;

  @override
  VoiceActivityGateConfig build() {
    final bool connected = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState state) => state.isConnected,
      ),
    );
    final bool pushToTalk = ref.watch(voicePushToTalkActiveProvider);
    final (bool applies, int threshold, String inputDeviceId) = ref.watch(
      voiceSettingsProvider.select(
        (VoiceSettingsState settings) => (
          voiceActivityGateApplies(settings),
          settings.vadThreshold,
          settings.inputDeviceId,
        ),
      ),
    );
    final VoiceActivityGateConfig config = (
      active: connected && !pushToTalk && applies,
      threshold: threshold,
      inputDeviceId: inputDeviceId,
    );
    _thresholdLevel = voiceActivityThresholdLevel(config.threshold);
    final VoiceActivityGateConfig? previous = stateOrNull;
    final bool restart =
        previous == null ||
        previous.active != config.active ||
        previous.inputDeviceId != config.inputDeviceId;
    if (restart) {
      unawaited(_restart(config.active));
    }
    return config;
  }

  Future<void> _restart(bool active) async {
    final int generation = ++_generation;
    await _stop();
    if (!active) {
      ref
          .read(voiceTransmitHoldProvider.notifier)
          .setVoiceActivityOpen(open: true);
      return;
    }
    ref
        .read(voiceTransmitHoldProvider.notifier)
        .setVoiceActivityOpen(open: false);
    try {
      await ref.read(voiceNoiseFilterProvider.notifier).prepareCapture();
      if (generation != _generation) {
        return;
      }
      final VoiceSettingsApplicator applicator = ref.read(
        voiceSettingsApplicatorProvider,
      );
      final LocalAudioTrack track = await LocalAudioTrack.create(
        applicator.buildAudioCaptureOptions(ref.read(voiceSettingsProvider)),
      );
      if (generation != _generation) {
        await track.dispose();
        return;
      }
      await track.start();
      _track = track;
      final AudioVisualizer visualizer = createVisualizer(
        track,
        options: const AudioVisualizerOptions(barCount: 8),
      );
      _visualizer = visualizer;
      _listener = visualizer.createListener()
        ..on<AudioVisualizerEvent>(_onLevel);
      await visualizer.start();
    } on Object catch (error, stackTrace) {
      talker.warning('[Voice] Activity gate monitor failed', error, stackTrace);
      ref
          .read(voiceTransmitHoldProvider.notifier)
          .setVoiceActivityOpen(open: true);
    }
  }

  void _onLevel(AudioVisualizerEvent event) {
    double level = 0;
    for (final Object? entry in event.event) {
      if (entry is num && entry > level) {
        level = entry.toDouble();
      }
    }
    final VoiceTransmitHold hold = ref.read(voiceTransmitHoldProvider.notifier);
    if (level >= _thresholdLevel) {
      _hangover?.cancel();
      _hangover = null;
      hold.setVoiceActivityOpen(open: true);
      return;
    }
    if (_hangover != null) {
      return;
    }
    _hangover = Timer(_kVoiceActivityHangover, () {
      _hangover = null;
      hold.setVoiceActivityOpen(open: false);
    });
  }

  Future<void> _stop() async {
    _hangover?.cancel();
    _hangover = null;
    final EventsListener<AudioVisualizerEvent>? listener = _listener;
    final AudioVisualizer? visualizer = _visualizer;
    final LocalAudioTrack? track = _track;
    _listener = null;
    _visualizer = null;
    _track = null;
    await listener?.dispose();
    await visualizer?.stop();
    await track?.stop();
    await track?.dispose();
  }
}
