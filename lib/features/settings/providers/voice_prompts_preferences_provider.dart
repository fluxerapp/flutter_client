import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_prompts_preferences_provider.g.dart';

class VoicePromptsPreferencesState {
  const VoicePromptsPreferencesState({
    this.skipHideOwnCameraConfirm = false,
    this.skipHideOwnScreenshareConfirm = false,
  });

  final bool skipHideOwnCameraConfirm;
  final bool skipHideOwnScreenshareConfirm;

  VoicePromptsPreferencesState copyWith({
    bool? skipHideOwnCameraConfirm,
    bool? skipHideOwnScreenshareConfirm,
  }) {
    return VoicePromptsPreferencesState(
      skipHideOwnCameraConfirm:
          skipHideOwnCameraConfirm ?? this.skipHideOwnCameraConfirm,
      skipHideOwnScreenshareConfirm:
          skipHideOwnScreenshareConfirm ?? this.skipHideOwnScreenshareConfirm,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VoicePromptsPreferencesState &&
        other.skipHideOwnCameraConfirm == skipHideOwnCameraConfirm &&
        other.skipHideOwnScreenshareConfirm == skipHideOwnScreenshareConfirm;
  }

  @override
  int get hashCode =>
      Object.hash(skipHideOwnCameraConfirm, skipHideOwnScreenshareConfirm);
}

@Riverpod(keepAlive: true)
class VoicePromptsPreferences extends _$VoicePromptsPreferences {
  @override
  VoicePromptsPreferencesState build() {
    return const VoicePromptsPreferencesState();
  }

  Future<void> applySynced(VoicePromptsPreferencesState value) async {
    state = value;
  }

  Future<void> setSkipHideOwnCameraConfirm({required bool value}) async {
    state = state.copyWith(skipHideOwnCameraConfirm: value);
    ref.markSyncedDirty(SyncedPreferenceField.voicePrompts);
  }

  Future<void> setSkipHideOwnScreenshareConfirm({required bool value}) async {
    state = state.copyWith(skipHideOwnScreenshareConfirm: value);
    ref.markSyncedDirty(SyncedPreferenceField.voicePrompts);
  }
}
