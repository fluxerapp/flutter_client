import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  late FluxerDatabase db;
  late ReadStateWriteBatcher batcher;

  setUp(() {
    db = openTestDatabase();
    batcher = ReadStateWriteBatcher(
      database: db,
      window: const Duration(hours: 1),
      mentionWindow: const Duration(hours: 1),
    );
  });

  tearDown(() {
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

    enqueue(channelId, '300', mention: true);
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
    expect(readState?.lastMessageId, isNull);
  });

  test('pending overlay reflects mention increments before flush', () {
    const channelId = 'guild-channel-overlay';
    enqueue(channelId, '200', mention: true, seed: '100');

    final overlay = batcher.effectiveFields(channelId, null);
    expect(overlay.mentionCount, 1);
    expect(batcher.hasPending(channelId), isTrue);
  });

  test('held overlay clears once the flush write lands', () async {
    const channelId = 'guild-channel-reconcile';
    enqueue(channelId, '200', mention: true, seed: '100');
    expect(batcher.effectiveFields(channelId, null).mentionCount, 1);

    await batcher.flush(channelId);
    expect(batcher.overlayChannelIds(), isEmpty);
    expect((await db.readStateDao.getReadState(channelId))?.mentionCount, 1);
  });

  test('a flush that writes nothing leaves no overlay behind', () async {
    const channelId = 'guild-channel-plain';
    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value(channelId),
        lastMessageId: Value('100'),
        mentionCount: Value(1),
      ),
    );
    enqueue(channelId, '200', mention: false);
    await batcher.flush(channelId);
    expect(batcher.overlayChannelIds(), isEmpty);

    const ReadState read = ReadState(
      channelId: channelId,
      lastMessageId: '200',
      mentionCount: 0,
      manual: false,
    );
    final effective = batcher.effectiveFields(channelId, read);
    expect(effective.mentionCount, 0);
    expect(effective.lastMessageId, '200');
  });

  test('an ack flush leaves no overlay over a later mark unread', () async {
    const channelId = 'guild-channel-ack';
    batcher.enqueueAck(
      channelId: channelId,
      messageId: '300',
      clearSticky: true,
    );
    await batcher.flushAck(channelId);
    expect(batcher.overlayChannelIds(), isEmpty);

    const ReadState markedUnread = ReadState(
      channelId: channelId,
      lastMessageId: '200',
      mentionCount: 0,
      manual: true,
    );
    expect(
      batcher.effectiveFields(channelId, markedUnread).lastMessageId,
      '200',
    );
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

  test('unread timer respects minimum interval between flushes', () {
    fakeAsync((FakeAsync async) {
      const String channelId = 'guild-channel-interval';
      final ReadStateWriteBatcher fastBatcher = ReadStateWriteBatcher(
        database: db,
        window: const Duration(milliseconds: 10),
        minIntervalBetweenUnreadFlushes: const Duration(milliseconds: 50),
      );
      addTearDown(fastBatcher.clearAll);

      fastBatcher.enqueueUnread(
        channelId: channelId,
        messageId: '100',
        shouldMention: false,
        isDm: false,
        seedAckCandidate: null,
      );
      async.elapse(const Duration(milliseconds: 10));
      expect(fastBatcher.hasPending(channelId), isFalse);

      fastBatcher.enqueueUnread(
        channelId: channelId,
        messageId: '200',
        shouldMention: false,
        isDm: false,
        seedAckCandidate: null,
      );
      async.elapse(const Duration(milliseconds: 10));
      expect(fastBatcher.hasPending(channelId), isTrue);

      async.elapse(const Duration(milliseconds: 40));
      expect(fastBatcher.hasPending(channelId), isFalse);
    });
  });

  test('a mention flushes on the short window despite the unread interval', () {
    fakeAsync((FakeAsync async) {
      const String channelId = 'guild-channel-mention';
      final ReadStateWriteBatcher mentionBatcher = ReadStateWriteBatcher(
        database: db,
        minIntervalBetweenUnreadFlushes: const Duration(seconds: 5),
      );
      addTearDown(mentionBatcher.clearAll);

      mentionBatcher.enqueueUnread(
        channelId: channelId,
        messageId: '100',
        shouldMention: false,
        isDm: false,
        seedAckCandidate: null,
      );
      async.elapse(const Duration(milliseconds: 10));
      expect(mentionBatcher.hasPending(channelId), isTrue);

      mentionBatcher.enqueueUnread(
        channelId: channelId,
        messageId: '200',
        shouldMention: true,
        isDm: false,
        seedAckCandidate: null,
      );
      async.elapse(const Duration(milliseconds: kReadStateMentionBatchMs));
      expect(mentionBatcher.hasPending(channelId), isFalse);

      mentionBatcher.enqueueUnread(
        channelId: channelId,
        messageId: '300',
        shouldMention: true,
        isDm: false,
        seedAckCandidate: null,
      );
      async.elapse(const Duration(milliseconds: kReadStateMentionBatchMs));
      expect(mentionBatcher.hasPending(channelId), isFalse);
    });
  });

  test('an ack burst does not touch read_states until flushAll', () async {
    const String channelId = 'guild-channel-ack-burst';
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    final _ReadStateSqlCounter counter = _ReadStateSqlCounter();
    final FluxerDatabase counted = FluxerDatabase.forTesting(
      NativeDatabase.memory().interceptWith(counter),
    );
    addTearDown(counted.close);
    final ReadStateWriteBatcher acks = ReadStateWriteBatcher(database: counted);
    addTearDown(acks.clearAll);
    await counted.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value(channelId),
        lastMessageId: Value('100'),
        mentionCount: Value(2),
        manual: Value(false),
        stickyUnreadMessageId: Value('50'),
      ),
    );
    counter
      ..selects = 0
      ..writes = 0;
    await acks.ensureCursor(channelId);
    expect(counter.selects, 1);
    expect(counter.writes, 0);
    counter.selects = 0;

    acks
      ..enqueueAck(channelId: channelId, messageId: '200', clearSticky: false)
      ..enqueueAck(channelId: channelId, messageId: '150', clearSticky: false)
      ..enqueueAck(channelId: channelId, messageId: '300', clearSticky: false);
    expect(counter.selects, 0);
    expect(counter.writes, 0);
    expect(
      (await counted.readStateDao.getReadState(channelId))?.lastMessageId,
      '100',
    );

    await acks.flushAll();
    final ReadState? written = await counted.readStateDao.getReadState(
      channelId,
    );
    expect(written?.lastMessageId, '300');
    expect(written?.mentionCount, 0);
    expect(written?.stickyUnreadMessageId, '50');
    final int writesAfterFlush = counter.writes;
    expect(writesAfterFlush, 1);

    await acks.flushAll();
    expect(counter.writes, writesAfterFlush);
    expect(
      (await counted.readStateDao.getReadState(channelId))?.lastMessageId,
      '300',
    );

    acks.enqueueAck(channelId: channelId, messageId: '250', clearSticky: false);
    await acks.flushAll();
    expect(
      (await counted.readStateDao.getReadState(channelId))?.lastMessageId,
      '300',
    );
  });

  test('badge helpers follow the ack cursor', () async {
    const String channelId = 'guild-channel-badge';
    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value(channelId),
        lastMessageId: Value('100'),
        mentionCount: Value(1),
        manual: Value(false),
      ),
    );
    await batcher.ensureCursor(channelId);
    batcher.enqueueAck(
      channelId: channelId,
      messageId: '200',
      clearSticky: false,
    );
    final effective = batcher.effectiveFields(
      channelId,
      batcher.persistedReadState(channelId),
    );
    final UnreadState guild = unreadStateForAckCursor(
      previous: const UnreadState(
        hasUnread: true,
        hasUnreadMessages: true,
        mentionCount: 1,
      ),
      latestMessageId: '200',
      ackLastMessageId: effective.lastMessageId,
      mentionCount: effective.mentionCount,
      unreadTracked: true,
      fallbackAckMs: 0,
      isGuildChannel: true,
    );
    expect(guild.hasUnread, isFalse);
    expect(guild.mentionCount, 0);
    expect(
      dmUnreadCountFromReadState(
        latestMessageId: '200',
        ackLastMessageId: effective.lastMessageId,
        fallbackAckMs: 0,
        mentionCount: effective.mentionCount,
        cachedUnreadCount: 1,
      ),
      0,
    );
    expect(
      (await db.readStateDao.getReadState(channelId))?.lastMessageId,
      '100',
    );
  });
}

class _ReadStateSqlCounter extends QueryInterceptor {
  int selects = 0;
  int writes = 0;

  void _count(String statement, {required bool write}) {
    if (!statement.contains('read_states')) {
      return;
    }
    if (write) {
      writes += 1;
    } else {
      selects += 1;
    }
  }

  @override
  Future<List<Map<String, Object?>>> runSelect(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    _count(statement, write: false);
    return super.runSelect(executor, statement, args);
  }

  @override
  Future<int> runInsert(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    _count(statement, write: true);
    return super.runInsert(executor, statement, args);
  }

  @override
  Future<int> runUpdate(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    _count(statement, write: true);
    return super.runUpdate(executor, statement, args);
  }

  @override
  Future<void> runBatched(
    QueryExecutor executor,
    BatchedStatements statements,
  ) {
    for (final String statement in statements.statements) {
      _count(statement, write: true);
    }
    return super.runBatched(executor, statements);
  }
}
