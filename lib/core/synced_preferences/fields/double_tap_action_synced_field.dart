import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/double_tap_action_preferences_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

typedef DoubleTapActionLocalState = DoubleTapActionPreferencesState;

class DoubleTapActionSyncedField
    extends SyncedFieldAdapter<DoubleTapActionLocalState> {
  DoubleTapActionSyncedField(this._ref);

  final Ref _ref;

  static DoubleTapActionPreference fromProtoEnum(pb.DoubleTapAction proto) {
    return switch (proto.value) {
      1 => DoubleTapActionPreference.react,
      2 => DoubleTapActionPreference.edit,
      3 => DoubleTapActionPreference.none,
      _ => DoubleTapActionPreference.unspecified,
    };
  }

  static pb.DoubleTapAction toProtoEnum(DoubleTapActionPreference local) {
    switch (local) {
      case DoubleTapActionPreference.react:
        return pb.DoubleTapAction.DOUBLE_TAP_ACTION_REACT;
      case DoubleTapActionPreference.edit:
        return pb.DoubleTapAction.DOUBLE_TAP_ACTION_EDIT;
      case DoubleTapActionPreference.none:
        return pb.DoubleTapAction.DOUBLE_TAP_ACTION_NONE;
      case DoubleTapActionPreference.unspecified:
        return pb.DoubleTapAction.DOUBLE_TAP_ACTION_UNSPECIFIED;
    }
  }

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.doubleTapAction;

  @override
  int get fieldPushWireType => 0;

  @override
  DoubleTapActionLocalState readLocal() {
    return _ref.read(doubleTapActionPreferencesProvider);
  }

  @override
  Future<void> applyRemote(DoubleTapActionLocalState value) async {
    await _ref
        .read(doubleTapActionPreferencesProvider.notifier)
        .applySynced(value);
  }

  @override
  DoubleTapActionLocalState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasDoubleTapAction()) {
      return null;
    }
    return DoubleTapActionPreferencesState(
      action: fromProtoEnum(message.doubleTapAction),
    );
  }

  @override
  $pb.GeneratedMessage toProtoMessage(DoubleTapActionLocalState local) {
    return pb.SyncedPreferences(doubleTapAction: toProtoEnum(local.action));
  }

  @override
  Uint8List encodePushValueBytes(DoubleTapActionLocalState local) {
    final value = toProtoEnum(local.action).value;
    return Uint8List.fromList(_encodeProtobufVarint(value));
  }

  @override
  bool statesEqual(DoubleTapActionLocalState a, DoubleTapActionLocalState b) {
    return a == b;
  }

  @override
  bool verifyRoundtrip(DoubleTapActionLocalState candidate) {
    if (candidate.action == DoubleTapActionPreference.unspecified) {
      return true;
    }
    final roundtripped = readFromProto(
      pb.SyncedPreferences(doubleTapAction: toProtoEnum(candidate.action)),
    );
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }

  @override
  bool hasLocalData(DoubleTapActionLocalState local) {
    return local.action != DoubleTapActionPreference.unspecified;
  }

  @override
  bool hasRemoteData(DoubleTapActionLocalState remote) {
    return remote.action != DoubleTapActionPreference.unspecified;
  }

  @override
  DoubleTapActionLocalState? clearedRemoteValue() {
    return const DoubleTapActionPreferencesState();
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
