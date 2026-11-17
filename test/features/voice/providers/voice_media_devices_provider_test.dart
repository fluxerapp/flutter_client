import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_media_devices_provider.dart';

void main() {
  test('lists the default device once when the platform reports one', () {
    final List<VoiceMediaDeviceOption> options =
        withDefaultVoiceMediaDevice(const <VoiceMediaDeviceOption>[
          VoiceMediaDeviceOption(deviceId: kDefaultVoiceDeviceId, label: ''),
          VoiceMediaDeviceOption(deviceId: 'mic-1', label: 'Built-in'),
        ]);

    expect(
      options.map((VoiceMediaDeviceOption option) => option.deviceId),
      <String>[kDefaultVoiceDeviceId, 'mic-1'],
    );
  });

  test('adds the default device when the platform omits it', () {
    final List<VoiceMediaDeviceOption> options = withDefaultVoiceMediaDevice(
      const <VoiceMediaDeviceOption>[
        VoiceMediaDeviceOption(deviceId: 'mic-1', label: 'Built-in'),
      ],
    );

    expect(
      options.map((VoiceMediaDeviceOption option) => option.deviceId),
      <String>[kDefaultVoiceDeviceId, 'mic-1'],
    );
  });
}
