import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_processing_profile.dart';

void main() {
  group('resolveVoiceProcessing', () {
    test('focused voice enables noise filter when supported', () {
      final ResolvedVoiceProcessing result = resolveVoiceProcessing(
        settings: const VoiceSettingsState(),
        noiseFilterSupported: true,
      );
      expect(result.useNoiseFilter, isTrue);
      expect(result.echoCancellation, isTrue);
      expect(result.noiseSuppression, isFalse);
      expect(result.autoGainControl, isFalse);
    });

    test('direct input bypasses all processing', () {
      final ResolvedVoiceProcessing result = resolveVoiceProcessing(
        settings: const VoiceSettingsState(
          voiceProcessingMode: VoiceProcessingMode.studio,
        ),
        noiseFilterSupported: true,
      );
      expect(result.useNoiseFilter, isFalse);
      expect(result.echoCancellation, isFalse);
      expect(result.noiseSuppression, isFalse);
      expect(result.autoGainControl, isFalse);
    });

    test('custom enhanced uses noise filter and disables browser ns', () {
      final ResolvedVoiceProcessing result = resolveVoiceProcessing(
        settings: const VoiceSettingsState(
          voiceProcessingMode: VoiceProcessingMode.custom,
        ),
        noiseFilterSupported: true,
      );
      expect(result.useNoiseFilter, isTrue);
      expect(result.noiseSuppression, isFalse);
      expect(result.autoGainControl, isFalse);
    });

    test('custom standard uses browser noise suppression', () {
      final ResolvedVoiceProcessing result = resolveVoiceProcessing(
        settings: const VoiceSettingsState(
          voiceProcessingMode: VoiceProcessingMode.custom,
          noiseSuppressionTier: NoiseSuppressionTier.standard,
        ),
        noiseFilterSupported: true,
      );
      expect(result.useNoiseFilter, isFalse);
      expect(result.noiseSuppression, isTrue);
    });
  });
}
