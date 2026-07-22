import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/read_states.dart';

part 'read_state_dao.g.dart';

@DriftAccessor(tables: [ReadStates])
class ReadStateDao extends DatabaseAccessor<FluxerDatabase>
    with _$ReadStateDaoMixin {
  ReadStateDao(super.attachedDatabase);

  Future<ReadState?> getReadState(String channelId) => (select(
    readStates,
  )..where((r) => r.channelId.equals(channelId))).getSingleOrNull();

  Future<List<ReadState>> getReadStates() => select(readStates).get();

  Stream<List<ReadState>> watchReadStates() =>
      select(readStates).watch().suppressDriftCancellation;

  Stream<ReadState?> watchReadState(String channelId) =>
      (select(readStates)..where((r) => r.channelId.equals(channelId)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Future<void> upsertReadState(ReadStatesCompanion state) =>
      into(readStates).insertOnConflictUpdate(state);

  Future<void> upsertReadStates(List<ReadStatesCompanion> states) async {
    if (states.isEmpty) {
      return;
    }
    await batch((Batch b) {
      for (final ReadStatesCompanion state in states) {
        b.insert(readStates, state, onConflict: DoUpdate((_) => state));
      }
    });
  }

  Future<void> incrementMentionCount(String channelId) => transaction(() async {
    final existing = await getReadState(channelId);
    await upsertReadState(
      ReadStatesCompanion(
        channelId: Value(channelId),
        lastMessageId: Value(existing?.lastMessageId),
        mentionCount: Value((existing?.mentionCount ?? 0) + 1),
        lastPinTimestamp: Value(existing?.lastPinTimestamp),
        manual: Value(existing?.manual ?? false),
        stickyUnreadMessageId: Value(existing?.stickyUnreadMessageId),
      ),
    );
  });

  Future<void> updatePinTimestamp(String channelId, String? timestamp) =>
      transaction(() async {
        final existing = await getReadState(channelId);
        await upsertReadState(
          ReadStatesCompanion(
            channelId: Value(channelId),
            lastMessageId: Value(existing?.lastMessageId),
            mentionCount: Value(existing?.mentionCount ?? 0),
            lastPinTimestamp: Value(timestamp),
            manual: Value(existing?.manual ?? false),
            stickyUnreadMessageId: Value(existing?.stickyUnreadMessageId),
          ),
        );
      });

  Future<void> setManual(String channelId, {required bool manual}) =>
      setManualUnread(
        channelId: channelId,
        stickyMessageId: null,
        manual: manual,
      );

  Future<void> setManualUnread({
    required String channelId,
    required String? stickyMessageId,
    required bool manual,
  }) => (update(readStates)..where((r) => r.channelId.equals(channelId))).write(
    ReadStatesCompanion(
      manual: Value(manual),
      stickyUnreadMessageId: Value(stickyMessageId),
    ),
  );

  Future<void> clearStickyUnread(String channelId) =>
      (update(readStates)..where((r) => r.channelId.equals(channelId))).write(
        const ReadStatesCompanion(
          manual: Value(false),
          stickyUnreadMessageId: Value(null),
        ),
      );

  Future<void> deleteReadState(String channelId) =>
      (delete(readStates)..where((r) => r.channelId.equals(channelId))).go();

  Future<void> deleteReadStatesForChannels(List<String> channelIds) {
    if (channelIds.isEmpty) {
      return Future.value();
    }
    return (delete(
      readStates,
    )..where((r) => r.channelId.isIn(channelIds))).go();
  }

  Stream<List<ReadState>> watchReadStatesForChannels(List<String> channelIds) =>
      (select(readStates)..where((r) => r.channelId.isIn(channelIds)))
          .watch()
          .suppressDriftCancellation;

  Future<void> clearAll() => delete(readStates).go();
}
