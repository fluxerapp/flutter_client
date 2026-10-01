import 'dart:convert';

import 'package:drift/drift.dart'
    show ApplyInterceptor, QueryExecutor, QueryInterceptor, Value;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/gateway.dart' show PassiveUpdatesEvent;

import '../../../helpers/open_test_database.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

UserSettingsViewState _testUserSettings({required String userId}) {
  return UserSettingsViewState(
    userId: userId,
    username: 'user',
    displayName: 'user',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: const <String>[],
  );
}

class _FixedUserSettingsViewModel extends UserSettingsViewModel {
  _FixedUserSettingsViewModel(this._userId);

  final String _userId;

  @override
  UserSettingsViewState build() => _testUserSettings(userId: _userId);
}

class _FixedGuildListViewModel extends GuildListViewModel {
  _FixedGuildListViewModel(this._guilds);

  final List<Guild> _guilds;

  @override
  GuildListViewState build() => GuildListViewState(guilds: _guilds);
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

class _SelectLog extends QueryInterceptor {
  final List<(String, List<Object?>)> completed = <(String, List<Object?>)>[];

  @override
  Future<List<Map<String, Object?>>> runSelect(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) async {
    final List<Map<String, Object?>> rows = await executor.runSelect(
      statement,
      args,
    );
    completed.add((statement, args));
    return rows;
  }

  int channelReads(String channelId) => completed
      .where(
        ((String, List<Object?>) e) =>
            e.$1.contains('FROM "channels"') && e.$2.contains(channelId),
      )
      .length;

  int lastMessageReads(String channelId) => completed
      .where(
        ((String, List<Object?>) e) =>
            e.$1.contains('FROM "messages"') &&
            e.$1.contains('LIMIT 1') &&
            e.$2.contains(channelId),
      )
      .length;
}

Future<void> _waitForQuiet(_SelectLog log) async {
  var last = -1;
  var stablePolls = 0;
  for (var i = 0; i < 100; i++) {
    if (log.completed.length == last) {
      stablePolls += 1;
      if (stablePolls == 3) {
        return;
      }
    } else {
      stablePolls = 0;
      last = log.completed.length;
    }
    await Future<void>.delayed(const Duration(milliseconds: 20));
  }
  fail('database never went quiet');
}

MessagesCompanion _messageRow(String id, String channelId) {
  return MessagesCompanion.insert(
    id: id,
    channelId: channelId,
    authorId: 'other',
    content: 'message $id',
    timestamp: DateTime.fromMillisecondsSinceEpoch(
      snowflakeTimestampMs(id),
      isUtc: true,
    ),
  );
}

Future<
  ({
    FluxerDatabase db,
    _SelectLog log,
    ProviderContainer container,
    List<int> notificationsA,
  })
>
_watchTwoChannels() async {
  final _SelectLog log = _SelectLog();
  final FluxerDatabase db = FluxerDatabase.forTesting(
    NativeDatabase.memory().interceptWith(log),
  );
  addTearDown(db.close);
  const guildId = 'guild-1';
  const userId = 'me';
  for (final (String channelId, int hour) in <(String, int)>[
    ('channel-a', 10),
    ('channel-b', 11),
  ]) {
    final String newest = _snowflakeForUtc(DateTime.utc(2026, 5, 6, hour));
    await _seedUnreadChannel(
      db: db,
      guildId: guildId,
      channelId: channelId,
      userId: userId,
      lastMessageId: newest,
      ackId: newest,
    );
    await db.messageDao.upsertMessage(_messageRow(newest, channelId));
  }
  final container = _container(db: db, userId: userId, guildId: guildId);
  addTearDown(container.dispose);
  container.read(gatewayReadyProvider.notifier).setReady();
  final List<int> notificationsA = <int>[0];
  final subA = container.listen(
    channelUnreadProvider('channel-a'),
    (_, _) => notificationsA[0] += 1,
    fireImmediately: true,
  );
  final subB = container.listen(
    channelUnreadProvider('channel-b'),
    (_, _) {},
    fireImmediately: true,
  );
  addTearDown(subA.close);
  addTearDown(subB.close);
  await _waitFor(
    () =>
        container.read(channelUnreadProvider('channel-a')).hasValue &&
        container.read(channelUnreadProvider('channel-b')).hasValue,
  );
  await _waitForQuiet(log);
  return (
    db: db,
    log: log,
    container: container,
    notificationsA: notificationsA,
  );
}

Future<void> _seedUnreadChannel({
  required FluxerDatabase db,
  required String guildId,
  required String channelId,
  required String userId,
  required String lastMessageId,
  required String ackId,
  bool includeMember = true,
  List<String> memberRoleIds = const ['role-view'],
}) async {
  await db.guildDao.upsertServer(
    ServersCompanion.insert(
      id: guildId,
      name: 'Guild',
      ownerId: const Value('owner'),
    ),
  );
  await db.roleDao.upsertRoles([
    RolesCompanion.insert(
      id: guildId,
      guildId: guildId,
      name: '@everyone',
      permissions: const Value('0'),
    ),
    RolesCompanion.insert(
      id: 'role-view',
      guildId: guildId,
      name: 'Viewers',
      permissions: Value(Permission.viewChannel.value.toString()),
    ),
  ]);
  await db.channelDao.upsertChannel(
    ChannelsCompanion.insert(id: channelId, guildId: guildId, name: 'general'),
  );
  await db.channelDao.setLastMessageId(channelId, lastMessageId);
  await db.readStateDao.upsertReadState(
    ReadStatesCompanion(
      channelId: Value(channelId),
      lastMessageId: Value(ackId),
    ),
  );
  if (includeMember) {
    await db.memberDao.upsertMember(
      MembersCompanion.insert(
        userId: userId,
        guildId: guildId,
        roleIdsJson: Value(jsonEncode(memberRoleIds)),
        joinedAt: Value(DateTime.utc(2020)),
      ),
    );
  }
}

ProviderContainer _container({
  required FluxerDatabase db,
  required String userId,
  required String guildId,
}) {
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      currentUserIdProvider.overrideWithValue(userId),
      userSettingsViewModelProvider.overrideWith(
        () => _FixedUserSettingsViewModel(userId),
      ),
      guildListViewModelProvider.overrideWith(
        () => _FixedGuildListViewModel([
          Guild(id: guildId, name: 'Guild', ownerId: 'owner'),
        ]),
      ),
    ],
  );
}

