import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/features/channels/providers/guild_channel_unread_snapshot_provider.dart';
import 'package:fluxer_app/features/channels/providers/read_state_write_batcher_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

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

  UnreadState? snapshot() =>
      container.read(guildChannelUnreadSnapshotProvider)[_channelId];
  GuildReadStateEntry? guild() =>
      container.read(guildReadStateProvider)[_guildId];

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

  test('overlapping recomputes publish every touched channel', () async {
    const String otherId = 'channel-2';
    final String otherLast = _snowflake(ago: const Duration(hours: 4));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: otherId,
        guildId: _guildId,
        name: 'random',
        type: const Value(0),
        lastMessageId: Value(otherLast),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value(otherId),
        lastMessageId: Value(otherLast),
      ),
    );
    await start();
    expect(snapshot()?.mentionCount, 1);
    expect(
      container.read(guildChannelUnreadSnapshotProvider)[otherId]?.hasUnread,
      isFalse,
    );

    final String otherNew = _snowflake(ago: const Duration(minutes: 30));
    batcher.enqueueUnread(
      channelId: _channelId,
      messageId: _snowflake(ago: const Duration(minutes: 40)),
      shouldMention: true,
      isDm: false,
      seedAckCandidate: null,
    );
    container.read(channelLastMessageIndexProvider).applyBatch(<String, String>{
      otherId: otherNew,
    });
    await _settle();

    expect(snapshot()?.mentionCount, 2, reason: 'mentioned channel');
    expect(
      container.read(guildChannelUnreadSnapshotProvider)[otherId]?.hasUnread,
      isTrue,
      reason: 'new message channel',
    );
    expect(guild()?.mentionCount, 2);
  });
}
