import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';

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
      final notifier = container.read(guildPermissionsProvider.notifier);

      expect(await notifier.getPermissions(_guildId), 0);

      final cached = container.read(guildPermissionsProvider);
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
      final notifier = container.read(guildPermissionsProvider.notifier);

      expect(await notifier.getPermissions(_guildId), 0);
      expect(container.read(guildPermissionsProvider)[_guildId], 0);

      await _seedMember(db);
      await notifier.refreshPermissions(_guildId);

      expect(
        container.read(guildPermissionsProvider)[_guildId],
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
    final notifier = container.read(guildPermissionsProvider.notifier);

    expect(await notifier.getPermissions(_guildId), 0);

    expect(
      container.read(guildPermissionsProvider).containsKey(_guildId),
      isTrue,
    );
  });

  test('does not cache an unknown guild so it can resolve later', () async {
    final db = openTestDatabase();

    final container = await _container(db);
    addTearDown(container.dispose);
    final notifier = container.read(guildPermissionsProvider.notifier);

    expect(await notifier.getPermissions('unknown-guild'), 0);

    expect(
      container.read(guildPermissionsProvider).containsKey('unknown-guild'),
      isFalse,
    );
  });
}
