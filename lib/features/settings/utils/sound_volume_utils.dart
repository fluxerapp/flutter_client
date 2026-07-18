import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';

const double kDefaultSfxBaseVolume = 0.4;
const double kDefaultMasterVolumePercent = 100;

double effectiveSoundVolumePercent({
  required SoundPreferencesState prefs,
  required String soundType,
}) {
  return prefs.soundOverrides[soundType] ?? prefs.masterVolume;
}

double computeEffectiveSfxVolume({
  required SoundPreferencesState prefs,
  required String soundType,
  double baseVolume = kDefaultSfxBaseVolume,
}) {
  final double volumePercent = effectiveSoundVolumePercent(
    prefs: prefs,
    soundType: soundType,
  );
  return baseVolume * volumePercent / kDefaultMasterVolumePercent;
}
