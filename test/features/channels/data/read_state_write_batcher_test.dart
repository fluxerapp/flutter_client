import 'package:drift/drift.dart' hide isNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  late FluxerDatabase db;
  late ReadStateWriteBatcher batcher;

  setUp(() {
    db = openTestDatabase();
    // A long window keeps the debounce timer from firing on its own; tests
    // flush deterministically with flushAll().
    batcher = ReadStateWriteBatcher(
      database: db,
      window: const Duration(hours: 1),
    );
  });

  tearDown(() async {
    batcher.clearAll();
  });

  void enqueue(
    String channelId,
    String messageId, {
    required bool mention,
    bool isDm = false,
    String? seed,
  }) {
    batcher.enqueueUnread(
      channelId: channelId,
      messageId: messageId,
      shouldMention: mention,
      isDm: isDm,
      seedAckCandidate: seed,
    );
  }

  test('folds repeated mention increments for one channel into a single count '
      '(lost-increment race fix)', () async {
    const channelId = 'guild-channel-1';
    enqueue(channelId, '200', mention: true, seed: '100');
    enqueue(channelId, '300', mention: true, seed: '100');

    await batcher.flushAll();

    final readState = await db.readStateDao.getReadState(channelId);
    expect(readState?.mentionCount, 2);
    // Seeded once from the first never-acked message.
    expect(readState?.lastMessageId, '100');
  });

  test(
    'accumulates only mentioning messages onto the existing count',
    () async {
      const channelId = 'guild-channel-2';
      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value(channelId),
          lastMessageId: Value('100'),
          mentionCount: Value(0),
        ),
      );

      enqueue(channelId, '200', mention: true);
      enqueue(channelId, '300', mention: false);
      enqueue(channelId, '400', mention: true);
      enqueue(channelId, '500', mention: false);
      enqueue(channelId, '600', mention: true);

      await batcher.flushAll();

      final readState = await db.readStateDao.getReadState(channelId);
      expect(readState?.mentionCount, 3);
      // Known channel: no re-seed of the ack baseline.
      expect(readState?.lastMessageId, '100');
    },
  );

  test('skips messages already covered by an advanced ack', () async {
    const channelId = 'guild-channel-3';
    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value(channelId),
        lastMessageId: Value('500'),
        mentionCount: Value(0),
      ),
    );

    // At/below the ack -> covered -> skipped (e.g. an immediate ack advanced the
    // baseline past it while it sat in the window).
    enqueue(channelId, '300', mention: true);
    // Above the ack -> still unread -> counted.
    enqueue(channelId, '700', mention: true);

    await batcher.flushAll();

    final readState = await db.readStateDao.getReadState(channelId);
    expect(readState?.mentionCount, 1);
    expect(readState?.lastMessageId, '500');
  });

  test('folds DM unread increments into a single counter update', () async {
    const channelId = 'dm-1';
    await db.dmChannelDao.upsertDmChannels(const [
      DmChannelsCompanion(
        id: Value(channelId),
        recipientId: Value('user-1'),
        unreadCount: Value(0),
      ),
    ]);

    enqueue(channelId, '200', mention: true, isDm: true);
    enqueue(channelId, '300', mention: true, isDm: true);
    enqueue(channelId, '400', mention: true, isDm: true);

    await batcher.flushAll();

    final dm = await db.dmChannelDao.getDmChannelById(channelId);
    expect(dm?.unreadCount, 3);
    final readState = await db.readStateDao.getReadState(channelId);
    expect(readState?.mentionCount, 3);
    // DMs never seed the ack baseline; unread is tracked via the DM counter.
    expect(readState?.lastMessageId, isNull);
  });

  test('discard drops pending increments without writing', () async {
    const channelId = 'guild-channel-4';
    enqueue(channelId, '200', mention: true, seed: '100');
    expect(batcher.hasPending(channelId), isTrue);

    batcher.discard(channelId);
    expect(batcher.hasPending(channelId), isFalse);

    await batcher.flushAll();

    final readState = await db.readStateDao.getReadState(channelId);
    expect(readState, isNull);
  });
}
