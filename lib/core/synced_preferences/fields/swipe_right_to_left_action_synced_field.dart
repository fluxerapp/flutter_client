import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/preferences/message_ui_preferences_providers.dart';
import 'package:protobuf/protobuf.dart' as $pb;

typedef SwipeRightToLeftActionLocalState =
    SwipeRightToLeftActionPreferencesState;

class SwipeRightToLeftActionSyncedField
    extends SyncedFieldAdapter<SwipeRightToLeftActionLocalState> {
  SwipeRightToLeftActionSyncedField(this._ref);

  final Ref _ref;

  static SwipeRightToLeftActionPreference fromProtoEnum(pb.SwipeAction proto) {
    return switch (proto.value) {
      1 => SwipeRightToLeftActionPreference.channelDetails,
      2 => SwipeRightToLeftActionPreference.reply,
      _ => SwipeRightToLeftActionPreference.unspecified,
    };
  }

  static pb.SwipeAction toProtoEnum(SwipeRightToLeftActionPreference local) {
    switch (local) {
      case SwipeRightToLeftActionPreference.channelDetails:
        return pb.SwipeAction.SWIPE_ACTION_CHANNEL_DETAILS;
      case SwipeRightToLeftActionPreference.reply:
        return pb.SwipeAction.SWIPE_ACTION_REPLY;
      case SwipeRightToLeftActionPreference.unspecified:
        return pb.SwipeAction.SWIPE_ACTION_UNSPECIFIED;
    }
  }

  @override
  SyncedPreferenceField get field =>
      SyncedPreferenceField.swipeRightToLeftAction;

  @override
  int get fieldPushWireType => 0;

  @override
  SwipeRightToLeftActionLocalState readLocal() {
    return _ref.read(swipeRightToLeftActionPreferencesProvider);
  }

  @override
  Future<void> applyRemote(SwipeRightToLeftActionLocalState value) async {
    await _ref
        .read(swipeRightToLeftActionPreferencesProvider.notifier)
        .applySynced(value);
  }

  @override
  SwipeRightToLeftActionLocalState? readFromProto(
    pb.SyncedPreferences message,
  ) {
    if (!message.hasSwipeRightToLeftAction()) {
      return null;
    }
    return SwipeRightToLeftActionPreferencesState(
      action: fromProtoEnum(message.swipeRightToLeftAction),
    );
  }

  @override
  $pb.GeneratedMessage toProtoMessage(SwipeRightToLeftActionLocalState local) {
    return pb.SyncedPreferences(
      swipeRightToLeftAction: toProtoEnum(local.action),
    );
  }

  @override
  Uint8List encodePushValueBytes(SwipeRightToLeftActionLocalState local) {
    final value = toProtoEnum(local.action).value;
    return Uint8List.fromList(_encodeProtobufVarint(value));
  }

  @override
  bool statesEqual(
    SwipeRightToLeftActionLocalState a,
    SwipeRightToLeftActionLocalState b,
  ) {
    return a == b;
  }

  @override
  bool verifyRoundtrip(SwipeRightToLeftActionLocalState candidate) {
    if (candidate.action == SwipeRightToLeftActionPreference.unspecified) {
      return true;
    }
    final roundtripped = readFromProto(
      pb.SyncedPreferences(
        swipeRightToLeftAction: toProtoEnum(candidate.action),
      ),
    );
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }

  @override
  bool hasLocalData(SwipeRightToLeftActionLocalState local) {
    return local.action != SwipeRightToLeftActionPreference.unspecified;
  }

  @override
  bool hasRemoteData(SwipeRightToLeftActionLocalState remote) {
    return remote.action != SwipeRightToLeftActionPreference.unspecified;
  }

  @override
  SwipeRightToLeftActionLocalState? clearedRemoteValue() {
    return const SwipeRightToLeftActionPreferencesState();
  }
}

List<int> _encodeProtobufVarint(int value) {
  final bytes = <int>[];
  var current = value;
  while (current > 0x7f) {
    bytes.add((current & 0x7f) | 0x80);
    current >>= 7;
  }
  bytes.add(current);
  return bytes;
}
