import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/bulk_upsert.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/channels.dart';
import 'package:fluxer_app/core/database/tables/thread_members.dart';

part 'thread_dao.g.dart';

const List<int> _threadTypes = <int>[10, 11, 12];
const Duration threadArchivedRetention = Duration(days: 7);

typedef JoinedThreadsSnapshot = ({
  List<ThreadMembersCompanion> joined,
  Set<String> listedIds,
});

@DriftAccessor(tables: [Channels, ThreadMembers])
class ThreadDao extends DatabaseAccessor<FluxerDatabase> with _$ThreadDaoMixin {
  ThreadDao(super.attachedDatabase);

  Future<List<Channel>> getThreadsForGuild(String guildId) => (select(
    channels,
  )..where((c) => c.guildId.equals(guildId) & c.type.isIn(_threadTypes))).get();

  Future<List<Channel>> getThreadsForParent(String parentId) =>
      (select(channels)..where(
            (c) => c.parentId.equals(parentId) & c.type.isIn(_threadTypes),
          ))
          .get();

  Stream<List<Channel>> watchThreadsForParent(String parentId) =>
      (select(channels)
            ..where(
              (c) => c.parentId.equals(parentId) & c.type.isIn(_threadTypes),
            )
            ..orderBy([(c) => OrderingTerm.desc(c.lastMessageId)]))
          .watch()
          .suppressDriftCancellation;

  Stream<List<Channel>> watchActiveThreadsForGuild(String guildId) =>
      (select(channels)..where(
            (c) =>
                c.guildId.equals(guildId) &
                c.type.isIn(_threadTypes) &
                c.threadArchived.equals(true).not(),
          ))
          .watch()
          .suppressDriftCancellation;

  Future<ThreadMember?> getMember(String threadId) => (select(
    threadMembers,
  )..where((m) => m.threadId.equals(threadId))).getSingleOrNull();

  Future<List<ThreadMember>> getMembersFor(List<String> threadIds) =>
      (select(threadMembers)..where((m) => m.threadId.isIn(threadIds))).get();

