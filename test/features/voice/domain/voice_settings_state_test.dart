import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';

void main() {
  group('VoiceSettingsState outputRoute', () {
    test('defaults to speaker', () {
      expect(const VoiceSettingsState().outputRoute, VoiceOutputRoute.speaker);
    });

    test('fromJson defaults a missing route to speaker', () {
      final VoiceSettingsState settings = VoiceSettingsState.fromJson(
        <String, dynamic>{},
      );
      expect(settings.outputRoute, VoiceOutputRoute.speaker);
    });

    test('fromJson keeps an older earpiece preference', () {
      final VoiceSettingsState settings = VoiceSettingsState.fromJson(
        <String, dynamic>{'preferSpeakerOutput': false},
      );
      expect(settings.outputRoute, VoiceOutputRoute.earpiece);
    });

    test('fromJson reads the stored route', () {
      final VoiceSettingsState settings = VoiceSettingsState.fromJson(
        <String, dynamic>{'outputRoute': 'headset'},
      );
      expect(settings.outputRoute, VoiceOutputRoute.headset);
    });

    test('does not persist the route override', () {
      const VoiceSettingsState settings = VoiceSettingsState(
        outputRouteOverride: VoiceOutputRoute.earpiece,
        outputDeviceOverride: 7,
      );
      final VoiceSettingsState restored = VoiceSettingsState.fromJson(
        settings.toJson(),
      );
      expect(restored.outputRouteOverride, isNull);
      expect(restored.outputDeviceOverride, isNull);
    });

    test('copyWith keeps or clears the route override', () {
      const VoiceSettingsState settings = VoiceSettingsState(
        outputRouteOverride: VoiceOutputRoute.bluetooth,
        outputDeviceOverride: 7,
      );
      expect(
        settings.copyWith(inputVolume: 50).outputRouteOverride,
        VoiceOutputRoute.bluetooth,
      );
      expect(settings.copyWith(inputVolume: 50).outputDeviceOverride, 7);
      final VoiceSettingsState cleared = settings.copyWith(
        clearOutputRouteOverride: true,
      );
      expect(cleared.outputRouteOverride, isNull);
      expect(cleared.outputDeviceOverride, isNull);
    });
  });

  group('VoiceSettingsState prioritizeSpeakingParticipants', () {
    test('defaults to false', () {
      expect(
        const VoiceSettingsState().prioritizeSpeakingParticipants,
        isFalse,
      );
    });

    test('round-trips through json', () {
      const VoiceSettingsState settings = VoiceSettingsState(
        prioritizeSpeakingParticipants: true,
      );
      final VoiceSettingsState restored = VoiceSettingsState.fromJson(
        settings.toJson(),
      );
      expect(restored.prioritizeSpeakingParticipants, isTrue);
    });

    test(
      'fromJson defaults missing prioritizeSpeakingParticipants to false',
      () {
        final VoiceSettingsState settings = VoiceSettingsState.fromJson(
          <String, dynamic>{},
        );
        expect(settings.prioritizeSpeakingParticipants, isFalse);
      },
    );
  });

  group('VoiceSettingsState participantLocalMutes', () {
    test('defaults to empty', () {
      expect(const VoiceSettingsState().participantLocalMutes, isEmpty);
    });

    test('round-trips through json', () {
      const VoiceSettingsState settings = VoiceSettingsState(
        participantLocalMutes: <String, bool>{'42': true},
      );
      final VoiceSettingsState restored = VoiceSettingsState.fromJson(
        settings.toJson(),
      );
      expect(restored.participantLocalMutes, <String, bool>{'42': true});
    });
  });

  group('VoiceSettingsState noiseSuppressionBackend', () {
    NoiseSuppressionBackend? read(Map<String, dynamic> json) =>
        VoiceSettingsState.fromJson(json).noiseSuppressionBackend;

    test('defaults to null', () {
      expect(read(<String, dynamic>{}), isNull);
    });

    test('migrates saved tiers', () {
      expect(
        read(<String, dynamic>{'noiseSuppressionTier': 'enhanced'}),
        isNull,
      );
      expect(
        read(<String, dynamic>{'noiseSuppressionTier': 'standard'}),
        NoiseSuppressionBackend.standard,
      );
      expect(
        read(<String, dynamic>{'noiseSuppressionTier': 'none'}),
        NoiseSuppressionBackend.none,
      );
    });

    test('migrates the older deep filter flags', () {
      expect(
        read(<String, dynamic>{'deepFilterNoiseSuppression': false}),
        NoiseSuppressionBackend.standard,
      );
      expect(
        read(<String, dynamic>{
          'deepFilterNoiseSuppression': false,
          'noiseSuppression': false,
        }),
        NoiseSuppressionBackend.none,
      );
    });

    test('round trips and wins over the old tier', () {
      for (final NoiseSuppressionBackend? backend in <NoiseSuppressionBackend?>[
        null,
        ...NoiseSuppressionBackend.values,
      ]) {
        expect(
          read(
            VoiceSettingsState(noiseSuppressionBackend: backend).toJson()
              ..['noiseSuppressionTier'] = 'standard',
          ),
          backend,
        );
      }
    });

    test('ignores unknown backends', () {
      expect(
        read(<String, dynamic>{'noiseSuppressionBackend': 'deep_filter'}),
        isNull,
      );
    });
  });
}
