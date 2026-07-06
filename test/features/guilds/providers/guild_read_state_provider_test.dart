import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

DateTime _timestampFromSnowflake(String id) {
  return DateTime.fromMillisecondsSinceEpoch(
    snowflakeTimestampMs(id),
    isUtc: true,
  );
}

MessagesCompanion _cachedMessage({
  required String id,
  required String channelId,
}) => MessagesCompanion.insert(
  id: id,
  channelId: channelId,
  authorId: 'other',
  content: 'message $id',
  timestamp: _timestampFromSnowflake(id),
);

String _recentSnowflake({Duration ago = const Duration(hours: 1)}) {
  return _snowflakeForUtc(DateTime.now().toUtc().subtract(ago));
}

Future<void> _seedGuild(
  FluxerDatabase db,
  String guildId, {
  List<({String id, String name, int type, String? lastMessageId})> channels =
      const [],
}) async {
  await db.guildDao.upsertServer(
    ServersCompanion.insert(
      id: guildId,
      name: 'Guild $guildId',
      ownerId: const Value('owner'),
    ),
  );
  await db.memberDao.upsertMember(
    MembersCompanion.insert(
      userId: 'me',
      guildId: guildId,
      joinedAt: Value(DateTime.utc(2026)),
    ),
  );
  for (final c in channels) {
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: c.id,
        guildId: guildId,
        name: c.name,
        type: Value(c.type),
        lastMessageId: Value(c.lastMessageId),
      ),
    );
    if (c.lastMessageId != null) {
      await db.messageDao.upsertMessage(
        _cachedMessage(id: c.lastMessageId!, channelId: c.id),
      );
    }
  }
}

ProviderContainer _container(FluxerDatabase db) {
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      currentUserIdProvider.overrideWithValue('me'),
    ],
  );
}

Future<void> _waitFor(bool Function() condition) async {
  for (var i = 0; i < 50; i++) {
    if (condition()) {
      return;
    }
    await Future<void>.delayed(const Duration(milliseconds: 20));
  }
  fail('condition not met within timeout');
}

Future<void> _waitForGuildState(
  ProviderContainer container,
  String guildId,
) async {
  await _waitFor(() {
    final entry = container.read(guildReadStateProvider)[guildId];
    return entry != null && (entry.hasUnread || entry.mentionCount > 0);
  });
}

