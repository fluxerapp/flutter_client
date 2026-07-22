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
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

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
}
