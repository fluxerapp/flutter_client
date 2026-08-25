import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/audio_level_meter.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/services/voice_settings_applicator.dart';
import 'package:fluxer_app/features/voice/utils/voice_mic_test_track.dart';
import 'package:fluxer_app/features/voice/utils/voice_volume_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceMicTestSection extends ConsumerStatefulWidget {
  const VoiceMicTestSection({super.key});

  @override
  ConsumerState<VoiceMicTestSection> createState() =>
      _VoiceMicTestSectionState();
}

class _VoiceMicTestSectionState extends ConsumerState<VoiceMicTestSection> {
  LocalAudioTrack? _track;
  AudioVisualizer? _visualizer;
  EventsListener<AudioVisualizerEvent>? _visualizerListener;
  RTCVideoRenderer? _playbackRenderer;
  RTCPeerConnection? _loopbackLocalPeerConnection;
  RTCPeerConnection? _loopbackRemotePeerConnection;
  final ValueNotifier<double> _levelNotifier = ValueNotifier<double>(0);
  bool _isRunning = false;

  static const double _actionGap = 10;
  static const Map<String, dynamic> _loopbackConfiguration = <String, dynamic>{
    'iceServers': <Map<String, dynamic>>[],
    'sdpSemantics': 'unified-plan',
  };

  @override
  void dispose() {
    unawaited(_disposeTestResources());
    _levelNotifier.dispose();
    super.dispose();
  }

  Future<void> _startTest() async {
    if (_isRunning) {
      return;
    }
    if (ref.read(voiceSessionProvider).isConnected) {
      return;
    }
    final bool micOk = await ensureSystemPermission(
      context,
      SystemPermissionKind.microphone,
    );
    if (!micOk || !mounted) {
      return;
    }
    final VoiceSettingsState settings = ref.read(voiceSettingsProvider);
    final VoiceSettingsApplicator applicator = ref.read(
      voiceSettingsApplicatorProvider,
    );
    try {
      await applicator.applySpeakerOutput(settings: settings);
      await _configureOutputDevice(settings.outputDeviceId);
      final LocalAudioTrack track = await _createMicTestTrack(
        applicator: applicator,
        settings: settings,
      );
      await track.start();
      await Helper.setVolume(
        inputVoiceVolumePercentToGain(settings.inputVolume),
        track.mediaStreamTrack,
      );
      final AudioVisualizer visualizer = createVisualizer(
        track,
        options: const AudioVisualizerOptions(barCount: 8),
      );
      _visualizerListener = visualizer.createListener()
        ..on<AudioVisualizerEvent>((AudioVisualizerEvent event) {
          if (!mounted) {
            return;
          }
          _levelNotifier.value = _readVisualizerLevel(event);
        });
      await visualizer.start();
      await _startPlayback(track, settings);
      if (!mounted) {
        await _disposePlayback();
        await _visualizerListener?.dispose();
        await visualizer.stop();
        await visualizer.dispose();
        await track.stop();
        return;
      }
      setState(() {
        _track = track;
        _visualizer = visualizer;
        _isRunning = true;
      });
    } on Object catch (error, stackTrace) {
      talker.error('Failed to start mic test', error, stackTrace);
      await _stopTest();
    }
  }

  Future<LocalAudioTrack> _createMicTestTrack({
    required VoiceSettingsApplicator applicator,
    required VoiceSettingsState settings,
  }) {
    return createMicTestAudioTrack(applicator: applicator, settings: settings);
  }

  Future<void> _configureOutputDevice(String outputDeviceId) async {
    if (kIsWeb || AudioManager.instance.canSwitchSpeakerphone) {
      return;
    }
    if (outputDeviceId == kDefaultVoiceDeviceId || outputDeviceId.isEmpty) {
      return;
    }
    try {
      await Helper.selectAudioOutput(outputDeviceId);
    } on Object catch (error, stackTrace) {
      talker.warning('Failed to set mic test output device', error, stackTrace);
    }
  }