void main() {
  test(
    'channelUnreadProvider shows unread before member row is loaded',
    () async {
      final db = openTestDatabase();
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      const userId = 'me';
      final lastMessageId = _snowflakeForUtc(
        DateTime.now().toUtc().subtract(const Duration(hours: 1)),
      );
      final ackId = snowflakeAtPreviousMillisecond(lastMessageId);

      await _seedUnreadChannel(
        db: db,
        guildId: guildId,
        channelId: channelId,
        userId: userId,
        lastMessageId: lastMessageId,
        ackId: ackId,
        includeMember: false,
      );

      final container = _container(db: db, userId: userId, guildId: guildId);
      addTearDown(container.dispose);
      container.read(gatewayReadyProvider.notifier).setReady();

      final sub = container.listen(
        channelUnreadProvider(channelId),
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await _waitFor(() {
        final unread = container.read(channelUnreadProvider(channelId)).value;
        return unread?.hasUnread ?? false;
      });

      final unread = container.read(channelUnreadProvider(channelId)).value;
      expect(unread?.hasUnread, isTrue);
      expect(unread?.hasUnreadMessages, isTrue);
    },
  );

  test(
    'channelUnreadProvider recomputes after member row is inserted',
    () async {
      final db = openTestDatabase();
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      const userId = 'me';
      final lastMessageId = _snowflakeForUtc(
        DateTime.now().toUtc().subtract(const Duration(hours: 1)),
      );
      final ackId = snowflakeAtPreviousMillisecond(lastMessageId);

      await _seedUnreadChannel(
        db: db,
        guildId: guildId,
        channelId: channelId,
        userId: userId,
        lastMessageId: lastMessageId,
        ackId: ackId,
        includeMember: false,
      );

      final container = _container(db: db, userId: userId, guildId: guildId);
      addTearDown(container.dispose);
      container.read(gatewayReadyProvider.notifier).setReady();

      final sub = container.listen(
        channelUnreadProvider(channelId),
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await _waitFor(() {
        final unread = container.read(channelUnreadProvider(channelId)).value;
        return unread?.hasUnread ?? false;
      });

      await db.memberDao.upsertMember(
        MembersCompanion.insert(
          userId: userId,
          guildId: guildId,
          roleIdsJson: const Value('["role-view"]'),
          joinedAt: Value(DateTime.utc(2020)),
        ),
      );

      await _waitFor(() {
        final unread = container.read(channelUnreadProvider(channelId)).value;
        return unread?.hasUnread ?? false;
      });

      final unread = container.read(channelUnreadProvider(channelId)).value;
      expect(unread?.hasUnread, isTrue);
      expect(unread?.hasUnreadMessages, isTrue);
    },
  );

  test(
    'channelUnreadProvider uses orphaned channel pointer when read state is behind',
    () async {
      final db = openTestDatabase();
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      const userId = 'me';
      final lastMessageId = _snowflakeForUtc(
        DateTime.now().toUtc().subtract(const Duration(hours: 1)),
      );
      final ackId = snowflakeAtPreviousMillisecond(lastMessageId);

      await _seedUnreadChannel(
        db: db,
        guildId: guildId,
        channelId: channelId,
        userId: userId,
        lastMessageId: lastMessageId,
        ackId: ackId,
      );

      final container = _container(db: db, userId: userId, guildId: guildId);
      addTearDown(container.dispose);
      container.read(gatewayReadyProvider.notifier).setReady();

      final sub = container.listen(
        channelUnreadProvider(channelId),
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await _waitFor(() {
        final unread = container.read(channelUnreadProvider(channelId)).value;
        return unread?.hasUnread ?? false;
      });

      final unread = container.read(channelUnreadProvider(channelId)).value;
      expect(unread?.hasUnread, isTrue);
      expect(unread?.hasUnreadMessages, isTrue);
    },
  );

  test(
    'channelUnreadProvider clears unread after orphaned tail is walked back',
    () async {
      final db = openTestDatabase();
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      const userId = 'me';
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final deletedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));

      await _seedUnreadChannel(
        db: db,
        guildId: guildId,
        channelId: channelId,
        userId: userId,
        lastMessageId: deletedId,
        ackId: ackId,
      );
      await db.channelDao.setLastMessageId(channelId, ackId);

      final container = _container(db: db, userId: userId, guildId: guildId);
      addTearDown(container.dispose);
      container.read(gatewayReadyProvider.notifier).setReady();

      final sub = container.listen(
        channelUnreadProvider(channelId),
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await _waitFor(() {
        final unread = container.read(channelUnreadProvider(channelId)).value;
        return unread != null && !unread.hasUnread;
      });

      final unread = container.read(channelUnreadProvider(channelId)).value;
      expect(unread?.hasUnread, isFalse);
      expect(unread?.hasUnreadMessages, isFalse);
    },
  );

  test(
    'channelUnreadProvider clears unread after ack to orphaned deleted tail pointer',
    () async {
      final db = openTestDatabase();
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      const userId = 'me';
      final priorId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final deletedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));

      await _seedUnreadChannel(
        db: db,
        guildId: guildId,
        channelId: channelId,
        userId: userId,
        lastMessageId: deletedId,
        ackId: priorId,
      );
      await db.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: priorId,
          channelId: channelId,
          authorId: 'other',
          content: 'hello',
          timestamp: DateTime.fromMillisecondsSinceEpoch(
            snowflakeTimestampMs(priorId),
            isUtc: true,
          ),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value(channelId),
          lastMessageId: Value(deletedId),
          mentionCount: const Value(0),
        ),
      );

      final container = _container(db: db, userId: userId, guildId: guildId);
      addTearDown(container.dispose);
      container.read(gatewayReadyProvider.notifier).setReady();

      final sub = container.listen(
        channelUnreadProvider(channelId),
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await _waitFor(() {
        final unread = container.read(channelUnreadProvider(channelId)).value;
        return unread != null && !unread.hasUnread;
      });

      final channel = await db.channelDao.getChannelById(channelId);
      final unread = container.read(channelUnreadProvider(channelId)).value;
      expect(channel?.lastMessageId, deletedId);
      expect(unread?.hasUnread, isFalse);
      expect(unread?.hasUnreadMessages, isFalse);
    },
  );

  test('persisting an older page does not recompute unread for other '
      'channels (#713)', () async {
    final watched = await _watchTwoChannels();
    final _SelectLog log = watched.log;
    final int readsA = log.channelReads('channel-a');
    final int readsB = log.channelReads('channel-b');
    final int lastReadsA = log.lastMessageReads('channel-a');
    final int lastReadsB = log.lastMessageReads('channel-b');

    await watched.db.messageDao.upsertMessages(<MessagesCompanion>[
      for (int minute = 0; minute < 5; minute += 1)
        _messageRow(
          _snowflakeForUtc(DateTime.utc(2026, 5, 6, 9, minute)),
          'channel-a',
        ),
    ]);
    await _waitFor(
      () =>
          log.lastMessageReads('channel-a') > lastReadsA &&
          log.lastMessageReads('channel-b') > lastReadsB,
    );
    await _waitForQuiet(log);

    expect(
      log.channelReads('channel-a'),
      readsA,
      reason: 'older rows leave channel A newest message unchanged',
    );
    expect(
      log.channelReads('channel-b'),
      readsB,
      reason: 'a messages write elsewhere must not recompute channel B',
    );
  });

  test('a live message in channel B recomputes only channel B', () async {
    final watched = await _watchTwoChannels();
    final _SelectLog log = watched.log;
    final int readsA = log.channelReads('channel-a');
    final int readsB = log.channelReads('channel-b');
    final int lastReadsA = log.lastMessageReads('channel-a');

    await watched.db.messageDao.upsertMessage(
      _messageRow(_snowflakeForUtc(DateTime.utc(2026, 5, 6, 12)), 'channel-b'),
    );
    await _waitFor(
      () =>
          log.lastMessageReads('channel-a') > lastReadsA &&
          log.channelReads('channel-b') > readsB,
    );
    await _waitForQuiet(log);

    expect(log.channelReads('channel-a'), readsA);
  });

  test('an unread recompute that changes nothing does not notify '
      'listeners', () async {
    final watched = await _watchTwoChannels();
    final _SelectLog log = watched.log;
    final int readsA = log.channelReads('channel-a');
    final int notifications = watched.notificationsA[0];

    await watched.db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-a',
        guildId: 'guild-1',
        name: 'renamed',
      ),
    );
    await _waitFor(() => log.channelReads('channel-a') > readsA + 1);
    await _waitForQuiet(log);

    expect(
      watched.notificationsA[0],
      notifications,
      reason: 'an equal unread state would rebuild every sidebar watcher',
    );
  });

  test('a PASSIVE_UPDATES tail advance flips channelUnread (#713)', () async {
    final watched = await _watchTwoChannels();
    final ProviderContainer container = watched.container;
    expect(
      container.read(channelUnreadProvider('channel-a')).value?.hasUnread,
      isFalse,
    );

    await GatewayEventHandler(
      database: watched.db,
      channelLastMessageIndex: container.read(channelLastMessageIndexProvider),
    ).handle(
      PassiveUpdatesEvent(
        guildId: 'guild-1',
        channels: <String, String>{
          'channel-a': _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12)),
        },
      ),
    );

    await _waitFor(
      () =>
          container.read(channelUnreadProvider('channel-a')).value?.hasUnread ??
          false,
    );
    expect(
      container.read(channelUnreadProvider('channel-b')).value?.hasUnread,
      isFalse,
    );
  });
}
