import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/audio/processing_profile.dart';

void main() {
  group('resolveVoiceProcessing', () {
    test('focused voice defaults to RNNoise without platform NS', () {
      final ResolvedVoiceProcessing result = resolveVoiceProcessing(
        settings: const VoiceSettingsState(
          noiseSuppressionBackend: NoiseSuppressionBackend.none,
          echoCancellation: false,
        ),
      );
      expect(result.backend, NoiseSuppressionBackend.rnnoise);
      expect(result.noiseSuppression, isFalse);
      expect(result.echoCancellation, isTrue);
      expect(result.autoGainControl, isTrue);
    });

    test('focused voice honours the auto gain setting', () {
      final ResolvedVoiceProcessing result = resolveVoiceProcessing(
        settings: const VoiceSettingsState(autoGainControl: false),
      );
      expect(result.autoGainControl, isFalse);
    });

    test('focused voice falls back to platform NS', () {
      final ResolvedVoiceProcessing result = resolveVoiceProcessing(
        settings: const VoiceSettingsState(),
        unavailableBackends: NoiseSuppressionBackend.native,
      );
      expect(result.backend, NoiseSuppressionBackend.standard);
      expect(result.noiseSuppression, isTrue);
    });

    test('direct input disables everything', () {
      final ResolvedVoiceProcessing result = resolveVoiceProcessing(
        settings: const VoiceSettingsState(
          voiceProcessingMode: VoiceProcessingMode.studio,
        ),
        unavailableBackends: NoiseSuppressionBackend.native,
      );
      expect(result.backend, NoiseSuppressionBackend.none);
      expect(result.echoCancellation, isFalse);
      expect(result.noiseSuppression, isFalse);
      expect(result.autoGainControl, isFalse);
    });

    test('custom uses the selected backend and keeps auto gain', () {
      for (final NoiseSuppressionBackend backend
          in NoiseSuppressionBackend.values) {
        final ResolvedVoiceProcessing result = resolveVoiceProcessing(
          settings: VoiceSettingsState(
            voiceProcessingMode: VoiceProcessingMode.custom,
            noiseSuppressionBackend: backend,
          ),
        );
        expect(result.backend, backend);
        expect(
          result.noiseSuppression,
          backend == NoiseSuppressionBackend.standard,
        );
        expect(result.autoGainControl, isTrue);
      }
    });

    test('custom none never falls back', () {
      final ResolvedVoiceProcessing result = resolveVoiceProcessing(
        settings: const VoiceSettingsState(
          voiceProcessingMode: VoiceProcessingMode.custom,
          noiseSuppressionBackend: NoiseSuppressionBackend.none,
        ),
        unavailableBackends: NoiseSuppressionBackend.native,
      );
      expect(result.backend, NoiseSuppressionBackend.none);
    });
  });

  group('voiceCaptureRestartRequired', () {
    bool restarts(VoiceSettingsState previous, VoiceSettingsState next) {
      return voiceCaptureRestartRequired(
        previousSettings: previous,
        previous: resolveVoiceProcessing(settings: previous),
        nextSettings: next,
        next: resolveVoiceProcessing(settings: next),
      );
    }

    const VoiceSettingsState custom = VoiceSettingsState(
      voiceProcessingMode: VoiceProcessingMode.custom,
    );

    test('native backends switch live', () {
      for (final NoiseSuppressionBackend backend in <NoiseSuppressionBackend>[
        NoiseSuppressionBackend.none,
        NoiseSuppressionBackend.gate,
        NoiseSuppressionBackend.rnnoise,
      ]) {
        expect(
          restarts(custom, custom.copyWith(noiseSuppressionBackend: backend)),
          isFalse,
        );
      }
    });

    test('focused voice to custom with the same options stays live', () {
      expect(restarts(const VoiceSettingsState(), custom), isFalse);
    });

    test('platform NS, echo, gain, device and direct input restart', () {
      expect(
        restarts(
          custom,
          custom.copyWith(
            noiseSuppressionBackend: NoiseSuppressionBackend.standard,
          ),
        ),
        isTrue,
      );
      expect(
        restarts(custom, custom.copyWith(echoCancellation: false)),
        isTrue,
      );
      expect(restarts(custom, custom.copyWith(autoGainControl: false)), isTrue);
      expect(restarts(custom, custom.copyWith(inputDeviceId: 'usb')), isTrue);
      const VoiceSettingsState raw = VoiceSettingsState(
        voiceProcessingMode: VoiceProcessingMode.custom,
        noiseSuppressionBackend: NoiseSuppressionBackend.none,
        echoCancellation: false,
        autoGainControl: false,
      );
      expect(
        restarts(
          raw,
          raw.copyWith(voiceProcessingMode: VoiceProcessingMode.studio),
        ),
        isTrue,
      );
    });

    test('a backend that failed to start restarts capture', () {
      const VoiceSettingsState settings = VoiceSettingsState();
      expect(
        voiceCaptureRestartRequired(
          previousSettings: settings,
          previous: resolveVoiceProcessing(settings: settings),
          nextSettings: settings,
          next: resolveVoiceProcessing(
            settings: settings,
            unavailableBackends: NoiseSuppressionBackend.native,
          ),
        ),
        isTrue,
      );
    });
  });
}
