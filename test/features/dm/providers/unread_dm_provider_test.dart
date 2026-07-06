import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';

String _snowflakeForUtc(DateTime utc) {
  const epoch = 1420070400000;
  final internal = (utc.millisecondsSinceEpoch - epoch) << 22;
  return internal.toString();
}

void main() {
  test('unread DM provider derives unread channels from read states', () async {
    final db = openTestDatabase();
    await db.dmChannelDao.upsertDmChannels([
      DmChannelsCompanion.insert(
        id: 'dm-1',
        recipientId: 'other',
        unreadCount: const Value(0),
      ),
    ]);
    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value('dm-1'),
        mentionCount: Value(2),
      ),
    );
    final container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);

    final subscription = container.listen(
      unreadDmChannelsProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(subscription.close);

    await pumpEventQueue();
    final state = container.read(unreadDmChannelsProvider);

    expect(state.channels.map((channel) => channel.id), ['dm-1']);
    expect(state.channels.single.unreadCount, 2);
    expect(state.hasUnread('dm-1'), isTrue);
  });

  test(
    'unread DM provider separates unread presence from mention badges',
    () async {
      final db = openTestDatabase();
      final dmId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 2));
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: dmId,
          recipientId: 'other',
          lastMessageId: Value(latestId),
          unreadCount: const Value(0),
        ),
      ]);
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: Value(dmId),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
        ),
      );
      final container = ProviderContainer(
        overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
      );
      addTearDown(container.dispose);

      final subscription = container.listen(
        unreadDmChannelsProvider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(subscription.close);

      await pumpEventQueue();
      final state = container.read(unreadDmChannelsProvider);

      expect(state.channels.map((channel) => channel.id), [dmId]);
      expect(state.channels.single.unreadCount, 0);
      expect(state.hasUnread(dmId), isTrue);
    },
  );

  test(
    'unread DM provider preserves channel order when only data updates',
    () async {
      final db = openTestDatabase();
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-older',
          recipientId: 'other-a',
          lastMessageTime: Value(DateTime.utc(2026)),
          unreadCount: const Value(0),
        ),
        DmChannelsCompanion.insert(
          id: 'dm-newer',
          recipientId: 'other-b',
          lastMessageTime: Value(DateTime.utc(2026, 1, 2)),
          unreadCount: const Value(0),
        ),
      ]);
      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value('dm-older'),
          mentionCount: Value(1),
        ),
      );
      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value('dm-newer'),
          mentionCount: Value(1),
        ),
      );
      final container = ProviderContainer(
        overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
      );
      addTearDown(container.dispose);

      final subscription = container.listen(
        unreadDmChannelsProvider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(subscription.close);

      await pumpEventQueue();
      final initialOrder = container
          .read(unreadDmChannelsProvider)
          .channels
          .map((channel) => channel.id)
          .toList();
      expect(initialOrder, containsAll(['dm-older', 'dm-newer']));

      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value('dm-older'),
          mentionCount: Value(2),
        ),
      );
      await pumpEventQueue();

      final updatedOrder = container
          .read(unreadDmChannelsProvider)
          .channels
          .map((channel) => channel.id)
          .toList();
      expect(updatedOrder, initialOrder);
      expect(
        container
            .read(unreadDmChannelsProvider)
            .channels
            .singleWhere((channel) => channel.id == 'dm-older')
            .unreadCount,
        2,
      );
    },
  );

  test(
    'unread DM provider keeps unread when channel pointer is newer than cache',
    () async {
      final db = openTestDatabase();
      final dmId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final cachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));
      final pointerId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 2));
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: dmId,
          recipientId: 'other',
          lastMessageId: Value(pointerId),
          unreadCount: const Value(0),
        ),
      ]);
      await db.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: cachedId,
          channelId: dmId,
          authorId: 'other',
          content: 'cached',
          timestamp: DateTime.utc(2026, 5, 6, 12, 1),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: Value(dmId),
          lastMessageId: Value(cachedId),
          mentionCount: const Value(0),
        ),
      );
      final container = ProviderContainer(
        overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
      );
      addTearDown(container.dispose);
      final subscription = container.listen(
        unreadDmChannelsProvider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(subscription.close);

      await pumpEventQueue();
      final state = container.read(unreadDmChannelsProvider);
      expect(state.hasUnread(dmId), isTrue);
    },
  );

  test(
    'dmNavbarMembershipToken ignores mention churn, tracks membership',
    () async {
      final db = openTestDatabase();
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-1',
          recipientId: 'other-1',
          unreadCount: const Value(0),
        ),
        DmChannelsCompanion.insert(
          id: 'dm-2',
          recipientId: 'other-2',
          unreadCount: const Value(0),
        ),
      ]);
      final rows = await db.dmChannelDao.getDmChannels();
      final a = rows.firstWhere((row) => row.id == 'dm-1');
      final b = rows.firstWhere((row) => row.id == 'dm-2');

      final base = UnreadDmState(
        channels: [a, b],
        unreadChannelIds: const {'dm-1'},
      );
      final mentionChurn = UnreadDmState(
        channels: [a.copyWith(unreadCount: 9), b],
        unreadChannelIds: const {'dm-1', 'dm-2'},
        pendingRemovalIds: const {'dm-2'},
      );
      final membershipChange = UnreadDmState(channels: [a]);

      expect(
        dmNavbarMembershipToken(base),
        dmNavbarMembershipToken(mentionChurn),
      );
      expect(
        dmNavbarMembershipToken(base),
        isNot(dmNavbarMembershipToken(membershipChange)),
      );
      expect(base.mentionCountFor('dm-1'), a.unreadCount);
      expect(mentionChurn.mentionCountFor('dm-1'), 9);
      expect(base.mentionCountFor('absent'), 0);
    },
  );

  test('guild read-state churn does not re-emit the DM list', () async {
    final db = openTestDatabase();
    await db.dmChannelDao.upsertDmChannels([
      DmChannelsCompanion.insert(
        id: 'dm-1',
        recipientId: 'other',
        unreadCount: const Value(0),
      ),
    ]);
    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value('dm-1'),
        mentionCount: Value(1),
      ),
    );
    final container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);

    var emissions = 0;
    final subscription = container.listen(
      unreadDmChannelsProvider,
      (_, _) => emissions++,
    );
    addTearDown(subscription.close);

    await pumpEventQueue();
    final settledState = container.read(unreadDmChannelsProvider);
    final settledEmissions = emissions;
    expect(settledState.channels.map((channel) => channel.id), ['dm-1']);

    // A read state for a channel that is not a DM (e.g. a guild channel) must
    // not wake the DM reconcile: Drift fires the broad read-state watch, but
    // the DM-relevant subset is unchanged, so the diff gate skips.
    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value('guild-chan-1'),
        mentionCount: Value(5),
      ),
    );
    await pumpEventQueue();

    expect(emissions, settledEmissions);
    expect(
      identical(container.read(unreadDmChannelsProvider), settledState),
      isTrue,
    );
  });
}
