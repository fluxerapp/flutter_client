import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/channels.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';

part 'channel_dao.g.dart';

const List<int> _threadTypes = <int>[10, 11, 12];

@DriftAccessor(tables: [Channels])
class ChannelDao extends DatabaseAccessor<FluxerDatabase>
    with _$ChannelDaoMixin {
  ChannelDao(super.attachedDatabase);

  Stream<List<Channel>> watchChannels(
    String guildId, {
    bool includeThreads = false,
  }) =>
      (select(channels)
            ..where(
              (c) =>
                  c.guildId.equals(guildId) & _threadFilter(c, includeThreads),
            )
            ..orderBy([(c) => OrderingTerm.asc(c.position)]))
          .watch()
          .suppressDriftCancellation;

  Stream<List<Channel>> watchAllChannels({bool includeThreads = false}) =>
      (select(channels)..where((c) => _threadFilter(c, includeThreads)))
          .watch()
          .suppressDriftCancellation;

  Stream<List<Channel>> watchChannelsByIds(Iterable<String> ids) =>
      (select(channels)
            ..where((c) => c.id.isIn(ids))
            ..orderBy([(c) => OrderingTerm.asc(c.id)]))
          .watch()
          .suppressDriftCancellation;

  Future<List<Channel>> getAllChannels({bool includeThreads = false}) =>
      (select(channels)..where((c) => _threadFilter(c, includeThreads))).get();

  Future<List<Channel>> getChannels(
    String guildId, {
    bool includeThreads = false,
  }) =>
      (select(channels)
            ..where(
              (c) =>
                  c.guildId.equals(guildId) & _threadFilter(c, includeThreads),
            )
            ..orderBy([(c) => OrderingTerm.asc(c.position)]))
          .get();

  Expression<bool> _threadFilter($ChannelsTable c, bool includeThreads) =>
      includeThreads ? const Constant(true) : c.type.isNotIn(_threadTypes);

  Future<Channel?> getChannelById(String id) =>
      (select(channels)..where((c) => c.id.equals(id))).getSingleOrNull();

  Future<List<Channel>> getChannelsByIds(List<String> ids) =>
      (select(channels)..where((c) => c.id.isIn(ids))).get();

  Future<List<String?>> getPermissionOverwriteLayers(String channelId) async {
    final Channel? row = await getChannelById(channelId);
    if (row == null) {
      return const <String?>[];
    }
    if (!_threadTypes.contains(row.type)) {
      return <String?>[row.permissionOverwritesJson];
    }
    final String? parentId = row.parentId;
    final Channel? parent = parentId == null
        ? null
        : await getChannelById(parentId);
    return <String?>[parent?.permissionOverwritesJson];
  }

  Stream<Channel?> watchChannelById(String id) =>
      (select(channels)..where((c) => c.id.equals(id)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Future<void> upsertChannel(ChannelsCompanion channel) async {
    final channelId = channel.id.value;
    var channelToWrite = channel;
    if (channel.lastMessageId.present) {
      final merged = await mergeLastMessageIdForUpsert(
        channelId,
        channel.lastMessageId.value,
      );
      channelToWrite = channel.copyWith(lastMessageId: Value(merged));
    }
    await into(channels).insertOnConflictUpdate(channelToWrite);
  }

  Future<void> upsertChannels(List<ChannelsCompanion> channelList) async {
    await batch((b) {
      for (final channel in channelList) {
        b.insert(channels, channel, onConflict: DoUpdate((_) => channel));
      }
    });
  }

  Future<void> upsertChannelsMerged(
    List<ChannelsCompanion> channelList, {
    bool authoritativeTails = false,
  }) async {
    if (channelList.isEmpty) {
      return;
    }

    final Map<String, String?> existingLastById = <String, String?>{};
    final bool needsExisting =
        !authoritativeTails &&
        channelList.any(
          (ChannelsCompanion channel) => channel.lastMessageId.present,
        );
    if (needsExisting) {
      for (final Channel row in await select(channels).get()) {
        existingLastById[row.id] = row.lastMessageId;
      }
    }

    final List<ChannelsCompanion> merged = <ChannelsCompanion>[];
    for (final ChannelsCompanion channel in channelList) {
      if (!channel.lastMessageId.present) {
        merged.add(channel);
        continue;
      }
      final String id = channel.id.value;
      final String? incoming = channel.lastMessageId.value;
      final String? folded;
      if (authoritativeTails) {
        folded = incoming;
      } else {
        folded = mergeLastMessageIdValues(
          existing: existingLastById[id],
          incomingLastMessageId: incoming,
        );
      }
      existingLastById[id] = folded;
      merged.add(channel.copyWith(lastMessageId: Value(folded)));
    }

    await batch((b) {
      for (final ChannelsCompanion channel in merged) {
        b.insert(channels, channel, onConflict: DoUpdate((_) => channel));
      }
    });
  }

  Future<void> updateLastMessageId(String channelId, String messageId) =>
      setLastMessageId(channelId, messageId);

  Future<void> setLastMessageId(String channelId, String? messageId) =>
      (update(channels)..where((c) => c.id.equals(channelId))).write(
        ChannelsCompanion(lastMessageId: Value(messageId)),
      );

  Future<void> advanceLastMessageIdSilently(
    String channelId,
    String messageId,
  ) => customUpdate(
    'UPDATE channels SET last_message_id = ?1 WHERE id = ?2 AND '
    '(last_message_id IS NULL OR '
    'CAST(last_message_id AS INTEGER) <= CAST(?1 AS INTEGER))',
    variables: <Variable<Object>>[
      Variable<String>(messageId),
      Variable<String>(channelId),
    ],
  );

  Future<String?> mergeLastMessageIdForUpsert(
    String channelId,
    String? incomingLastMessageId,
  ) async {
    final String? existing = (await getChannelById(channelId))?.lastMessageId;
    return mergeLastMessageIdValues(
      existing: existing,
      incomingLastMessageId: incomingLastMessageId,
    );
  }

  String? mergeLastMessageIdValues({
    required String? existing,
    required String? incomingLastMessageId,
  }) {
    if (incomingLastMessageId == null || incomingLastMessageId.isEmpty) {
      return existing;
    }
    if (existing == null || existing.isEmpty) {
      return incomingLastMessageId;
    }
    return compareSnowflakeIds(incomingLastMessageId, existing) >= 0
        ? incomingLastMessageId
        : existing;
  }

  Future<void> updateLastPinTimestamp(String channelId, String? timestamp) =>
      (update(channels)..where((c) => c.id.equals(channelId))).write(
        ChannelsCompanion(lastPinTimestamp: Value(timestamp)),
      );

  Future<void> deleteChannel(String id) =>
      (delete(channels)..where((c) => c.id.equals(id))).go();

  Future<List<String>> deleteGuildChannelsNotIn(
    Map<String, Set<String>> keepIdsByGuildId,
  ) async {
    if (keepIdsByGuildId.isEmpty) {
      return const <String>[];
    }
    final List<String> staleIds = <String>[
      for (final Channel row
          in await (select(channels)..where(
                (c) =>
                    c.guildId.isIn(keepIdsByGuildId.keys) &
                    c.type.isNotIn(_threadTypes),
              ))
              .get())
        if (!(keepIdsByGuildId[row.guildId]?.contains(row.id) ?? true)) row.id,
    ];
    if (staleIds.isNotEmpty) {
      await (delete(channels)..where((c) => c.id.isIn(staleIds))).go();
    }
    return staleIds;
  }

  Future<void> removeRoleOverwrites(String guildId, String roleId) async {
    final List<Channel> rows =
        await (select(channels)..where(
              (c) =>
                  c.guildId.equals(guildId) &
                  c.permissionOverwritesJson.contains(jsonEncode(roleId)),
            ))
            .get();
    for (final Channel row in rows) {
      final Object? decoded = jsonDecode(row.permissionOverwritesJson ?? '[]');
      if (decoded is! List) {
        continue;
      }
      final List<Object?> kept = <Object?>[
        for (final Object? overwrite in decoded)
          if (overwrite is! Map ||
              overwrite['id'] != roleId ||
              overwrite['type'] != 0)
            overwrite,
      ];
      if (kept.length == decoded.length) {
        continue;
      }
      await (update(channels)..where((c) => c.id.equals(row.id))).write(
        ChannelsCompanion(
          permissionOverwritesJson: Value<String?>(
            kept.isEmpty ? null : jsonEncode(kept),
          ),
        ),
      );
    }
  }

  Future<void> deleteChannelsForGuild(String guildId) =>
      (delete(channels)..where((c) => c.guildId.equals(guildId))).go();

  Future<void> clearAll() => delete(channels).go();
}
