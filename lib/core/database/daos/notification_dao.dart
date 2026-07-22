import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/notification_mention_feed.dart';
import 'package:fluxer_app/core/database/tables/notification_mention_prefs.dart';
import 'package:fluxer_app/core/database/tables/notification_unread_collapsed.dart';

part 'notification_dao.g.dart';

@DriftAccessor(
  tables: [
    NotificationUnreadCollapsed,
    NotificationMentionFeed,
    NotificationMentionPrefs,
  ],
)
class NotificationDao extends DatabaseAccessor<FluxerDatabase>
    with _$NotificationDaoMixin {
  NotificationDao(super.attachedDatabase);

  Stream<List<NotificationUnreadCollapsedData>> watchUnreadCollapsedRows() =>
      select(notificationUnreadCollapsed).watch().suppressDriftCancellation;

  Future<List<NotificationUnreadCollapsedData>> getUnreadCollapsedRows() =>
      select(notificationUnreadCollapsed).get();

  Future<bool?> isChannelCollapsed(String channelId) =>
      (select(notificationUnreadCollapsed)
            ..where((t) => t.channelId.equals(channelId)))
          .getSingleOrNull()
          .then((r) => r?.isCollapsed);

  Future<void> upsertUnreadCollapsed({
    required String channelId,
    required bool isCollapsed,
  }) async {
    await into(notificationUnreadCollapsed).insertOnConflictUpdate(
      NotificationUnreadCollapsedCompanion.insert(
        channelId: channelId,
        isCollapsed: Value(isCollapsed),
      ),
    );
  }

  Future<void> deleteUnreadCollapsed(String channelId) => (delete(
    notificationUnreadCollapsed,
  )..where((t) => t.channelId.equals(channelId))).go();

  Stream<List<NotificationMentionFeedData>> watchMentionFeedOrdered() =>
      (select(notificationMentionFeed)
            ..orderBy([(t) => OrderingTerm.asc(t.ordinal)]))
          .watch()
          .suppressDriftCancellation;

  Future<List<NotificationMentionFeedData>> getMentionFeedOrdered() => (select(
    notificationMentionFeed,
  )..orderBy([(t) => OrderingTerm.asc(t.ordinal)])).get();

  Future<void> replaceMentionFeed(
    List<NotificationMentionFeedCompanion> rows,
  ) => transaction(() async {
    await delete(notificationMentionFeed).go();
    for (final r in rows) {
      await into(notificationMentionFeed).insert(r);
    }
  });

  Future<void> appendMentionRows(
    List<NotificationMentionFeedCompanion> rows,
  ) async {
    for (final r in rows) {
      await into(notificationMentionFeed).insertOnConflictUpdate(r);
    }
  }

  Future<void> prependMentionRow({
    required String messageId,
    required String channelId,
  }) => prependMentionRowsBatch(
    messageIds: <String>[messageId],
    channelIds: <String>[channelId],
  );

  Future<void> prependMentionRowsBatch({
    required List<String> messageIds,
    required List<String> channelIds,
  }) => transaction(() async {
    if (messageIds.isEmpty) {
      return;
    }
    assert(
      messageIds.length == channelIds.length,
      'messageIds and channelIds must have the same length',
    );
    final int shiftBy = messageIds.length;
    final rows = await getMentionFeedOrdered();
    for (final row in rows.reversed) {
      await (update(
        notificationMentionFeed,
      )..where((t) => t.messageId.equals(row.messageId))).write(
        NotificationMentionFeedCompanion(ordinal: Value(row.ordinal + shiftBy)),
      );
    }
    for (var i = 0; i < messageIds.length; i++) {
      await into(notificationMentionFeed).insertOnConflictUpdate(
        NotificationMentionFeedCompanion.insert(
          messageId: messageIds[i],
          channelId: channelIds[i],
          ordinal: i,
        ),
      );
    }
  });

  Future<void> deleteMentionRow(String messageId) => (delete(
    notificationMentionFeed,
  )..where((t) => t.messageId.equals(messageId))).go();

  Future<int?> maxMentionOrdinal() async {
    final q =
        await (select(notificationMentionFeed)
              ..orderBy([(t) => OrderingTerm.desc(t.ordinal)])
              ..limit(1))
            .getSingleOrNull();
    return q?.ordinal;
  }

  Stream<NotificationMentionPref?> watchMentionPrefs() => select(
    notificationMentionPrefs,
  ).watchSingleOrNull().suppressDriftCancellation;

  Future<NotificationMentionPref?> getMentionPrefs() => (select(
    notificationMentionPrefs,
  )..where((t) => t.id.equals(1))).getSingleOrNull();

  Future<void> upsertMentionPrefs({
    required bool includeEveryone,
    required bool includeRoles,
    required bool includeGuilds,
  }) async {
    await into(notificationMentionPrefs).insertOnConflictUpdate(
      NotificationMentionPrefsCompanion.insert(
        id: const Value(1),
        includeEveryone: Value(includeEveryone),
        includeRoles: Value(includeRoles),
        includeGuilds: Value(includeGuilds),
      ),
    );
  }

  Future<void> clearAllUserData() async {
    await delete(notificationUnreadCollapsed).go();
    await delete(notificationMentionFeed).go();
    await upsertMentionPrefs(
      includeEveryone: true,
      includeRoles: true,
      includeGuilds: true,
    );
  }
}
