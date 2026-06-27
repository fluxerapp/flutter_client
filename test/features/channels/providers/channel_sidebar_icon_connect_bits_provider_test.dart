import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Channel;
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_sidebar_icon_connect_bits_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';

void main() {
  group('channelSidebarIconConnectBitsProvider', () {
    test('returns cached bits without recomputing', () async {
      const String channelId = 'voice_1';
      final int cachedBits = Permission.viewChannel.value;
      final ProviderContainer container = ProviderContainer(
        overrides: [
          channelPermissionCacheProvider.overrideWith(
            () => _FixedChannelPermissionCache(<String, int>{
              channelId: cachedBits,
            }),
          ),
        ],
      );
      addTearDown(container.dispose);

      final int? bits = await container.read(
        channelSidebarIconConnectBitsProvider(channelId).future,
      );

      expect(bits, cachedBits);
    });

    test('returns null while guild membership is not cacheable', () async {
      final FluxerDatabase db = FluxerDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(db.close);
      const String guildId = 'guild_1';
      const String channelId = 'voice_1';
      const String userId = 'user_1';
      await db.guildDao.upsertServer(
        ServersCompanion.insert(id: guildId, name: 'Guild'),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: guildId,
          name: 'locked',
          type: const Value(2),
        ),
      );
      await db.memberDao.upsertMember(
        MembersCompanion.insert(userId: userId, guildId: guildId),
      );

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          guildListViewModelProvider.overrideWith(_EmptyGuildListViewModel.new),
          userSettingsViewModelProvider.overrideWith(
            () => _FixedUserSettingsViewModel(userId),
          ),
        ],
      );
      addTearDown(container.dispose);

      final int? bits = await container.read(
        channelSidebarIconConnectBitsProvider(channelId).future,
      );

      expect(bits, isNull);
    });

    test(
      'returns cached denied connect bits for restricted voice channel',
      () async {
        final FluxerDatabase db = FluxerDatabase.forTesting(
          NativeDatabase.memory(),
        );
        addTearDown(db.close);
        const String guildId = 'guild_1';
        const String channelId = 'voice_1';
        const String userId = 'user_1';
        final String everyoneDenyConnect =
            '[{"id":"guild_1","type":0,"allow":"0","deny":"${Permission.connect.value}"}]';
        await db.guildDao.upsertServer(
          ServersCompanion.insert(id: guildId, name: 'Guild'),
        );
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: channelId,
            guildId: guildId,
            name: 'locked',
            type: const Value(2),
            permissionOverwritesJson: Value(everyoneDenyConnect),
          ),
        );
        await db.roleDao.upsertRoles([
          RolesCompanion.insert(
            id: guildId,
            guildId: guildId,
            name: '@everyone',
            permissions: Value(Permission.viewChannel.value.toString()),
          ),
        ]);
        await db.memberDao.upsertMember(
          MembersCompanion.insert(userId: userId, guildId: guildId),
        );

        final ProviderContainer container = ProviderContainer(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            guildListViewModelProvider.overrideWith(
              () => _FixedGuildListViewModel(const <Guild>[
                Guild(id: guildId, name: 'Guild'),
              ]),
            ),
            userSettingsViewModelProvider.overrideWith(
              () => _FixedUserSettingsViewModel(userId),
            ),
          ],
        );
        addTearDown(container.dispose);

        await container
            .read(channelPermissionCacheProvider.notifier)
            .rebuildChannel(channelId);

        final int? bits = await container.read(
          channelSidebarIconConnectBitsProvider(channelId).future,
        );

        expect(bits, Permission.viewChannel.value);
        expect(
          resolveChannelIconAccessOverlay(
            channel: Channel(
              id: channelId,
              guildId: guildId,
              name: 'locked',
              type: ChannelType.voice,
              permissionOverwritesJson: everyoneDenyConnect,
            ),
            canConnectPermissionBits: bits,
          ),
          ChannelIconAccessOverlay.noConnect,
        );
      },
    );
  });
}

class _FixedChannelPermissionCache extends ChannelPermissionCache {
  _FixedChannelPermissionCache(this._bits);

  final Map<String, int> _bits;

  @override
  Map<String, int> build() => _bits;
}

class _EmptyGuildListViewModel extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(guilds: <Guild>[]);
}

class _FixedGuildListViewModel extends GuildListViewModel {
  _FixedGuildListViewModel(this._guilds);

  final List<Guild> _guilds;

  @override
  GuildListViewState build() => GuildListViewState(guilds: _guilds);
}

class _FixedUserSettingsViewModel extends UserSettingsViewModel {
  _FixedUserSettingsViewModel(this._userId);

  final String _userId;

  @override
  UserSettingsViewState build() => UserSettingsViewState(
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
    trustedDomains: const <String>[],
  );
}
