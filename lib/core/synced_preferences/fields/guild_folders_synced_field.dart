import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

typedef GuildFoldersLocalState = Set<int>;

class GuildFoldersSyncedField
    extends SyncedFieldAdapter<GuildFoldersLocalState> {
  GuildFoldersSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.guildFolders;

  @override
  GuildFoldersLocalState readLocal() {
    return _ref.read(folderExpandedStateProvider);
  }

  @override
  Future<void> applyRemote(GuildFoldersLocalState value) async {
    await _ref.read(folderExpandedStateProvider.notifier).applySynced(value);
  }

  @override
  GuildFoldersLocalState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasGuildFolders()) {
      return null;
    }
    return fromProto(message.guildFolders);
  }

  @override
  $pb.GeneratedMessage toProtoMessage(GuildFoldersLocalState local) {
    return toProto(local);
  }

  @override
  bool statesEqual(GuildFoldersLocalState a, GuildFoldersLocalState b) {
    if (a.length != b.length) {
      return false;
    }
    return a.containsAll(b);
  }

  @override
  GuildFoldersLocalState mergeForMigration({
    required GuildFoldersLocalState local,
    required GuildFoldersLocalState remote,
  }) {
    return {...local, ...remote};
  }

  @override
  bool verifyRoundtrip(GuildFoldersLocalState candidate) {
    final roundtripped = fromProto(toProto(candidate));
    return statesEqual(candidate, roundtripped);
  }

  @override
  bool hasLocalData(GuildFoldersLocalState local) {
    return local.isNotEmpty;
  }

  @override
  bool hasRemoteData(GuildFoldersLocalState remote) {
    /// Empty set is valid remote state when field 105
    /// is present in the wire blob.
    return true;
  }

  @override
  bool hasRemoteAdditions(
    GuildFoldersLocalState local,
    GuildFoldersLocalState remote,
  ) {
    return remote.difference(local).isNotEmpty;
  }

  @override
  bool hasInboundUpdatesWhileProtected(
    GuildFoldersLocalState local,
    GuildFoldersLocalState remote,
  ) {
    if (isRemoteShrink(local: local, remote: remote) ||
        isLocalShrink(local: local, remote: remote)) {
      return false;
    }
    return !statesEqual(local, remote);
  }

  static GuildFoldersLocalState fromProto(pb.GuildFolderExpandedState proto) {
    return proto.expandedFolderIds.map((id) => id.toInt()).toSet();
  }

  static pb.GuildFolderExpandedState toProto(GuildFoldersLocalState local) {
    final sorted = local.toList()..sort();
    return pb.GuildFolderExpandedState(
      expandedFolderIds: [for (final id in sorted) Int64(id)],
    );
  }

  static bool isRemoteShrink({
    required GuildFoldersLocalState local,
    required GuildFoldersLocalState remote,
  }) {
    return remote.length < local.length && local.containsAll(remote);
  }

  static bool isLocalShrink({
    required GuildFoldersLocalState local,
    required GuildFoldersLocalState remote,
  }) {
    return local.length < remote.length && remote.containsAll(local);
  }
}
