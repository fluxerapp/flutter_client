import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/voice_prompts_preferences_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

typedef VoicePromptsLocalState = VoicePromptsPreferencesState;

class VoicePromptsSyncedField
    extends SyncedFieldAdapter<VoicePromptsLocalState> {
  VoicePromptsSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.voicePrompts;

  @override
  VoicePromptsLocalState readLocal() {
    return _ref.read(voicePromptsPreferencesProvider);
  }

  @override
  Future<void> applyRemote(VoicePromptsLocalState value) async {
    await _ref
        .read(voicePromptsPreferencesProvider.notifier)
        .applySynced(value);
  }

  @override
  VoicePromptsLocalState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasVoicePrompts()) {
      return null;
    }
    return VoicePromptsLocalState(
      skipHideOwnCameraConfirm: message.voicePrompts.skipHideOwnCameraConfirm,
      skipHideOwnScreenshareConfirm:
          message.voicePrompts.skipHideOwnScreenshareConfirm,
    );
  }

  @override
  $pb.GeneratedMessage toProtoMessage(VoicePromptsLocalState local) {
    return pb.VoicePromptsState(
      skipHideOwnCameraConfirm: local.skipHideOwnCameraConfirm,
      skipHideOwnScreenshareConfirm: local.skipHideOwnScreenshareConfirm,
    );
  }

  @override
  bool statesEqual(VoicePromptsLocalState a, VoicePromptsLocalState b) {
    return a.skipHideOwnCameraConfirm == b.skipHideOwnCameraConfirm &&
        a.skipHideOwnScreenshareConfirm == b.skipHideOwnScreenshareConfirm;
  }

  @override
  VoicePromptsLocalState mergeForMigration({
    required VoicePromptsLocalState local,
    required VoicePromptsLocalState remote,
  }) {
    return remote;
  }

  @override
  bool verifyRoundtrip(VoicePromptsLocalState candidate) {
    final proto = toProtoMessage(candidate) as pb.VoicePromptsState;
    final roundtripped = readFromProto(
      pb.SyncedPreferences(voicePrompts: proto),
    );
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }
}
