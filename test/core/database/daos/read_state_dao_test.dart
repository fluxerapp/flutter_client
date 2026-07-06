import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import '../../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';

void main() {
  test(
    'setManualUnread writes both stickyUnreadMessageId and manual atomically',
    () async {
      final db = openTestDatabase();

      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value('channel-1'),
          lastMessageId: Value('msg-100'),
        ),
      );

      await db.readStateDao.setManualUnread(
        channelId: 'channel-1',
        stickyMessageId: 'msg-50',
        manual: true,
      );

      final state = await db.readStateDao.getReadState('channel-1');
      expect(state?.stickyUnreadMessageId, 'msg-50');
      expect(state?.manual, isTrue);
    },
  );

  test(
    'clearStickyUnread clears both stickyUnreadMessageId and manual',
    () async {
      final db = openTestDatabase();

      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value('channel-1'),
          stickyUnreadMessageId: Value('msg-50'),
          manual: Value(true),
        ),
      );

      await db.readStateDao.clearStickyUnread('channel-1');

      final state = await db.readStateDao.getReadState('channel-1');
      expect(state?.stickyUnreadMessageId, null);
      expect(state?.manual, isFalse);
    },
  );

  test('incrementMentionCount preserves stickyUnreadMessageId', () async {
    final db = openTestDatabase();

    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value('channel-1'),
        lastMessageId: Value('msg-100'),
        mentionCount: Value(2),
        stickyUnreadMessageId: Value('msg-50'),
        manual: Value(true),
      ),
    );

    await db.readStateDao.incrementMentionCount('channel-1');

    final state = await db.readStateDao.getReadState('channel-1');
    expect(state?.mentionCount, 3);
    expect(state?.stickyUnreadMessageId, 'msg-50');
    expect(state?.manual, isTrue);
    expect(state?.lastMessageId, 'msg-100');
  });

  test('updatePinTimestamp preserves stickyUnreadMessageId', () async {
    final db = openTestDatabase();

    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value('channel-1'),
        lastMessageId: Value('msg-100'),
        stickyUnreadMessageId: Value('msg-50'),
        manual: Value(true),
      ),
    );

    await db.readStateDao.updatePinTimestamp(
      'channel-1',
      '2026-05-15T12:00:00.000Z',
    );

    final state = await db.readStateDao.getReadState('channel-1');
    expect(state?.lastPinTimestamp, '2026-05-15T12:00:00.000Z');
    expect(state?.stickyUnreadMessageId, 'msg-50');
    expect(state?.manual, isTrue);
  });
}
