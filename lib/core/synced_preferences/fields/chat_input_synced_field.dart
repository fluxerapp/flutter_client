import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/chat_input_preferences_provider.dart';

typedef ChatInputLocalState = ChatInputPreferencesState;

class ChatInputSyncedField
    extends ProtoSyncedFieldAdapter<ChatInputLocalState, pb.ChatInputSettings> {
  ChatInputSyncedField(this._ref);

  final Ref _ref;

  static ChatInputLocalState fromProtoSettings(pb.ChatInputSettings proto) {
    return ChatInputLocalState(
      saveCameraCapturesToDevice:
          !proto.hasSaveCameraCapturesToDevice() ||
          proto.saveCameraCapturesToDevice,
    );
  }

  static void writeProtoSettings(
    pb.ChatInputSettings proto,
    ChatInputLocalState local,
  ) {
    if (local.saveCameraCapturesToDevice) {
      proto.clearSaveCameraCapturesToDevice();
    } else {
      proto.saveCameraCapturesToDevice = false;
    }
  }

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.chatInput;

  @override
  ChatInputLocalState readLocal() {
    return _ref.read(chatInputPreferencesProvider);
  }

  @override
  Future<void> applyRemote(ChatInputLocalState value) async {
    await _ref.read(chatInputPreferencesProvider.notifier).applySynced(value);
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasChatInput();

  @override
  pb.ChatInputSettings readSubMessage(pb.SyncedPreferences message) {
    return message.chatInput;
  }

  @override
  ChatInputLocalState fromProto(pb.ChatInputSettings proto) {
    return fromProtoSettings(proto);
  }

  @override
  void writeProto(pb.ChatInputSettings proto, ChatInputLocalState local) {
    writeProtoSettings(proto, local);
  }

  @override
  pb.ChatInputSettings createEmptyProto() => pb.ChatInputSettings();

  @override
  pb.SyncedPreferences wrapProto(pb.ChatInputSettings proto) {
    return pb.SyncedPreferences(chatInput: proto);
  }

  @override
  bool statesEqual(ChatInputLocalState a, ChatInputLocalState b) {
    return a == b;
  }
}
