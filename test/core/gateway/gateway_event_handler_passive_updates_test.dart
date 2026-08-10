import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/channel_last_message_index.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

String _recentSnowflake({Duration ago = const Duration(hours: 1)}) {
  return _snowflakeForUtc(DateTime.now().toUtc().subtract(ago));
}

Future<void> _seedGuildChannel(
  FluxerDatabase db, {
  required String guildId,
  required String channelId,
  required String lastMessageId,
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
  await db.channelDao.upsertChannel(
    ChannelsCompanion.insert(
      id: channelId,
      guildId: guildId,
      name: 'general',
      lastMessageId: Value(lastMessageId),
    ),
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

Future<void> _dispatchPassiveUpdates({
  required FluxerDatabase db,
  required ChannelLastMessageIndex index,
  required String guildId,
  required Map<String, String> channels,
}) {
  return GatewayEventHandler(
    database: db,
    channelLastMessageIndex: index,
  ).handle(PassiveUpdatesEvent(guildId: guildId, channels: channels));
}

void main() {
  group('PASSIVE_UPDATES last message bumps', () {
    test('updates channel rows and the last-message index', () async {
      final db = openTestDatabase();
      addTearDown(db.close);
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      final oldMessageId = _recentSnowflake(ago: const Duration(hours: 2));
      final newMessageId = _recentSnowflake();
      await _seedGuildChannel(
        db,
        guildId: guildId,
        channelId: channelId,
        lastMessageId: oldMessageId,
      );

      final index = ChannelLastMessageIndex();
      await _dispatchPassiveUpdates(
        db: db,
        index: index,
        guildId: guildId,
        channels: {channelId: newMessageId},
      );

      final channel = await db.channelDao.getChannelById(channelId);
      expect(channel?.lastMessageId, newMessageId);
      expect(index.lastMessageIdFor(channelId), newMessageId);
    });

    test('ignores stale or foreign guild channel updates', () async {
      final db = openTestDatabase();
      addTearDown(db.close);
      const guildId = 'guild-1';
      const otherGuildId = 'guild-2';
      const channelId = 'channel-1';
      const otherChannelId = 'channel-2';
      final messageId = _recentSnowflake();
      final newerMessageId = _recentSnowflake(ago: const Duration(minutes: 30));
      final staleMessageId = _recentSnowflake(ago: const Duration(hours: 3));
      await _seedGuildChannel(
        db,
        guildId: guildId,
        channelId: channelId,
        lastMessageId: messageId,
      );
      await _seedGuildChannel(
        db,
        guildId: otherGuildId,
        channelId: otherChannelId,
        lastMessageId: messageId,
      );

      final index = ChannelLastMessageIndex();
      await _dispatchPassiveUpdates(
        db: db,
        index: index,
        guildId: guildId,
        channels: {channelId: staleMessageId, otherChannelId: newerMessageId},
      );

      expect(
        (await db.channelDao.getChannelById(channelId))?.lastMessageId,
        messageId,
      );
      expect(
        (await db.channelDao.getChannelById(otherChannelId))?.lastMessageId,
        messageId,
      );
      expect(index.lastMessageIdFor(channelId), isNull);
      expect(index.lastMessageIdFor(otherChannelId), isNull);
    });

    test('surfaces guild unread badges after passive tail bumps', () async {
      final db = openTestDatabase();
      addTearDown(db.close);
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      final readMessageId = _recentSnowflake(ago: const Duration(hours: 2));
      final newMessageId = _recentSnowflake();
      await _seedGuildChannel(
        db,
        guildId: guildId,
        channelId: channelId,
        lastMessageId: readMessageId,
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value(channelId),
          lastMessageId: Value(readMessageId),
        ),
      );

      final index = ChannelLastMessageIndex();
      final container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          currentUserIdProvider.overrideWithValue('me'),
          channelLastMessageIndexProvider.overrideWithValue(index),
        ],
      );
      addTearDown(container.dispose);
      container.read(gatewayReadyProvider.notifier).setReady();
      final sub = container.listen(
        guildReadStateProvider,
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);
      await _waitFor(() => container.read(guildReadStateReadyProvider));

      expect(
        container.read(guildReadStateProvider)[guildId]?.hasUnread,
        isFalse,
      );

      await _dispatchPassiveUpdates(
        db: db,
        index: index,
        guildId: guildId,
        channels: {channelId: newMessageId},
      );

      await _waitFor(
        () =>
            container.read(guildReadStateProvider)[guildId]?.hasUnread == true,
      );
      expect(
        container.read(guildReadStateProvider)[guildId]?.hasPlainUnread,
        isTrue,
      );
    });
  });
}
