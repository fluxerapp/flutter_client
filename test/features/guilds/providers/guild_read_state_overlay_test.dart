import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/features/channels/providers/guild_channel_unread_snapshot_provider.dart';
import 'package:fluxer_app/features/channels/providers/read_state_write_batcher_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

const String _guildId = 'guild-1';
const String _channelId = 'channel-1';

String _snowflake({required Duration ago}) {
  final int ms = DateTime.now().toUtc().subtract(ago).millisecondsSinceEpoch;
  return ((ms - kSnowflakeEpochMs) << 22).toString();
}

MessagesCompanion _message(String id) => MessagesCompanion.insert(
  id: id,
  channelId: _channelId,
  authorId: 'other',
  content: 'message $id',
  timestamp: DateTime.fromMillisecondsSinceEpoch(
    (BigInt.parse(id) >> 22).toInt() + kSnowflakeEpochMs,
    isUtc: true,
  ),
);

Future<void> _seedChannel(FluxerDatabase db, String lastMessageId) async {
  await db.guildDao.upsertServer(
    ServersCompanion.insert(
      id: _guildId,
      name: 'Guild',
      ownerId: const Value('owner'),
    ),
  );
  await db.memberDao.upsertMember(
    MembersCompanion.insert(
      userId: 'me',
      guildId: _guildId,
      joinedAt: Value(DateTime.utc(2026)),
    ),
  );
  await db.channelDao.upsertChannel(
    ChannelsCompanion.insert(
      id: _channelId,
      guildId: _guildId,
      name: 'general',
      type: const Value(0),
      lastMessageId: Value(lastMessageId),
    ),
  );
  await db.messageDao.upsertMessage(_message(lastMessageId));
}

Future<void> _advanceChannel(FluxerDatabase db, String messageId) async {
  await db.messageDao.upsertMessage(_message(messageId));
  await db.channelDao.updateLastMessageId(_channelId, messageId);
}

Future<void> _waitFor(bool Function() condition, {String? reason}) async {
  for (var i = 0; i < 100; i++) {
    if (condition()) {
      return;
    }
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }
  fail('condition not met: ${reason ?? ''}');
}

Future<void> _settle() =>
    Future<void>.delayed(const Duration(milliseconds: 200));

