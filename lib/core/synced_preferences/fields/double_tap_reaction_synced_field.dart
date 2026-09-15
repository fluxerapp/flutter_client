import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/double_tap_reaction_preferences_provider.dart';

typedef DoubleTapReactionLocalState = DoubleTapReactionPreferencesState;

class DoubleTapReactionSyncedField
    extends
        ProtoSyncedFieldAdapter<DoubleTapReactionLocalState, pb.ReactionEmoji> {
  DoubleTapReactionSyncedField(this._ref);

  final Ref _ref;

  static DoubleTapReactionLocalState fromProtoSettings(pb.ReactionEmoji proto) {
    final name = proto.name;
    if (name.isEmpty) {
      return DoubleTapReactionPreferencesState.unset;
    }
    final id = proto.hasId() && proto.id.isNotEmpty ? proto.id : null;
    return DoubleTapReactionPreferencesState(name: name, id: id, isSet: true);
  }

  static void writeProtoSettings(
    pb.ReactionEmoji proto,
    DoubleTapReactionLocalState local,
  ) {
    if (!local.isSet) {
      proto.clearName();
      proto.clearId();
      return;
    }
    proto.name = local.name;
    if (local.isCustom) {
      proto.id = local.id!;
    } else {
      proto.clearId();
    }
  }

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.doubleTapReaction;

  @override
  DoubleTapReactionLocalState readLocal() {
    return _ref.read(doubleTapReactionPreferencesProvider);
  }

  @override
  Future<void> applyRemote(DoubleTapReactionLocalState value) async {
    await _ref
        .read(doubleTapReactionPreferencesProvider.notifier)
        .applySynced(value);
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasDoubleTapReaction();

  @override
  pb.ReactionEmoji readSubMessage(pb.SyncedPreferences message) {
    return message.doubleTapReaction;
  }

  @override
  DoubleTapReactionLocalState fromProto(pb.ReactionEmoji proto) {
    return fromProtoSettings(proto);
  }

  @override
  void writeProto(pb.ReactionEmoji proto, DoubleTapReactionLocalState local) {
    writeProtoSettings(proto, local);
  }

  @override
  pb.ReactionEmoji createEmptyProto() => pb.ReactionEmoji();

  @override
  pb.SyncedPreferences wrapProto(pb.ReactionEmoji proto) {
    return pb.SyncedPreferences(doubleTapReaction: proto);
  }

  @override
  bool statesEqual(
    DoubleTapReactionLocalState a,
    DoubleTapReactionLocalState b,
  ) {
    return a == b;
  }

  @override
  bool hasLocalData(DoubleTapReactionLocalState local) => local.isSet;

  @override
  bool hasRemoteData(DoubleTapReactionLocalState remote) => remote.isSet;

  @override
  DoubleTapReactionLocalState? clearedRemoteValue() {
    return DoubleTapReactionPreferencesState.unset;
  }
}
