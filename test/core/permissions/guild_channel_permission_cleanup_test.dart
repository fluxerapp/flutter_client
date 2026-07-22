import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Channel;
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/guild_channel_permission_cleanup.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';

import '../../helpers/open_test_database.dart';

class _GuildListViewModelWithGuilds extends GuildListViewModel {
  _GuildListViewModelWithGuilds(this._guilds);

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

Future<void> _seedGuildWithChannels({
  required FluxerDatabase db,
  required String guildId,
  required List<String> channelIds,
  required String userId,
}) async {
  await db.guildDao.upsertServer(
    ServersCompanion.insert(id: guildId, name: 'Guild $guildId'),
  );
  await db.memberDao.upsertMember(
    MembersCompanion.insert(userId: userId, guildId: guildId),
  );
  for (final String channelId in channelIds) {
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: channelId,
        guildId: guildId,
        name: channelId,
      ),
    );
  }
}

void main() {
  group('ChannelPermissionCache.evictGuild', () {
    test('removes all channel entries for the guild', () async {
      const String guildId = 'guild_a';
      const String channelA1 = 'channel_a1';
      const String channelA2 = 'channel_a2';
      const String userId = 'user_1';
      final FluxerDatabase db = openTestDatabase();
      await _seedGuildWithChannels(
        db: db,
        guildId: guildId,
        channelIds: <String>[channelA1, channelA2],
        userId: userId,
      );

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          guildListViewModelProvider.overrideWith(
            () => _GuildListViewModelWithGuilds(<Guild>[
              const Guild(id: guildId, name: 'Guild A'),
            ]),
          ),
          userSettingsViewModelProvider.overrideWith(
            () => _FixedUserSettingsViewModel(userId),
          ),
        ],
      );
      addTearDown(container.dispose);

      final ChannelPermissionCache cache = container.read(
        channelPermissionCacheProvider.notifier,
      );
      await cache.rebuildGuild(guildId);
      expect(cache.getChannelBits(channelA1), isNotNull);
      expect(cache.getChannelBits(channelA2), isNotNull);

      await cache.evictGuild(guildId);

      expect(container.read(channelPermissionCacheProvider), isEmpty);
      expect(cache.getChannelBits(channelA1), isNull);
      expect(cache.getChannelBits(channelA2), isNull);
    });
  });

  group('evictInactiveGuildPermissionState', () {
    test('keeps cache bounded to the active guild after switching', () async {
      const String guildA = 'guild_a';
      const String guildB = 'guild_b';
      const String channelA1 = 'channel_a1';
      const String channelA2 = 'channel_a2';
      const String channelB1 = 'channel_b1';
      const String userId = 'user_1';

      final FluxerDatabase db = openTestDatabase();
      await _seedGuildWithChannels(
        db: db,
        guildId: guildA,
        channelIds: <String>[channelA1, channelA2],
        userId: userId,
      );
      await _seedGuildWithChannels(
        db: db,
        guildId: guildB,
        channelIds: <String>[channelB1],
        userId: userId,
      );

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          guildListViewModelProvider.overrideWith(
            () => _GuildListViewModelWithGuilds(<Guild>[
              const Guild(id: guildA, name: 'Guild A'),
              const Guild(id: guildB, name: 'Guild B'),
            ]),
          ),
          userSettingsViewModelProvider.overrideWith(
            () => _FixedUserSettingsViewModel(userId),
          ),
        ],
      );
      addTearDown(container.dispose);

      final ChannelPermissionCache cache = container.read(
        channelPermissionCacheProvider.notifier,
      );
      await cache.rebuildGuild(guildA);
      expect(container.read(channelPermissionCacheProvider).length, 2);

      await evictInactiveGuildPermissionState(container, guildA);
      await cache.rebuildGuild(guildB);

      final Map<String, int> cached = container
          .read(channelPermissionCacheProvider)
          .effective;
      expect(cached.length, 1);
      expect(cached.containsKey(channelB1), isTrue);
      expect(cached.containsKey(channelA1), isFalse);
      expect(cached.containsKey(channelA2), isFalse);
    });

    test('clears permission cache for evicted guild channels', () async {
      const String guildId = 'guild_a';
      const String channelId = 'channel_a1';
      const String userId = 'user_1';
      final FluxerDatabase db = openTestDatabase();
      await _seedGuildWithChannels(
        db: db,
        guildId: guildId,
        channelIds: <String>[channelId],
        userId: userId,
      );

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          guildListViewModelProvider.overrideWith(
            () => _GuildListViewModelWithGuilds(<Guild>[
              const Guild(id: guildId, name: 'Guild A'),
            ]),
          ),
          userSettingsViewModelProvider.overrideWith(
            () => _FixedUserSettingsViewModel(userId),
          ),
        ],
      );
      addTearDown(container.dispose);

      final ChannelPermissionCache cache = container.read(
        channelPermissionCacheProvider.notifier,
      );
      await cache.rebuildGuild(guildId);
      expect(container.read(channelPermissionCacheProvider).length, 1);

      await evictInactiveGuildPermissionState(container, guildId);

      expect(container.read(channelPermissionCacheProvider), isEmpty);
      expect(cache.getChannelBits(channelId), isNull);
    });
  });
}