void main() {
  late FluxerDatabase db;
  late ProviderContainer container;
  late ReadStateWriteBatcher batcher;
  late String ackedId;
  late String mentionId;

  UnreadState? fold() =>
      container.read(guildChannelUnreadFoldProvider)[_channelId];
  GuildReadStateEntry? guild() =>
      container.read(guildReadStateProvider)[_guildId];

  Future<UnreadState?> streamState() async {
    final sub = container.listen(channelUnreadProvider(_channelId), (_, _) {});
    addTearDown(sub.close);
    await _settle();
    return container.read(channelUnreadProvider(_channelId)).value;
  }

  Future<void> start() async {
    container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(db),
        currentUserIdProvider.overrideWithValue('me'),
        readStateWriteBatcherProvider.overrideWith(
          (Ref ref) => ReadStateWriteBatcher(
            database: db,
            window: const Duration(hours: 1),
            ackWindow: const Duration(hours: 1),
            mentionWindow: const Duration(hours: 1),
            onOverlayChanged: () =>
                ref.read(readStateOverlayVersionProvider.notifier).bump(),
          ),
        ),
      ],
    );
    addTearDown(container.dispose);
    batcher = container.read(readStateWriteBatcherProvider);
    container.read(gatewayReadyProvider.notifier).setReady();
    final sub = container.listen(
      guildReadStateProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(sub.close);
    await _waitFor(() => container.read(guildReadStateReadyProvider));
  }

  setUp(() async {
    db = openTestDatabase();
    ackedId = _snowflake(ago: const Duration(hours: 3));
    mentionId = _snowflake(ago: const Duration(hours: 2));
    await _seedChannel(db, mentionId);
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(ackedId),
        mentionCount: const Value(1),
      ),
    );
  });

  test(
    'reading a mentioned channel clears it after plain chatter was flushed',
    () async {
      await start();
      expect(fold()?.mentionCount, 1);

      final String chatterId = _snowflake(ago: const Duration(hours: 1));
      await _advanceChannel(db, chatterId);
      batcher.enqueueUnread(
        channelId: _channelId,
        messageId: chatterId,
        shouldMention: false,
        isDm: false,
        seedAckCandidate: null,
      );
      await batcher.flush(_channelId);
      await _settle();
      expect(fold()?.mentionCount, 1);

      await ReadStateRepository(
        FluxerClient(Dio()),
        db,
      ).applyLocalAckUpTo(_channelId, chatterId);
      await _settle();

      final persisted = await db.readStateDao.getReadState(_channelId);
      expect(persisted?.mentionCount, 0);
      expect(persisted?.lastMessageId, chatterId);
      expect(fold()?.mentionCount, 0, reason: 'fold mention');
      expect(fold()?.hasUnread, isFalse, reason: 'fold unread');
      expect(guild()?.mentionCount, 0, reason: 'guild mention');
      expect(guild()?.hasUnread, isFalse, reason: 'guild unread');
      final UnreadState? stream = await streamState();
      expect(stream?.mentionCount, 0, reason: 'stream mention');
      expect(stream?.hasUnread, isFalse, reason: 'stream unread');
    },
  );

  test('a read from another session clears a flushed mention', () async {
    await start();
    final String chatterId = _snowflake(ago: const Duration(hours: 1));
    await _advanceChannel(db, chatterId);
    batcher.enqueueUnread(
      channelId: _channelId,
      messageId: chatterId,
      shouldMention: false,
      isDm: false,
      seedAckCandidate: null,
    );
    await batcher.flush(_channelId);
    await _settle();

    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(chatterId),
        mentionCount: const Value(0),
        version: const Value('5'),
      ),
    );
    await _settle();

    expect(fold()?.mentionCount, 0);
    expect(fold()?.hasUnread, isFalse);
  });

  test('mark unread shows after an own-message ack landed twice', () async {
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(mentionId),
        mentionCount: const Value(0),
      ),
    );
    await start();
    expect(fold()?.hasUnread, isFalse);

    final String ownId = _snowflake(ago: const Duration(hours: 1));
    await _advanceChannel(db, ownId);
    await ReadStateRepository(
      FluxerClient(Dio()),
      db,
    ).applyLocalAckUpTo(_channelId, ownId);
    await _settle();
    batcher.enqueueAck(
      channelId: _channelId,
      messageId: ownId,
      isDm: false,
      clearSticky: true,
      markDmRead: false,
    );
    await batcher.flushAck(_channelId);
    await _settle();
    expect(fold()?.hasUnread, isFalse);

    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(mentionId),
        mentionCount: const Value(0),
        manual: const Value(true),
      ),
    );
    await _settle();

    expect(fold()?.hasUnread, isTrue, reason: 'fold unread');
    final UnreadState? stream = await streamState();
    expect(stream?.hasUnread, isTrue, reason: 'stream unread');
  });

  test('a READY that drops pending overlays recomputes the fold', () async {
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(mentionId),
        mentionCount: const Value(0),
      ),
    );
    await start();
    final String pingId = _snowflake(ago: const Duration(hours: 1));
    batcher.enqueueUnread(
      channelId: _channelId,
      messageId: pingId,
      shouldMention: true,
      isDm: false,
      seedAckCandidate: null,
    );
    await _waitFor(() => (fold()?.mentionCount ?? 0) == 1);
    expect(await db.readStateDao.getReadState(_channelId), isNotNull);
    expect((await db.readStateDao.getReadState(_channelId))?.mentionCount, 0);

    batcher.clearAll();
    await _settle();

    expect(fold()?.mentionCount, 0);
  });
}
