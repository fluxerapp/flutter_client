import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Channel;
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';

import '../../helpers/open_test_database.dart';

const String _guildId = 'guild-1';
const String _userId = 'me';

class _Settings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => const UserSettingsViewState(
    userId: _userId,
    username: 'user',
    displayName: 'user',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: <String>[],
  );
}

String _denyEveryone(Permission permission) => jsonEncode(<Object?>[
  <String, Object?>{
    'id': _guildId,
    'type': 0,
    'allow': '0',
    'deny': '${permission.value}',
  },
]);

Future<ChannelPermissionCache> _cacheFor(FluxerDatabase db) async {
  await db.guildDao.upsertServer(
    ServersCompanion.insert(
      id: _guildId,
      name: 'Guild',
      ownerId: const Value('owner'),
    ),
  );
  await db.roleDao.upsertRoles([
    RolesCompanion.insert(
      id: _guildId,
      guildId: _guildId,
      name: '@everyone',
      permissions: Value(
        '${Permission.viewChannel.value | Permission.sendMessages.value}',
      ),
    ),
  ]);
  await db.memberDao.upsertMember(
    MembersCompanion.insert(userId: _userId, guildId: _guildId),
  );
  final ProviderContainer container = ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      userSettingsViewModelProvider.overrideWith(_Settings.new),
    ],
  );
  addTearDown(container.dispose);
  return container.read(channelPermissionCacheProvider.notifier);
}

void main() {
  test('a channel does not inherit its category overwrites', () async {
    final FluxerDatabase db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'category',
        guildId: _guildId,
        name: 'category',
        type: const Value(4),
        permissionOverwritesJson: Value(_denyEveryone(Permission.sendMessages)),
      ),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'child',
        guildId: _guildId,
        name: 'child',
        parentId: const Value('category'),
      ),
    );
    final ChannelPermissionCache cache = await _cacheFor(db);

    await cache.rebuildGuild(_guildId);
    expect(
      hasPermission(cache.getChannelBits('child')!, Permission.sendMessages),
      isTrue,
    );

    await cache.evictGuild(_guildId);
    await cache.rebuildChannel('child');
    expect(
      hasPermission(cache.getChannelBits('child')!, Permission.sendMessages),
      isTrue,
    );
  });

  test('a thread takes its parent channel overwrites', () async {
    final FluxerDatabase db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'parent',
        guildId: _guildId,
        name: 'parent',
        permissionOverwritesJson: Value(_denyEveryone(Permission.sendMessages)),
      ),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'thread',
        guildId: _guildId,
        name: 'thread',
        type: const Value(11),
        parentId: const Value('parent'),
      ),
    );
    final ChannelPermissionCache cache = await _cacheFor(db);

    await cache.rebuildGuild(_guildId);
    final int batched = cache.getChannelBits('thread')!;
    await cache.evictGuild(_guildId);
    await cache.rebuildChannel('thread');
    final int single = cache.getChannelBits('thread')!;

    expect(hasPermission(batched, Permission.sendMessages), isFalse);
    expect(single, batched);
  });
}
