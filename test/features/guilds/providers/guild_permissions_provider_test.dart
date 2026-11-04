import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';

import '../../../helpers/open_test_database.dart';

const String _guildId = 'g1';
const String _userId = 'me';
const String _ownerId = 'owner';

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

Future<ProviderContainer> _container(FluxerDatabase db) async {
  await db.guildDao.upsertServer(
    ServersCompanion.insert(
      id: _guildId,
      name: 'Guild',
      ownerId: const Value(_ownerId),
    ),
  );
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      userSettingsViewModelProvider.overrideWith(
        () => _FixedUserSettingsViewModel(_userId),
      ),
    ],
  );
}

Future<void> _seedEveryoneRole(
  FluxerDatabase db, {
  required int permissions,
}) async {
  await db.roleDao.upsertRoles([
    RolesCompanion.insert(
      id: _guildId,
      guildId: _guildId,
      name: '@everyone',
      permissions: Value(permissions.toString()),
    ),
  ]);
}

Future<void> _seedMember(
  FluxerDatabase db, {
  List<String> roleIds = const <String>[],
}) async {
  await db.memberDao.upsertMember(
    MembersCompanion.insert(
      userId: _userId,
      guildId: _guildId,
      roleIdsJson: Value(jsonEncode(roleIds)),
      joinedAt: Value(DateTime.utc(2020)),
    ),
  );
}

void main() {
  test(
    'caches the pending 0 when the current user member row is not loaded',
    () async {
      final db = openTestDatabase();
      await _seedEveryoneRole(db, permissions: Permission.viewChannel.value);

      final container = await _container(db);
      addTearDown(container.dispose);
      final notifier = container.read(
        guildPermissionsProvider(readAccountUserId(container)).notifier,
      );

      expect(await notifier.getPermissions(_guildId), 0);

      final cached = container.read(
        guildPermissionsProvider(readAccountUserId(container)),
      );
      expect(cached.containsKey(_guildId), isTrue);
      expect(cached[_guildId], 0);

      expect(await notifier.getPermissions(_guildId), 0);
    },
  );

  test(
    'refreshPermissions replaces the cached pending 0 once membership loads',
    () async {
      final db = openTestDatabase();
      await _seedEveryoneRole(db, permissions: Permission.viewChannel.value);

      final container = await _container(db);
      addTearDown(container.dispose);
      final notifier = container.read(
        guildPermissionsProvider(readAccountUserId(container)).notifier,
      );

      expect(await notifier.getPermissions(_guildId), 0);
      expect(
        container.read(
          guildPermissionsProvider(readAccountUserId(container)),
        )[_guildId],
        0,
      );

      await _seedMember(db);
      await notifier.refreshPermissions(_guildId);

      expect(
        container.read(
          guildPermissionsProvider(readAccountUserId(container)),
        )[_guildId],
        Permission.viewChannel.value,
      );
    },
  );

  test('caches a genuine 0 when the member has no permissions', () async {
    final db = openTestDatabase();
    await _seedEveryoneRole(db, permissions: 0);
    await _seedMember(db);

    final container = await _container(db);
    addTearDown(container.dispose);
    final notifier = container.read(
      guildPermissionsProvider(readAccountUserId(container)).notifier,
    );

    expect(await notifier.getPermissions(_guildId), 0);

    expect(
      container
          .read(guildPermissionsProvider(readAccountUserId(container)))
          .containsKey(_guildId),
      isTrue,
    );
  });

  test('does not cache an unknown guild so it can resolve later', () async {
    final db = openTestDatabase();

    final container = await _container(db);
    addTearDown(container.dispose);
    final notifier = container.read(
      guildPermissionsProvider(readAccountUserId(container)).notifier,
    );

    expect(await notifier.getPermissions('unknown-guild'), 0);

    expect(
      container
          .read(guildPermissionsProvider(readAccountUserId(container)))
          .containsKey('unknown-guild'),
      isFalse,
    );
  });

  test('prefetch resolves many guilds in one state write', () async {
    final db = openTestDatabase();
    final List<String> guildIds = <String>[for (var i = 0; i < 40; i++) 'pg$i'];
    for (final String id in guildIds) {
      await db.guildDao.upsertServer(
        ServersCompanion.insert(
          id: id,
          name: id,
          ownerId: const Value(_ownerId),
        ),
      );
      await db.roleDao.upsertRoles([
        RolesCompanion.insert(
          id: id,
          guildId: id,
          name: '@everyone',
          permissions: Value(Permission.viewChannel.value.toString()),
        ),
      ]);
      await db.memberDao.upsertMember(
        MembersCompanion.insert(
          userId: _userId,
          guildId: id,
          roleIdsJson: const Value('[]'),
          joinedAt: Value(DateTime.utc(2020)),
        ),
      );
    }

    final container = await _container(db);
    addTearDown(container.dispose);
    var writes = 0;
    final GuildPermissionsProvider permissions = guildPermissionsProvider(
      readAccountUserId(container),
    );
    container.listen(permissions, (_, _) => writes++);
    final notifier = container.read(permissions.notifier);

    await Future.wait(<Future<void>>[
      notifier.prefetch(guildIds),
      notifier.prefetch(guildIds),
    ]);

    expect(writes, 1);
    expect(container.read(permissions), <String, int>{
      for (final String id in guildIds) id: Permission.viewChannel.value,
    });

    notifier.clearAll();
    final Future<void> dropped = notifier.prefetch(guildIds);
    notifier.clearAll();
    await dropped;

    expect(container.read(permissions), isEmpty);

    final Future<void> partlyEvicted = notifier.prefetch(guildIds);
    notifier.evict('pg3');
    await partlyEvicted;

    expect(container.read(permissions), <String, int>{
      for (final String id in guildIds)
        if (id != 'pg3') id: Permission.viewChannel.value,
    });
  });
}
