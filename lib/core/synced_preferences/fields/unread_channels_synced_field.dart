import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:protobuf/protobuf.dart' as $pb;

class UnreadChannelsLocalState {
  const UnreadChannelsLocalState({required this.collapsedChannelIds});

  final List<String> collapsedChannelIds;
}

class UnreadChannelsSyncedField
    extends SyncedFieldAdapter<UnreadChannelsLocalState> {
  UnreadChannelsSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.unreadChannels;

  @override
  UnreadChannelsLocalState readLocal() {
    throw UnsupportedError('Use readLocalValue for unread channels');
  }

  @override
  Future<UnreadChannelsLocalState> readLocalValue() async {
    final dao = _ref.read(fluxerDatabaseProvider).notificationDao;
    final rows = await dao.getUnreadCollapsedRows();
    final collapsed = <String>[];
    for (final row in rows) {
      if (row.isCollapsed) {
        collapsed.add(row.channelId);
      }
    }
    collapsed.sort();
    return UnreadChannelsLocalState(collapsedChannelIds: collapsed);
  }

  @override
  Future<void> applyRemote(UnreadChannelsLocalState value) async {
    final dao = _ref.read(fluxerDatabaseProvider).notificationDao;
    final rows = await dao.getUnreadCollapsedRows();
    final remoteIds = value.collapsedChannelIds.toSet();
    for (final row in rows) {
      final shouldCollapse = remoteIds.contains(row.channelId);
      if (row.isCollapsed != shouldCollapse) {
        await dao.upsertUnreadCollapsed(
          channelId: row.channelId,
          isCollapsed: shouldCollapse,
        );
      }
      remoteIds.remove(row.channelId);
    }
    for (final channelId in remoteIds) {
      await dao.upsertUnreadCollapsed(channelId: channelId, isCollapsed: true);
    }
  }

  @override
  UnreadChannelsLocalState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasUnreadChannels()) {
      return null;
    }
    final ids = message.unreadChannels.collapsedChannelIds.toList()..sort();
    return UnreadChannelsLocalState(collapsedChannelIds: ids);
  }

  @override
  $pb.GeneratedMessage toProtoMessage(UnreadChannelsLocalState local) {
    return pb.UnreadChannelsState(
      collapsedChannelIds: local.collapsedChannelIds,
    );
  }

  @override
  bool statesEqual(UnreadChannelsLocalState a, UnreadChannelsLocalState b) {
    if (a.collapsedChannelIds.length != b.collapsedChannelIds.length) {
      return false;
    }
    for (var i = 0; i < a.collapsedChannelIds.length; i++) {
      if (a.collapsedChannelIds[i] != b.collapsedChannelIds[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  UnreadChannelsLocalState mergeForMigration({
    required UnreadChannelsLocalState local,
    required UnreadChannelsLocalState remote,
  }) {
    final merged = {
      ...local.collapsedChannelIds,
      ...remote.collapsedChannelIds,
    }.toList()..sort();
    return UnreadChannelsLocalState(collapsedChannelIds: merged);
  }

  @override
  bool verifyRoundtrip(UnreadChannelsLocalState candidate) {
    final proto = toProtoMessage(candidate) as pb.UnreadChannelsState;
    final roundtripped = readFromProto(
      pb.SyncedPreferences(unreadChannels: proto),
    );
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }

  @override
  bool hasRemoteAdditions(
    UnreadChannelsLocalState local,
    UnreadChannelsLocalState remote,
  ) {
    final localIds = local.collapsedChannelIds.toSet();
    final remoteIds = remote.collapsedChannelIds.toSet();
    return remoteIds.difference(localIds).isNotEmpty;
  }
}