  Stream<ThreadMember?> watchMember(String threadId) =>
      (select(threadMembers)..where((m) => m.threadId.equals(threadId)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Stream<Set<String>> watchJoinedThreadIds() => select(threadMembers)
      .watch()
      .map(
        (List<ThreadMember> rows) => <String>{
          for (final ThreadMember row in rows) row.threadId,
        },
      )
      .suppressDriftCancellation;

  Stream<List<ThreadMember>> watchJoinedMembers() =>
      select(threadMembers).watch().suppressDriftCancellation;

  Future<List<ThreadMember>> getJoinedMembers() => select(threadMembers).get();

  Future<Set<String>> getJoinedThreadIds() async => <String>{
    for (final ThreadMember row in await select(threadMembers).get())
      row.threadId,
  };

  Future<void> upsertMember(ThreadMembersCompanion member) =>
      into(threadMembers).insertOnConflictUpdate(member);

  Future<void> deleteMember(String threadId) =>
      (delete(threadMembers)..where((m) => m.threadId.equals(threadId))).go();

  Future<List<String>> reconcileJoined(
    String guildId,
    List<ThreadMembersCompanion> joined, {
    required Set<String> listedIds,
  }) async =>
      (await reconcileJoinedForGuilds(<String, JoinedThreadsSnapshot>{
        guildId: (joined: joined, listedIds: listedIds),
      }))[guildId] ??
      const <String>[];

  Future<Map<String, List<String>>> reconcileJoinedForGuilds(
    Map<String, JoinedThreadsSnapshot> snapshots,
  ) => transaction(() async {
    if (snapshots.isEmpty) {
      return const <String, List<String>>{};
    }
    final List<String> guildIds = snapshots.keys.toList();
    final Map<String, String> unlistedGuildById = <String, String>{
      for (final ThreadMember row in await (select(
        threadMembers,
      )..where((m) => m.guildId.isIn(guildIds))).get())
        if (!(snapshots[row.guildId]?.listedIds.contains(row.threadId) ?? true))
          row.threadId: row.guildId,
    };
    await (delete(threadMembers)..where((m) => m.guildId.isIn(guildIds))).go();
    final Map<String, List<String>> staleByGuild = <String, List<String>>{};
    if (unlistedGuildById.isNotEmpty) {
      for (final Channel row
          in await (select(channels)..where(
                (c) =>
                    c.id.isIn(unlistedGuildById.keys) &
                    c.type.isIn(_threadTypes),
              ))
              .get()) {
        if (row.threadArchived != true) {
          (staleByGuild[unlistedGuildById[row.id]!] ??= <String>[]).add(row.id);
        }
      }
    }
    await _deleteThreadRows(<String>[
      for (final List<String> ids in staleByGuild.values) ...ids,
    ]);
    await batch(
      (Batch b) => batchUpsert(
        b,
        attachedDatabase,
        threadMembers,
        <ThreadMembersCompanion>[
          for (final JoinedThreadsSnapshot snapshot in snapshots.values)
            ...snapshot.joined,
        ],
      ),
    );
    return staleByGuild;
  });

  Future<void> replaceActiveForParents({
    required String guildId,
    required List<String>? parentIds,
    required List<ChannelsCompanion> threads,
    required List<ThreadMembersCompanion> members,
    Set<String> keepIds = const <String>{},
  }) => transaction(() async {
    final Set<String> listedIds = <String>{
      for (final ChannelsCompanion thread in threads) thread.id.value,
    };
    await pruneActiveThreads(
      guildId: guildId,
      parentIds: parentIds,
      keepIds: <String>{...listedIds, ...keepIds},
    );
    final Set<String> memberIds = <String>{
      for (final ThreadMembersCompanion member in members)
        member.threadId.value,
    };
    final List<String> leftIds = <String>[
      for (final String id in listedIds)
        if (!memberIds.contains(id)) id,
    ];
    if (leftIds.isNotEmpty) {
      await (delete(
        threadMembers,
      )..where((m) => m.threadId.isIn(leftIds))).go();
    }
    await batch((Batch b) {
      batchUpsert(b, attachedDatabase, channels, threads);
      batchUpsert(b, attachedDatabase, threadMembers, members);
    });
  });

  Future<void> pruneActiveThreads({
    required String guildId,
    required List<String>? parentIds,
    required Set<String> keepIds,
  }) => transaction(() async {
    final List<Channel> existing = parentIds == null
        ? await getThreadsForGuild(guildId)
        : await (select(channels)..where(
                (c) =>
                    c.guildId.equals(guildId) &
                    c.type.isIn(_threadTypes) &
                    c.parentId.isIn(parentIds),
              ))
              .get();
    final List<String> dropIds = <String>[
      for (final Channel row in existing)
        if (!keepIds.contains(row.id) && row.threadArchived != true) row.id,
    ];
    await _deleteThreadRows(dropIds);
  });

  Future<void> bumpMessageCounters(String threadId, {required int delta}) =>
      customUpdate(
        'UPDATE channels SET '
        'message_count = MAX(COALESCE(message_count, 0) + ?1, 0), '
        'total_message_sent = COALESCE(total_message_sent, 0) + MAX(?1, 0) '
        'WHERE id = ?2',
        variables: <Variable<Object>>[
          Variable<int>(delta),
          Variable<String>(threadId),
        ],
        updates: <TableInfo<Table, dynamic>>{channels},
      );

  Future<void> setMemberCount(String threadId, int memberCount) =>
      (update(channels)..where((c) => c.id.equals(threadId))).write(
        ChannelsCompanion(memberCount: Value(memberCount)),
      );

  Future<List<String>> deleteThreadsForParent(String parentId) =>
      transaction(() async {
        final List<String> ids = <String>[
          for (final Channel row in await getThreadsForParent(parentId)) row.id,
        ];
        await _deleteThreadRows(ids);
        return ids;
      });

  Future<List<String>> pruneArchived({required DateTime now}) =>
      transaction(() async {
        final String cutoff = now
            .subtract(threadArchivedRetention)
            .toUtc()
            .toIso8601String();
        final Set<String> joined = await getJoinedThreadIds();
        final List<String> ids = <String>[
          for (final Channel row
              in await (select(channels)..where(
                    (c) =>
                        c.type.isIn(_threadTypes) &
                        c.threadArchived.equals(true) &
                        c.threadArchiveTimestamp.isSmallerThanValue(cutoff),
                  ))
                  .get())
            if (!joined.contains(row.id)) row.id,
        ];
        await _deleteThreadRows(ids);
        return ids;
      });

  Future<void> _deleteThreadRows(List<String> ids) async {
    if (ids.isEmpty) {
      return;
    }
    await (delete(channels)..where((c) => c.id.isIn(ids))).go();
    await (delete(threadMembers)..where((m) => m.threadId.isIn(ids))).go();
    await attachedDatabase.messageDao.deleteMessagesForChannels(ids);
    await attachedDatabase.readStateDao.markThreadReadStates(ids);
  }

  Future<void> deleteMembersForGuild(String guildId) =>
      (delete(threadMembers)..where((m) => m.guildId.equals(guildId))).go();

  Future<void> clearAll() => delete(threadMembers).go();
}
