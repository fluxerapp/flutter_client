import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_app/features/settings/utils/sound_volume_utils.dart';

void main() {
  group('computeEffectiveSfxVolume', () {
    test('uses master volume when no override exists', () {
      const SoundPreferencesState prefs = SoundPreferencesState(
        masterVolume: 50,
      );
      final double volume = computeEffectiveSfxVolume(
        prefs: prefs,
        soundType: kSoundTypeMessage,
      );
      expect(volume, closeTo(0.2, 0.001));
    });

    test('uses per-sound override when present', () {
      const SoundPreferencesState prefs = SoundPreferencesState(
        soundOverrides: <String, double>{kSoundTypeMessage: 200},
      );
      final double volume = computeEffectiveSfxVolume(
        prefs: prefs,
        soundType: kSoundTypeMessage,
      );
      expect(volume, closeTo(0.8, 0.001));
    });
  });
}
