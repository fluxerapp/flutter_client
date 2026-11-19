import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/notification_mention_feed.dart';
import 'package:fluxer_app/core/database/tables/notification_unread_collapsed.dart';

part 'notification_dao.g.dart';

@DriftAccessor(tables: [NotificationUnreadCollapsed, NotificationMentionFeed])
class NotificationDao extends DatabaseAccessor<FluxerDatabase>
    with _$NotificationDaoMixin {
  NotificationDao(super.attachedDatabase);

  Stream<List<NotificationUnreadCollapsedData>> watchUnreadCollapsedRows() =>
      select(notificationUnreadCollapsed).watch().suppressDriftCancellation;

  Future<List<NotificationUnreadCollapsedData>> getUnreadCollapsedRows() =>
      select(notificationUnreadCollapsed).get();

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
    if (rows.isNotEmpty) {
      await batch((Batch b) => b.insertAll(notificationMentionFeed, rows));
    }
  });

  Future<void> appendMentionRows(
    List<NotificationMentionFeedCompanion> rows,
  ) async {
    if (rows.isEmpty) {
      return;
    }
    await batch(
      (Batch b) => b.insertAllOnConflictUpdate(notificationMentionFeed, rows),
    );
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
    await customUpdate(
      'UPDATE notification_mention_feed SET ordinal = ordinal + ?',
      variables: <Variable<Object>>[Variable<int>(messageIds.length)],
      updates: <TableInfo<Table, dynamic>>{notificationMentionFeed},
      updateKind: UpdateKind.update,
    );
    await batch(
      (Batch b) => b.insertAllOnConflictUpdate(
        notificationMentionFeed,
        <NotificationMentionFeedCompanion>[
          for (var i = 0; i < messageIds.length; i++)
            NotificationMentionFeedCompanion.insert(
              messageId: messageIds[i],
              channelId: channelIds[i],
              ordinal: i,
            ),
        ],
      ),
    );
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

  Future<void> clearMentionFeed() => delete(notificationMentionFeed).go();

  Future<void> clearAllUserData() async {
    await delete(notificationUnreadCollapsed).go();
    await clearMentionFeed();
  }
}
