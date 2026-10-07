import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/channels.dart';
import 'package:fluxer_app/core/database/tables/thread_members.dart';

part 'thread_dao.g.dart';

const List<int> _threadTypes = <int>[10, 11, 12];
const List<int> _threadOnlyTypes = <int>[15, 16];
const Duration threadArchivedRetention = Duration(days: 7);

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

  Stream<ThreadMember?> watchMember(String threadId) =>
      (select(threadMembers)..where((m) => m.threadId.equals(threadId)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Future<List<ThreadMember>> getMembersForGuild(String guildId) =>
      (select(threadMembers)..where((m) => m.guildId.equals(guildId))).get();

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
  }) => transaction(() async {
    final List<String> unlistedIds = <String>[
      for (final ThreadMember row in await getMembersForGuild(guildId))
        if (!listedIds.contains(row.threadId)) row.threadId,
    ];
    await (delete(threadMembers)..where((m) => m.guildId.equals(guildId))).go();
    final List<String> staleIds = unlistedIds.isEmpty
        ? const <String>[]
        : <String>[
            for (final Channel row
                in await (select(channels)..where(
                      (c) => c.id.isIn(unlistedIds) & c.type.isIn(_threadTypes),
                    ))
                    .get())
              if (row.threadArchived != true) row.id,
          ];
    await _deleteThreadRows(staleIds);
    if (joined.isNotEmpty) {
      await batch((Batch b) {
        for (final ThreadMembersCompanion member in joined) {
          b.insert(threadMembers, member, onConflict: DoUpdate((_) => member));
        }
      });
    }
    return staleIds;
  });

  Future<void> replaceActiveForParents({
    required String guildId,
    required List<String>? parentIds,
    required List<ChannelsCompanion> threads,
    required List<ThreadMembersCompanion> members,
  }) => transaction(() async {
    await pruneActiveThreads(
      guildId: guildId,
      parentIds: parentIds,
      keepIds: <String>{
        for (final ChannelsCompanion thread in threads) thread.id.value,
      },
    );
    await batch((Batch b) {
      for (final ChannelsCompanion thread in threads) {
        b.insert(channels, thread, onConflict: DoUpdate((_) => thread));
      }
      for (final ThreadMembersCompanion member in members) {
        b.insert(threadMembers, member, onConflict: DoUpdate((_) => member));
      }
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
    final Set<String> joined = await getJoinedThreadIds();
    final List<String> dropIds = <String>[
      for (final Channel row in existing)
        if (!keepIds.contains(row.id) &&
            !joined.contains(row.id) &&
            row.threadArchived != true)
          row.id,
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

  Future<List<String>> purgeGuild(String guildId) => transaction(() async {
    final $MessagesTable messages = attachedDatabase.messages;
    await (delete(messages)..where(
          (m) =>
              m.type.equals(18) &
              m.channelId.isInQuery(
                selectOnly(channels)
                  ..addColumns(<Expression<Object>>[channels.id])
                  ..where(channels.guildId.equals(guildId)),
              ),
        ))
        .go();
    final List<String> ids = <String>[
      for (final Channel row in await getThreadsForGuild(guildId)) row.id,
    ];
    await _deleteThreadRows(ids);
    await (delete(threadMembers)..where((m) => m.guildId.equals(guildId))).go();
    final List<String> forumIds = <String>[
      for (final Channel row
          in await (select(channels)..where(
                (c) =>
                    c.guildId.equals(guildId) & c.type.isIn(_threadOnlyTypes),
              ))
              .get())
        row.id,
    ];
    if (forumIds.isNotEmpty) {
      await (delete(channels)..where((c) => c.id.isIn(forumIds))).go();
      await attachedDatabase.readStateDao.markThreadReadStates(forumIds);
    }
    return <String>[...ids, ...forumIds];
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
