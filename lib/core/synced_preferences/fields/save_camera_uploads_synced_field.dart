import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/chat_input_preferences_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

const int kSaveCameraUploadsToDeviceFieldNumber = 113;

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
    final List<Int64>? varints = message.unknownFields
        .getField(kSaveCameraUploadsToDeviceFieldNumber)
        ?.varints;
    if (varints != null && varints.isNotEmpty) {
      return ChatInputPreferencesState(
        saveCameraCapturesToDevice: varints.last != Int64.ZERO,
      );
    }
    if (message.hasChatInput() &&
        message.chatInput.hasSaveCameraCapturesToDevice()) {
      return ChatInputPreferencesState(
        saveCameraCapturesToDevice:
            message.chatInput.saveCameraCapturesToDevice,
      );
    }
    return null;
  }

  @override
  $pb.GeneratedMessage toProtoMessage(ChatInputPreferencesState local) =>
      pb.SyncedPreferences()
        ..unknownFields.mergeVarintField(
          kSaveCameraUploadsToDeviceFieldNumber,
          local.saveCameraCapturesToDevice ? Int64.ONE : Int64.ZERO,
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
