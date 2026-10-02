import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';

const Set<String> kNotificationGatedSoundTypes = <String>{
  kSoundTypeMessage,
  kSoundTypeDirectMessage,
  kSoundTypeSameChannelMessage,
};

bool shouldPlaySoundEffect({
  required SoundPreferencesState soundPrefs,
  required String soundType,
  bool notificationsEnabled = true,
}) {
  if (kNotificationGatedSoundTypes.contains(soundType) &&
      !notificationsEnabled) {
    return false;
  }
  return soundPrefs.isSoundTypeEnabled(soundType);
}
