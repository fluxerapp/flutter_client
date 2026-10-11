import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart' show FluxerClient;
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

const String _guildId = 'g1';
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

void main() {
  Map<String, dynamic> guildUpdatePayload({required String ownerId}) =>
      <String, dynamic>{
        'id': _guildId,
        'name': 'Guild g1',
        'icon': null,
        'banner': null,
        'splash': null,
        'splash_card_alignment': 0,
        'vanity_url_code': null,
        'owner_id': ownerId,
        'system_channel_id': null,
        'system_channel_flags': 0,
        'rules_channel_id': null,
        'afk_channel_id': null,
        'afk_timeout': 300,
        'features': <String>[],
        'verification_level': 0,
        'mfa_level': 0,
        'nsfw_level': 0,
        'nsfw': false,
        'content_warning_level': 0,
        'content_warning_text': null,
        'explicit_content_filter': 0,
        'default_message_notifications': 0,
        'disabled_operations': 0,
      };

  test(
    'GUILD_UPDATE ownership transfer gives the new owner every permission',
    () async {
      final FluxerDatabase db = openTestDatabase();
      addTearDown(db.close);
      await db.guildDao.upsertServer(
        ServersCompanion.insert(
          id: _guildId,
          name: 'Guild g1',
          ownerId: const Value<String?>('u-old'),
        ),
      );
      await db.roleDao.upsertRoles(<RolesCompanion>[
        RolesCompanion.insert(
          id: _guildId,
          guildId: _guildId,
          name: '@everyone',
          permissions: Value<String>('${Permission.viewChannel.value}'),
        ),
      ]);
      await db.memberDao.upsertMember(
        MembersCompanion.insert(userId: _userId, guildId: _guildId),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(id: 'c1', guildId: _guildId, name: 'general'),
      );
      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          guildRepositoryProvider.overrideWithValue(
            GuildRepository(
              FluxerClient(Dio(), baseUrl: 'https://api.fluxer.app/v1'),
              db,
            ),
          ),
          userSettingsViewModelProvider.overrideWith(_Settings.new),
        ],
      );
      addTearDown(container.dispose);
      container.read(guildListViewModelProvider);
      for (
        int i = 0;
        i < 100 && container.read(guildListViewModelProvider).guilds.isEmpty;
        i++
      ) {
        await Future<void>.delayed(const Duration(milliseconds: 10));
      }
      expect(
        container.read(guildListViewModelProvider).guilds.single.ownerId,
        'u-old',
      );

      final List<Future<void>> rebuilds = <Future<void>>[];
      final GatewayEventHandler handler = GatewayEventHandler(
        database: db,
        onGuildPermissionsChanged: (String guildId) {
          rebuilds
            ..add(
              container
                  .read(guildPermissionsProvider.notifier)
                  .refreshPermissions(guildId),
            )
            ..add(
              container
                  .read(channelPermissionCacheProvider.notifier)
                  .rebuildGuild(guildId),
            );
        },
      );

      await handler.handle(
        GuildUpdateEvent(
          guild: GuildCreateData.fromJson(guildUpdatePayload(ownerId: _userId)),
        ),
      );
      for (int i = 0; i < 100 && rebuilds.isEmpty; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 10));
      }
      await Future.wait(rebuilds);

      expect(
        container.read(guildPermissionsProvider)[_guildId],
        allPermissions,
      );
      expect(
        container
            .read(channelPermissionCacheProvider.notifier)
            .getChannelBits('c1'),
        allPermissions,
      );
    },
  );
}