void main() {
  test(
    'seeds initial map with hasUnread for channels with new messages',
    () async {
      final db = openTestDatabase();

      final lastMessageId = _recentSnowflake();
      await _seedGuild(
        db,
        'guild-1',
        channels: [
          (
            id: 'channel-1',
            name: 'general',
            type: 0,
            lastMessageId: lastMessageId,
          ),
        ],
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(snowflakeAtPreviousMillisecond(lastMessageId)),
        ),
      );

      final container = _container(db);
      addTearDown(container.dispose);

      container.read(gatewayReadyProvider.notifier).setReady();
      final sub = container.listen(
        guildReadStateProvider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);
      await _waitForGuildState(container, 'guild-1');

      final state = container.read(guildReadStateProvider);
      expect(state['guild-1'], isNotNull);
      expect(state['guild-1']!.hasUnread, isTrue);
      expect(state['guild-1']!.hasPlainUnread, isTrue);
      expect(state['guild-1']!.mentionCount, 0);
    },
  );

  test('incremental update bumps sentinel only for affected guild', () async {
    final db = openTestDatabase();

    final lastA = _recentSnowflake();
    final lastB = _recentSnowflake(ago: const Duration(minutes: 30));
    await _seedGuild(
      db,
      'guild-A',
      channels: [(id: 'c-A1', name: 'a1', type: 0, lastMessageId: lastA)],
    );
    await _seedGuild(
      db,
      'guild-B',
      channels: [(id: 'c-B1', name: 'b1', type: 0, lastMessageId: lastB)],
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('c-A1'),
        lastMessageId: Value(snowflakeAtPreviousMillisecond(lastA)),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('c-B1'),
        lastMessageId: Value(snowflakeAtPreviousMillisecond(lastB)),
      ),
    );

    final container = _container(db);
    addTearDown(container.dispose);
    container.read(gatewayReadyProvider.notifier).setReady();
    final sub = container.listen(
      guildReadStateProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(sub.close);
    await _waitForGuildState(container, 'guild-A');
    await _waitForGuildState(container, 'guild-B');

    final beforeA = container.read(guildReadStateProvider)['guild-A']!;
    final beforeB = container.read(guildReadStateProvider)['guild-B']!;

    await db.readStateDao.incrementMentionCount('c-A1');
    await _waitFor(
      () =>
          (container.read(guildReadStateProvider)['guild-A']?.mentionCount ??
              0) >
          beforeA.mentionCount,
    );

    final afterA = container.read(guildReadStateProvider)['guild-A']!;
    final afterB = container.read(guildReadStateProvider)['guild-B']!;

    expect(afterA.mentionCount, beforeA.mentionCount + 1);
    expect(afterA.sentinel, greaterThan(beforeA.sentinel));
    expect(identical(afterB, beforeB), isTrue);
  });

  test('voice channels contribute plain unread like text channels', () async {
    final db = openTestDatabase();

    final lastVoice = _recentSnowflake();
    await _seedGuild(
      db,
      'guild-1',
      channels: [
        (id: 'voice-1', name: 'voice', type: 2, lastMessageId: lastVoice),
      ],
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('voice-1'),
        lastMessageId: Value(snowflakeAtPreviousMillisecond(lastVoice)),
      ),
    );

    final container = _container(db);
    addTearDown(container.dispose);
    container.read(gatewayReadyProvider.notifier).setReady();
    final sub = container.listen(
      guildReadStateProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(sub.close);
    await _waitForGuildState(container, 'guild-1');

    final entry = container.read(guildReadStateProvider)['guild-1'];
    expect(entry?.hasUnread, isTrue);
    expect(entry?.hasPlainUnread, isTrue);
    expect(entry?.mentionCount, 0);
  });

  test('category channels do not contribute to guild unread', () async {
    final db = openTestDatabase();

    final lastMessageId = _recentSnowflake();
    await _seedGuild(
      db,
      'guild-1',
      channels: [
        (
          id: 'category-1',
          name: 'category',
          type: 4,
          lastMessageId: lastMessageId,
        ),
      ],
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('category-1'),
        lastMessageId: Value(snowflakeAtPreviousMillisecond(lastMessageId)),
      ),
    );

    final container = _container(db);
    addTearDown(container.dispose);
    container.read(gatewayReadyProvider.notifier).setReady();
    final sub = container.listen(
      guildReadStateProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(sub.close);
    await _waitFor(
      () => container.read(guildReadStateProvider)['guild-1'] != null,
    );

    final entry = container.read(guildReadStateProvider)['guild-1'];
    expect(entry?.hasUnread ?? false, isFalse);
    expect(entry?.hasPlainUnread ?? false, isFalse);
    expect(entry?.mentionCount ?? 0, 0);
  });

  test('recomputes guild unread when a newer cached message arrives', () async {
    final db = openTestDatabase();

    final readMessageId = _recentSnowflake();
    final newerMessageId = _recentSnowflake(ago: const Duration(minutes: 30));
    await db.guildDao.upsertServer(
      ServersCompanion.insert(
        id: 'guild-1',
        name: 'Guild guild-1',
        ownerId: const Value('owner'),
      ),
    );
    await db.memberDao.upsertMember(
      MembersCompanion.insert(
        userId: 'me',
        guildId: 'guild-1',
        joinedAt: Value(DateTime.utc(2026)),
      ),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        type: const Value(0),
      ),
    );
    await db.channelDao.setLastMessageId('channel-1', readMessageId);
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(readMessageId),
      ),
    );

    final container = _container(db);
    addTearDown(container.dispose);
    container.read(gatewayReadyProvider.notifier).setReady();
    final sub = container.listen(
      guildReadStateProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(sub.close);
    await _waitFor(
      () => container.read(guildReadStateProvider)['guild-1'] != null,
    );

    expect(
      container.read(guildReadStateProvider)['guild-1']?.hasUnread ?? true,
      isFalse,
    );

    await db.messageDao.upsertMessage(
      _cachedMessage(id: newerMessageId, channelId: 'channel-1'),
    );
    await db.channelDao.setLastMessageId('channel-1', newerMessageId);
    await _waitForGuildState(container, 'guild-1');

    final after = container.read(guildReadStateProvider)['guild-1']!;
    expect(after.hasUnread, isTrue);
    expect(after.hasPlainUnread, isTrue);
  });

  test(
    'shows unread for orphaned channel pointer via read state fallback',
    () async {
      final db = openTestDatabase();

      final lastMessageId = _recentSnowflake();
      final ackId = snowflakeAtPreviousMillisecond(lastMessageId);
      await db.guildDao.upsertServer(
        ServersCompanion.insert(
          id: 'guild-1',
          name: 'Guild guild-1',
          ownerId: const Value('owner'),
        ),
      );
      await db.memberDao.upsertMember(
        MembersCompanion.insert(
          userId: 'me',
          guildId: 'guild-1',
          joinedAt: Value(DateTime.utc(2026)),
        ),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          type: const Value(0),
        ),
      );
      await db.channelDao.setLastMessageId('channel-1', lastMessageId);
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
        ),
      );

      final container = _container(db);
      addTearDown(container.dispose);
      container.read(gatewayReadyProvider.notifier).setReady();
      final sub = container.listen(
        guildReadStateProvider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);
      await _waitForGuildState(container, 'guild-1');

      final entry = container.read(guildReadStateProvider)['guild-1'];
      expect(entry?.hasUnread, isTrue);
      expect(entry?.hasPlainUnread, isTrue);
    },
  );

  test(
    'guildReadStateReadyProvider is false until initial seed completes',
    () async {
      final db = openTestDatabase();

      final lastMessageId = _recentSnowflake();
      await _seedGuild(
        db,
        'guild-1',
        channels: [
          (
            id: 'channel-1',
            name: 'general',
            type: 0,
            lastMessageId: lastMessageId,
          ),
        ],
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(snowflakeAtPreviousMillisecond(lastMessageId)),
        ),
      );

      final container = _container(db);
      addTearDown(container.dispose);

      expect(container.read(guildReadStateReadyProvider), isFalse);

      container.read(gatewayReadyProvider.notifier).setReady();
      final sub = container.listen(
        guildReadStateProvider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);
      await _waitForGuildState(container, 'guild-1');

      expect(container.read(guildReadStateReadyProvider), isTrue);
    },
  );

  test(
    'initial seed publishes unread once without stream-driven pre-seed recompute',
    () async {
      final db = openTestDatabase();

      final lastMessageId = _recentSnowflake();
      await _seedGuild(
        db,
        'guild-1',
        channels: [
          (
            id: 'channel-1',
            name: 'general',
            type: 0,
            lastMessageId: lastMessageId,
          ),
        ],
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(snowflakeAtPreviousMillisecond(lastMessageId)),
        ),
      );

      final container = _container(db);
      addTearDown(container.dispose);

      final unreadSnapshots = <bool?>[];
      container.listen(guildReadStateProvider, (previous, next) {
        unreadSnapshots.add(next['guild-1']?.hasUnread);
      }, fireImmediately: true);

      container.read(gatewayReadyProvider.notifier).setReady();
      await _waitFor(() => container.read(guildReadStateReadyProvider));

      expect(
        unreadSnapshots.where((hasUnread) => hasUnread ?? false).length,
        1,
      );
      expect(
        container.read(guildReadStateProvider)['guild-1']?.hasUnread,
        isTrue,
      );
    },
  );

  test('settings stream update after seed keeps stable unread state', () async {
    final db = openTestDatabase();

    final lastMessageId = _recentSnowflake();
    await _seedGuild(
      db,
      'guild-1',
      channels: [
        (
          id: 'channel-1',
          name: 'general',
          type: 0,
          lastMessageId: lastMessageId,
        ),
      ],
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(snowflakeAtPreviousMillisecond(lastMessageId)),
      ),
    );

    final container = _container(db);
    addTearDown(container.dispose);
    container.read(gatewayReadyProvider.notifier).setReady();
    final sub = container.listen(
      guildReadStateProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(sub.close);
    await _waitForGuildState(container, 'guild-1');

    expect(
      container.read(guildReadStateProvider)['guild-1']?.hasUnread,
      isTrue,
    );

    await db.userGuildSettingsDao.upsert(
      UserGuildSettingsTableCompanion.insert(
        guildId: 'guild-1',
        data: '{"message_notifications":0}',
      ),
    );
    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(
      container.read(guildReadStateProvider)['guild-1']?.hasUnread,
      isTrue,
    );
  });

  test('buffers read state updates emitted during initial seed', () async {
    final db = openTestDatabase();
    final ackId = _recentSnowflake(ago: const Duration(hours: 2));
    final latestId = _recentSnowflake();
    await _seedGuild(
      db,
      'guild-1',
      channels: [
        (id: 'channel-1', name: 'general', type: 0, lastMessageId: latestId),
      ],
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(latestId),
      ),
    );

    final container = _container(db);
    addTearDown(container.dispose);
    container.listen(guildReadStateProvider, (_, _) {}, fireImmediately: true);

    container.read(gatewayReadyProvider.notifier).setReady();
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
      ),
    );
    await _waitForGuildState(container, 'guild-1');

    final entry = container.read(guildReadStateProvider)['guild-1'];
    expect(entry?.hasUnread, isTrue);
    expect(entry?.hasPlainUnread, isTrue);
  });

  test(
    'incremental recompute converges to full recompute across channels',
    () async {
      final last1 = _recentSnowflake();
      final last2 = _recentSnowflake(ago: const Duration(minutes: 50));
      final last3 = _recentSnowflake(ago: const Duration(minutes: 40));
      final channels = [
        (id: 'c1', name: 'c1', type: 0, lastMessageId: last1),
        (id: 'c2', name: 'c2', type: 0, lastMessageId: last2),
        (id: 'c3', name: 'c3', type: 0, lastMessageId: last3),
      ];

      Future<void> seedReadStates(
        FluxerDatabase db, {
        required int c2Mentions,
      }) async {
        await db.readStateDao.upsertReadState(
          ReadStatesCompanion(
            channelId: const Value('c1'),
            lastMessageId: Value(snowflakeAtPreviousMillisecond(last1)),
          ),
        );
        await db.readStateDao.upsertReadState(
          ReadStatesCompanion(
            channelId: const Value('c2'),
            lastMessageId: Value(last2),
            mentionCount: Value(c2Mentions),
          ),
        );
        await db.readStateDao.upsertReadState(
          ReadStatesCompanion(
            channelId: const Value('c3'),
            lastMessageId: Value(snowflakeAtPreviousMillisecond(last3)),
            mentionCount: const Value(2),
          ),
        );
      }

      final db2 = openTestDatabase();
      await _seedGuild(db2, 'g', channels: channels);
      await seedReadStates(db2, c2Mentions: 1);
      final container2 = _container(db2);
      container2.read(gatewayReadyProvider.notifier).setReady();
      final sub2 = container2.listen(
        guildReadStateProvider,
        (_, _) {},
        fireImmediately: true,
      );
      await _waitForGuildState(container2, 'g');
      final full = container2.read(guildReadStateProvider)['g']!;
      sub2.close();
      container2.dispose();
      await db2.close();

      final db1 = openTestDatabase();
      await _seedGuild(db1, 'g', channels: channels);
      await seedReadStates(db1, c2Mentions: 0);
      final container1 = _container(db1);
      addTearDown(container1.dispose);
      container1.read(gatewayReadyProvider.notifier).setReady();
      final sub1 = container1.listen(
        guildReadStateProvider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub1.close);
      await _waitForGuildState(container1, 'g');
      final before = container1.read(guildReadStateProvider)['g']!;

      await db1.readStateDao.incrementMentionCount('c2');
      await _waitFor(
        () =>
            (container1.read(guildReadStateProvider)['g']?.mentionCount ?? 0) ==
            full.mentionCount,
      );
      final incremental = container1.read(guildReadStateProvider)['g']!;

      expect(incremental.mentionCount, greaterThan(before.mentionCount));
      expect(incremental.hasUnread, full.hasUnread);
      expect(incremental.hasPlainUnread, full.hasPlainUnread);
      expect(incremental.mentionCount, full.mentionCount);
      expect(incremental.unreadChannelId, full.unreadChannelId);
      expect(incremental.mentionChannels, full.mentionChannels);
    },
  );

  test('a message edit leaves guild unread untouched', () async {
    final db = openTestDatabase();

    final lastId = _recentSnowflake();
    await _seedGuild(
      db,
      'guild-1',
      channels: [
        (id: 'channel-1', name: 'general', type: 0, lastMessageId: lastId),
      ],
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(snowflakeAtPreviousMillisecond(lastId)),
      ),
    );

    final container = _container(db);
    addTearDown(container.dispose);
    container.read(gatewayReadyProvider.notifier).setReady();
    final sub = container.listen(
      guildReadStateProvider,
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(sub.close);
    await _waitForGuildState(container, 'guild-1');
    final before = container.read(guildReadStateProvider)['guild-1']!;

    // Message-only edit: channel.lastMessageId is unchanged, so no recompute fires.
    await db.messageDao.upsertMessage(
      _cachedMessage(id: lastId, channelId: 'channel-1'),
    );
    await Future<void>.delayed(const Duration(milliseconds: 100));

    final after = container.read(guildReadStateProvider)['guild-1']!;
    expect(after.sentinel, before.sentinel);
    expect(after.hasUnread, before.hasUnread);
  });

  test(
    'resume re-seed keeps a channel read after the ack lands during recovery',
    () async {
      final db = openTestDatabase();

      final lastMessageId = _recentSnowflake();
      await _seedGuild(
        db,
        'guild-1',
        channels: [
          (
            id: 'channel-1',
            name: 'general',
            type: 0,
            lastMessageId: lastMessageId,
          ),
        ],
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(snowflakeAtPreviousMillisecond(lastMessageId)),
        ),
      );

      final container = _container(db);
      addTearDown(container.dispose);
      container.read(gatewayReadyProvider.notifier).setReady();
      final sub = container.listen(
        guildReadStateProvider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);
      await _waitForGuildState(container, 'guild-1');
      expect(
        container.read(guildReadStateProvider)['guild-1']!.hasUnread,
        isTrue,
      );

      // A recovery bump alone must not re-mark the channel unread.
      container.read(gatewaySessionRecoveryProvider.notifier).bump();
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(lastMessageId),
        ),
      );

      await _waitFor(
        () =>
            container.read(guildReadStateProvider)['guild-1']?.hasUnread ==
            false,
      );
      expect(
        container.read(guildReadStateProvider)['guild-1']!.hasUnread,
        isFalse,
      );
    },
  );

  test(
    'recovery bump does not reseed unread, but DB writes still update',
    () async {
      final db = openTestDatabase();

      final lastMessageId = _recentSnowflake();
      await _seedGuild(
        db,
        'guild-1',
        channels: [
          (
            id: 'channel-1',
            name: 'general',
            type: 0,
            lastMessageId: lastMessageId,
          ),
        ],
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(lastMessageId),
        ),
      );

      final container = _container(db);
      addTearDown(container.dispose);
      container.read(gatewayReadyProvider.notifier).setReady();
      final sub = container.listen(
        guildReadStateProvider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await _waitFor(
        () => container.read(guildReadStateProvider)['guild-1'] != null,
      );
      expect(
        container.read(guildReadStateProvider)['guild-1']!.hasUnread,
        isFalse,
      );

      // A bare recovery bump must not reseed the guild into an unread state.
      container.read(gatewaySessionRecoveryProvider.notifier).bump();
      await Future<void>.delayed(const Duration(milliseconds: 80));
      expect(
        container.read(guildReadStateProvider)['guild-1']!.hasUnread,
        isFalse,
      );

      // A real channel write still flows through the reactive watcher.
      final newerMessageId = _recentSnowflake(ago: Duration.zero);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          type: const Value(0),
          lastMessageId: Value(newerMessageId),
        ),
      );
      await db.messageDao.upsertMessage(
        _cachedMessage(id: newerMessageId, channelId: 'channel-1'),
      );

      await _waitFor(
        () =>
            container.read(guildReadStateProvider)['guild-1']?.hasUnread ??
            false,
      );
      expect(
        container.read(guildReadStateProvider)['guild-1']!.hasUnread,
        isTrue,
      );
    },
  );
}
