import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sound_preferences_provider.g.dart';

const String kSoundTypeMessage = 'message';
const String kSoundTypeDirectMessage = 'direct-message';
const String kSoundTypeSameChannelMessage = 'same-channel-message';

const Set<String> _defaultDisabledSoundTypes = <String>{
  kSoundTypeSameChannelMessage,
};

class SoundPreferencesState {
  const SoundPreferencesState({
    this.allSoundsDisabled = false,
    this.disabledSounds = const <String, bool>{},
    this.masterVolume = 100,
  });

  final bool allSoundsDisabled;
  final Map<String, bool> disabledSounds;
  final double masterVolume;

  SoundPreferencesState copyWith({
    bool? allSoundsDisabled,
    Map<String, bool>? disabledSounds,
    double? masterVolume,
  }) {
    return SoundPreferencesState(
      allSoundsDisabled: allSoundsDisabled ?? this.allSoundsDisabled,
      disabledSounds: disabledSounds ?? this.disabledSounds,
      masterVolume: masterVolume ?? this.masterVolume,
    );
  }

  bool isSoundTypeEnabled(String soundType) {
    if (allSoundsDisabled) {
      return false;
    }
    final bool? configured = disabledSounds[soundType];
    if (configured != null) {
      return !configured;
    }
    return !_defaultDisabledSoundTypes.contains(soundType);
  }
}

@Riverpod(keepAlive: true)
class SoundPreferences extends _$SoundPreferences {
  @override
  SoundPreferencesState build() {
    return const SoundPreferencesState();
  }

  Future<void> applySynced(SoundPreferencesState value) async {
    state = value;
  }

  Future<void> setAllSoundsDisabled({required bool value}) async {
    state = state.copyWith(allSoundsDisabled: value);
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.sound);
  }

  Future<void> setSoundTypeEnabled({
    required String soundType,
    required bool enabled,
  }) async {
    final Map<String, bool> next = Map<String, bool>.from(state.disabledSounds);
    if (enabled) {
      if (_defaultDisabledSoundTypes.contains(soundType)) {
        next[soundType] = false;
      } else {
        next.remove(soundType);
      }
    } else {
      next[soundType] = true;
    }
    state = state.copyWith(disabledSounds: next);
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.sound);
  }
}
