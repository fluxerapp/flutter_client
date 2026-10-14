import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

import '../../../helpers/open_test_database.dart';

const String _guildId = '100000000000000000';
const String _categoryId = '100000000000000001';
const String _channelId = '100000000000000002';
const String _roleId = '100000000000000003';
const String _threadId = '100000000000000004';

String _recentSnowflake() {
  final int ms = DateTime.now()
      .toUtc()
      .subtract(const Duration(hours: 1))
      .millisecondsSinceEpoch;
  return ((ms - kSnowflakeEpochMs) << 22).toString();
}

String _denyEveryoneView() => jsonEncode(<Object?>[
  <String, Object?>{
    'id': _guildId,
    'type': 0,
    'allow': '0',
    'deny': '${Permission.viewChannel.value}',
  },
]);

Future<FluxerDatabase> _seed() async {
  final FluxerDatabase db = openTestDatabase();
  final String lastMessageId = _recentSnowflake();
  await db.guildDao.upsertServer(
    ServersCompanion.insert(
      id: _guildId,
      name: 'Guild',
      ownerId: const Value('owner'),
    ),
  );
  await db.roleDao.upsertRoles(<RolesCompanion>[
    RolesCompanion.insert(
      id: _guildId,
      guildId: _guildId,
      name: '@everyone',
      permissions: Value(Permission.viewChannel.value.toString()),
    ),
    RolesCompanion.insert(
      id: _roleId,
      guildId: _guildId,
      name: 'Member',
      permissions: const Value('0'),
    ),
  ]);
  await db.memberDao.upsertMember(
    MembersCompanion.insert(
      userId: 'me',
      guildId: _guildId,
      joinedAt: Value(DateTime.utc(2026)),
      roleIdsJson: Value(jsonEncode(<String>[_roleId])),
    ),
  );
  await db.channelDao.upsertChannel(
    ChannelsCompanion.insert(
      id: _categoryId,
      guildId: _guildId,
      name: 'category',
      type: const Value(4),
    ),
  );
  await db.channelDao.upsertChannel(
    ChannelsCompanion.insert(
      id: _channelId,
      guildId: _guildId,
      name: 'general',
      type: const Value(0),
      parentId: const Value(_categoryId),
      lastMessageId: Value(lastMessageId),
    ),
  );
  await db.messageDao.upsertMessage(
    MessagesCompanion.insert(
      id: lastMessageId,
      channelId: _channelId,
      authorId: 'other',
      content: 'ping',
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        snowflakeTimestampMs(lastMessageId),
        isUtc: true,
      ),
    ),
  );
  await db.readStateDao.upsertReadState(
    ReadStatesCompanion(
      channelId: const Value(_channelId),
      lastMessageId: Value(snowflakeAtPreviousMillisecond(lastMessageId)),
      mentionCount: const Value(1),
    ),
  );
  return db;
}

Future<void> _waitFor(bool Function() condition, String reason) async {
  for (int i = 0; i < 50; i++) {
    if (condition()) {
      return;
    }
    await Future<void>.delayed(const Duration(milliseconds: 20));
  }
  fail(reason);
}

Future<ProviderContainer> _mentionedContainer(
  FluxerDatabase db, {
  int mentions = 1,
}) async {
  final ProviderContainer container = ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      currentUserIdProvider.overrideWithValue('me'),
    ],
  );
  addTearDown(container.dispose);
  container.read(gatewayReadyProvider.notifier).setReady();
  final ProviderSubscription<Map<String, GuildReadStateEntry>> sub = container
      .listen(guildReadStateProvider, (_, _) {}, fireImmediately: true);
  addTearDown(sub.close);
  await _waitFor(
    () =>
        (container.read(guildReadStateProvider)[_guildId]?.mentionCount ?? 0) ==
        mentions,
    'the seeded mention never showed on the guild',
  );
  return container;
}

Future<void> _expectMentionCleared(ProviderContainer container) async {
  await _waitFor(
    () =>
        (container.read(guildReadStateProvider)[_guildId]?.mentionCount ?? 0) ==
        0,
    'the mention stayed on the guild after access was lost',
  );
  expect(container.read(guildReadStateProvider)[_guildId]?.hasUnread, isFalse);
}

void main() {
  test(
    'a channel overwrite that hides the channel clears its mention',
    () async {
      final FluxerDatabase db = await _seed();
      final ProviderContainer container = await _mentionedContainer(db);

      await db.channelDao.upsertChannel(
        ChannelsCompanion(
          id: const Value(_channelId),
          guildId: const Value(_guildId),
          name: const Value('general'),
          type: const Value(0),
          parentId: const Value(_categoryId),
          permissionOverwritesJson: Value(_denyEveryoneView()),
        ),
      );

      await _expectMentionCleared(container);
    },
  );

  test('hiding the parent channel clears mentions in its threads', () async {
    final FluxerDatabase db = await _seed();
    final String threadMessageId = _recentSnowflake();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: _threadId,
        guildId: _guildId,
        name: 'thread',
        type: const Value(11),
        parentId: const Value(_channelId),
        lastMessageId: Value(threadMessageId),
      ),
    );
    await db.messageDao.upsertMessage(
      MessagesCompanion.insert(
        id: threadMessageId,
        channelId: _threadId,
        authorId: 'other',
        content: 'ping',
        timestamp: DateTime.fromMillisecondsSinceEpoch(
          snowflakeTimestampMs(threadMessageId),
          isUtc: true,
        ),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value(_threadId),
        lastMessageId: Value(snowflakeAtPreviousMillisecond(threadMessageId)),
        mentionCount: const Value(1),
      ),
    );
    final ProviderContainer container = await _mentionedContainer(
      db,
      mentions: 2,
    );

    await db.channelDao.upsertChannel(
      ChannelsCompanion(
        id: const Value(_channelId),
        guildId: const Value(_guildId),
        name: const Value('general'),
        type: const Value(0),
        parentId: const Value(_categoryId),
        permissionOverwritesJson: Value(_denyEveryoneView()),
      ),
    );

    await _expectMentionCleared(container);
  });

  test('losing view on the everyone role clears the mention', () async {
    final FluxerDatabase db = await _seed();
    final ProviderContainer container = await _mentionedContainer(db);

    await db.roleDao.upsertRoles(<RolesCompanion>[
      RolesCompanion.insert(
        id: _guildId,
        guildId: _guildId,
        name: '@everyone',
        permissions: const Value('0'),
      ),
    ]);

    await _expectMentionCleared(container);
  });

  test('losing the role that grants view clears the mention', () async {
    final FluxerDatabase db = await _seed();
    await db.roleDao.upsertRoles(<RolesCompanion>[
      RolesCompanion.insert(
        id: _guildId,
        guildId: _guildId,
        name: '@everyone',
        permissions: const Value('0'),
      ),
      RolesCompanion.insert(
        id: _roleId,
        guildId: _guildId,
        name: 'Member',
        permissions: Value(Permission.viewChannel.value.toString()),
      ),
    ]);
    final ProviderContainer container = await _mentionedContainer(db);

    await db.memberDao.upsertMember(
      MembersCompanion.insert(
        userId: 'me',
        guildId: _guildId,
        joinedAt: Value(DateTime.utc(2026)),
        roleIdsJson: const Value('[]'),
      ),
    );

    await _expectMentionCleared(container);
  });
}
