import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/preferences/message_ui_preferences_providers.dart';
import 'package:protobuf/protobuf.dart' as $pb;

const int kLegacyChatInputSaveCameraUploadsFieldNumber = 2;

class SaveCameraUploadsSyncedField
    extends SyncedFieldAdapter<ChatInputPreferencesState> {
  SaveCameraUploadsSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field =>
      SyncedPreferenceField.saveCameraUploadsToDevice;

  @override
  int get fieldPushWireType => 0;

  @override
  ChatInputPreferencesState readLocal() =>
      _ref.read(chatInputPreferencesProvider);

  @override
  Future<void> applyRemote(ChatInputPreferencesState value) =>
      _ref.read(chatInputPreferencesProvider.notifier).applySynced(value);

  @override
  ChatInputPreferencesState? readFromProto(pb.SyncedPreferences message) {
    if (message.hasSaveCameraUploadsToDevice()) {
      return ChatInputPreferencesState(
        saveCameraCapturesToDevice: message.saveCameraUploadsToDevice,
      );
    }
    final List<Int64>? legacy = message.hasChatInput()
        ? message.chatInput.unknownFields
              .getField(kLegacyChatInputSaveCameraUploadsFieldNumber)
              ?.varints
        : null;
    if (legacy != null && legacy.isNotEmpty) {
      return ChatInputPreferencesState(
        saveCameraCapturesToDevice: legacy.last != Int64.ZERO,
      );
    }
    return null;
  }

  @override
  $pb.GeneratedMessage toProtoMessage(ChatInputPreferencesState local) =>
      pb.SyncedPreferences(
        saveCameraUploadsToDevice: local.saveCameraCapturesToDevice,
      );

  @override
  Uint8List encodePushValueBytes(ChatInputPreferencesState local) =>
      Uint8List.fromList([if (local.saveCameraCapturesToDevice) 1 else 0]);

  @override
  bool statesEqual(ChatInputPreferencesState a, ChatInputPreferencesState b) =>
      a == b;

  @override
  bool verifyRoundtrip(ChatInputPreferencesState candidate) {
    final ChatInputPreferencesState? roundtripped = readFromProto(
      toProtoMessage(candidate) as pb.SyncedPreferences,
    );
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }

  @override
  bool hasLocalData(ChatInputPreferencesState local) =>
      !local.saveCameraCapturesToDevice;
}
