import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/audio/sound_effect_policy.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_app/features/settings/utils/sound_type_utils.dart';

void main() {
  group('shouldPlaySoundEffect', () {
    test('plays when notifications and the sound type are enabled', () {
      expect(
        shouldPlaySoundEffect(
          soundPrefs: const SoundPreferencesState(),
          soundType: kSoundTypeMessage,
        ),
        isTrue,
      );
    });

    test('message sounds stay silent when notifications are disabled', () {
      for (final String soundType in kNotificationGatedSoundTypes) {
        expect(
          shouldPlaySoundEffect(
            notificationsEnabled: false,
            soundPrefs: const SoundPreferencesState(
              disabledSounds: <String, bool>{
                kSoundTypeSameChannelMessage: false,
              },
            ),
            soundType: soundType,
          ),
          isFalse,
          reason: soundType,
        );
      }
    });

    test('voice sounds ignore the notifications toggle', () {
      const SoundPreferencesState prefs = SoundPreferencesState();
      for (final String soundType in kAllNotificationSoundTypes) {
        if (kNotificationGatedSoundTypes.contains(soundType)) {
          continue;
        }
        expect(
          shouldPlaySoundEffect(
            notificationsEnabled: false,
            soundPrefs: prefs,
            soundType: soundType,
          ),
          isTrue,
          reason: soundType,
        );
      }
    });

    test('stays silent when all sounds are disabled', () {
      const SoundPreferencesState prefs = SoundPreferencesState(
        allSoundsDisabled: true,
      );
      for (final String soundType in kAllNotificationSoundTypes) {
        expect(
          shouldPlaySoundEffect(soundPrefs: prefs, soundType: soundType),
          isFalse,
          reason: soundType,
        );
      }
    });

    test('each sound option follows its own setting', () {
      for (final String soundType in kAllNotificationSoundTypes) {
        final SoundPreferencesState prefs = SoundPreferencesState(
          disabledSounds: <String, bool>{
            soundType: true,
            if (soundType != kSoundTypeSameChannelMessage)
              kSoundTypeSameChannelMessage: false,
          },
        );
        expect(
          shouldPlaySoundEffect(soundPrefs: prefs, soundType: soundType),
          isFalse,
          reason: soundType,
        );
        final String other = kAllNotificationSoundTypes.firstWhere(
          (String type) =>
              type != soundType && type != kSoundTypeSameChannelMessage,
        );
        expect(
          shouldPlaySoundEffect(soundPrefs: prefs, soundType: other),
          isTrue,
          reason: '$soundType should not silence $other',
        );
      }
    });
  });

  test('every sound option maps to its clip', () {
    for (final String soundType in kAllNotificationSoundTypes) {
      final FluxerSfxClip? clip = fluxerSfxClipForSoundType(soundType);
      expect(clip, isNotNull, reason: soundType);
      expect(soundTypeForFluxerSfxClip(clip!), soundType);
    }
  });
}