  Future<void> _startPlayback(
    LocalAudioTrack track,
    VoiceSettingsState settings,
  ) async {
    final RTCVideoRenderer renderer = RTCVideoRenderer();
    await renderer.initialize();
    final double outputVolume = boostedVoiceVolumePercentToTrackVolume(
      settings.outputVolume,
    );
    final String? outputDeviceId = _resolveOutputDeviceId(
      settings.outputDeviceId,
    );
    if (kIsWeb) {
      renderer.srcObject = track.mediaStream;
      if (outputDeviceId != null) {
        await renderer.audioOutput(outputDeviceId);
      }
      await renderer.setVolume(outputVolume);
      _playbackRenderer = renderer;
      return;
    }
    final RTCPeerConnection localPeerConnection = await createPeerConnection(
      _loopbackConfiguration,
    );
    final RTCPeerConnection remotePeerConnection = await createPeerConnection(
      _loopbackConfiguration,
    );
    remotePeerConnection.onTrack = (RTCTrackEvent event) {
      if (event.track.kind == 'audio' && event.streams.isNotEmpty) {
        renderer.srcObject = event.streams.first;
      }
    };
    await localPeerConnection.addTrack(
      track.mediaStreamTrack,
      track.mediaStream,
    );
    final RTCSessionDescription offer = await localPeerConnection.createOffer();
    await localPeerConnection.setLocalDescription(offer);
    await remotePeerConnection.setRemoteDescription(offer);
    final RTCSessionDescription answer = await remotePeerConnection
        .createAnswer();
    await remotePeerConnection.setLocalDescription(answer);
    await localPeerConnection.setRemoteDescription(answer);
    if (outputDeviceId != null) {
      await renderer.audioOutput(outputDeviceId);
    }
    await renderer.setVolume(outputVolume);
    _playbackRenderer = renderer;
    _loopbackLocalPeerConnection = localPeerConnection;
    _loopbackRemotePeerConnection = remotePeerConnection;
  }

  String? _resolveOutputDeviceId(String outputDeviceId) {
    if (outputDeviceId == kDefaultVoiceDeviceId || outputDeviceId.isEmpty) {
      return null;
    }
    return outputDeviceId;
  }

  double _readVisualizerLevel(AudioVisualizerEvent event) {
    double maxValue = 0;
    for (final Object? entry in event.event) {
      if (entry is num) {
        final double value = entry.toDouble();
        if (value > maxValue) {
          maxValue = value;
        }
      }
    }
    return maxValue.clamp(0, 1);
  }

  Future<void> _stopTest() async {
    await _disposeTestResources();
    if (!mounted) {
      return;
    }
    _levelNotifier.value = 0;
    setState(() => _isRunning = false);
  }

  Future<void> _disposeTestResources() async {
    await _visualizerListener?.dispose();
    _visualizerListener = null;
    await _visualizer?.stop();
    await _visualizer?.dispose();
    _visualizer = null;
    await _disposePlayback();
    await _track?.stop();
    _track = null;
  }

  Future<void> _disposePlayback() async {
    await _loopbackLocalPeerConnection?.close();
    await _loopbackLocalPeerConnection?.dispose();
    _loopbackLocalPeerConnection = null;
    await _loopbackRemotePeerConnection?.close();
    await _loopbackRemotePeerConnection?.dispose();
    _loopbackRemotePeerConnection = null;
    if (_playbackRenderer != null) {
      _playbackRenderer!.srcObject = null;
      await _playbackRenderer!.dispose();
      _playbackRenderer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final bool voiceCallActive = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState state) => state.isConnected,
      ),
    );
    final bool canInteract = !voiceCallActive;
    final String actionLabel = _isRunning
        ? l10n.audioAndVideoMicTestStopLabel
        : l10n.audioAndVideoMicTestStartLabel;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: layout.radiusLg,
        border: Border.all(color: colors.backgroundModifierAccent),
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s3),
        child: Row(
          children: [
            Expanded(
              child: ValueListenableBuilder<double>(
                valueListenable: _levelNotifier,
                builder: (BuildContext context, double level, Widget? child) {
                  return AudioLevelMeter(
                    level: _isRunning ? level : 0,
                    inactiveColor: colors.backgroundModifierAccent,
                    inactiveBorderColor: colors.textPrimary.withValues(
                      alpha: 0.1,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: _actionGap),
            _MicTestActionButton(
              isRunning: _isRunning,
              canInteract: canInteract,
              actionLabel: actionLabel,
              onStart: _startTest,
              onStop: _stopTest,
            ),
          ],
        ),
      ),
    );
  }
}

class _MicTestActionButton extends StatelessWidget {
  const _MicTestActionButton({
    required this.isRunning,
    required this.canInteract,
    required this.actionLabel,
    required this.onStart,
    required this.onStop,
  });

  final bool isRunning;
  final bool canInteract;
  final String actionLabel;
  final Future<void> Function() onStart;
  final Future<void> Function() onStop;

  @override
  Widget build(BuildContext context) {
    if (isRunning) {
      return FluxerButton.secondary(
        isSquare: true,
        size: FluxerButtonSize.small,
        icon: PhosphorIconsFill.stop,
        semanticLabel: actionLabel,
        onPressed: canInteract ? () => unawaited(onStop()) : null,
      );
    }

    return FluxerButton.primary(
      isSquare: true,
      size: FluxerButtonSize.small,
      icon: PhosphorIconsFill.play,
      semanticLabel: actionLabel,
      onPressedAsync: canInteract ? onStart : null,
    );
  }
}
