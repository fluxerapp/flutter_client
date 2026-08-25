import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/voice_prompts_preferences_provider.dart';

typedef VoicePromptsLocalState = VoicePromptsPreferencesState;

class VoicePromptsSyncedField
    extends
        ProtoSyncedFieldAdapter<VoicePromptsLocalState, pb.VoicePromptsState> {
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
  bool hasField(pb.SyncedPreferences message) => message.hasVoicePrompts();

  @override
  pb.VoicePromptsState readSubMessage(pb.SyncedPreferences message) {
    return message.voicePrompts;
  }

  @override
  VoicePromptsLocalState fromProto(pb.VoicePromptsState proto) {
    return VoicePromptsLocalState(
      skipHideOwnCameraConfirm: proto.skipHideOwnCameraConfirm,
      skipHideOwnScreenshareConfirm: proto.skipHideOwnScreenshareConfirm,
    );
  }

  @override
  void writeProto(pb.VoicePromptsState proto, VoicePromptsLocalState local) {
    proto
      ..skipHideOwnCameraConfirm = local.skipHideOwnCameraConfirm
      ..skipHideOwnScreenshareConfirm = local.skipHideOwnScreenshareConfirm;
  }

  @override
  pb.VoicePromptsState createEmptyProto() => pb.VoicePromptsState();

  @override
  pb.SyncedPreferences wrapProto(pb.VoicePromptsState proto) {
    return pb.SyncedPreferences(voicePrompts: proto);
  }

  @override
  bool statesEqual(VoicePromptsLocalState a, VoicePromptsLocalState b) {
    return a == b;
  }
}
