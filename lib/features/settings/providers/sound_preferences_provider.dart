import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
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
    this.soundOverrides = const <String, double>{},
  });

  final bool allSoundsDisabled;
  final Map<String, bool> disabledSounds;
  final double masterVolume;
  final Map<String, double> soundOverrides;

  SoundPreferencesState copyWith({
    bool? allSoundsDisabled,
    Map<String, bool>? disabledSounds,
    double? masterVolume,
    Map<String, double>? soundOverrides,
  }) {
    return SoundPreferencesState(
      allSoundsDisabled: allSoundsDisabled ?? this.allSoundsDisabled,
      disabledSounds: disabledSounds ?? this.disabledSounds,
      masterVolume: masterVolume ?? this.masterVolume,
      soundOverrides: soundOverrides ?? this.soundOverrides,
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

  bool hasSoundOverride(String soundType) {
    return soundOverrides.containsKey(soundType);
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

  void _markDirty() {
    ref.markSyncedDirty(SyncedPreferenceField.sound);
  }

  Future<void> setAllSoundsDisabled({required bool value}) async {
    state = state.copyWith(allSoundsDisabled: value);
    _markDirty();
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
    _markDirty();
  }

  Future<void> setMasterVolume(double value) async {
    state = state.copyWith(masterVolume: value);
    _markDirty();
  }

  Future<void> setSoundOverride({
    required String soundType,
    required double value,
  }) async {
    final Map<String, double> next = Map<String, double>.from(
      state.soundOverrides,
    );
    next[soundType] = value;
    state = state.copyWith(soundOverrides: next);
    _markDirty();
  }

  Future<void> clearSoundOverride(String soundType) async {
    if (!state.soundOverrides.containsKey(soundType)) {
      return;
    }
    final Map<String, double> next = Map<String, double>.from(
      state.soundOverrides,
    )..remove(soundType);
    state = state.copyWith(soundOverrides: next);
    _markDirty();
  }

  Future<void> clearAllSoundOverrides() async {
    if (state.soundOverrides.isEmpty) {
      return;
    }
    state = state.copyWith(soundOverrides: const <String, double>{});
    _markDirty();
  }
}
