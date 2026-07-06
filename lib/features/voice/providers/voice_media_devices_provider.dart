import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_media_devices_provider.g.dart';

class VoiceMediaDeviceOption {
  const VoiceMediaDeviceOption({
    required this.deviceId,
    required this.label,
    required this.kind,
  });

  final String deviceId;
  final String label;
  final String kind;
}

class VoiceMediaDevicesState {
  const VoiceMediaDevicesState({
    this.audioInputs = const <VoiceMediaDeviceOption>[],
    this.audioOutputs = const <VoiceMediaDeviceOption>[],
    this.videoInputs = const <VoiceMediaDeviceOption>[],
    this.isLoading = false,
  });

  final List<VoiceMediaDeviceOption> audioInputs;
  final List<VoiceMediaDeviceOption> audioOutputs;
  final List<VoiceMediaDeviceOption> videoInputs;
  final bool isLoading;

  VoiceMediaDevicesState copyWith({
    List<VoiceMediaDeviceOption>? audioInputs,
    List<VoiceMediaDeviceOption>? audioOutputs,
    List<VoiceMediaDeviceOption>? videoInputs,
    bool? isLoading,
  }) {
    return VoiceMediaDevicesState(
      audioInputs: audioInputs ?? this.audioInputs,
      audioOutputs: audioOutputs ?? this.audioOutputs,
      videoInputs: videoInputs ?? this.videoInputs,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

List<VoiceMediaDeviceOption> _withDefaultOption(
  List<VoiceMediaDeviceOption> devices,
) {
  return <VoiceMediaDeviceOption>[
    const VoiceMediaDeviceOption(
      deviceId: kDefaultVoiceDeviceId,
      label: '',
      kind: '',
    ),
    ...devices,
  ];
}

VoiceMediaDeviceOption _mapDevice(MediaDevice device) {
  return VoiceMediaDeviceOption(
    deviceId: device.deviceId,
    label: device.label,
    kind: device.kind,
  );
}

@Riverpod(keepAlive: true)
class VoiceMediaDevices extends _$VoiceMediaDevices {
  @override
  VoiceMediaDevicesState build() {
    return const VoiceMediaDevicesState();
  }

  Future<void> refresh() async {
    state = state.copyWith(isLoading: true);
    try {
      final List<MediaDevice> devices = await Hardware.instance
          .enumerateDevices();
      final List<VoiceMediaDeviceOption> audioInputs = devices
          .where((MediaDevice device) => device.kind == 'audioinput')
          .map(_mapDevice)
          .toList();
      final List<VoiceMediaDeviceOption> audioOutputs = devices
          .where((MediaDevice device) => device.kind == 'audiooutput')
          .map(_mapDevice)
          .toList();
      final List<VoiceMediaDeviceOption> videoInputs = devices
          .where((MediaDevice device) => device.kind == 'videoinput')
          .map(_mapDevice)
          .toList();
      state = VoiceMediaDevicesState(
        audioInputs: _withDefaultOption(audioInputs),
        audioOutputs: _withDefaultOption(audioOutputs),
        videoInputs: _withDefaultOption(videoInputs),
      );
    } on Object {
      state = state.copyWith(isLoading: false);
    }
  }
}
