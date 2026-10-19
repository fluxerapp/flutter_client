import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart' show Value;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';

import '../../../../helpers/open_test_database.dart';

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

class _EmptyGuildListViewModel extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(guilds: <Guild>[]);
}

class _FixedUserSettingsViewModel extends UserSettingsViewModel {
  _FixedUserSettingsViewModel(this._userId);

  final String _userId;

  @override
  UserSettingsViewState build() => _testUserSettings(userId: _userId);
}

class _EmptyDmViewModel extends DmViewModel {
  @override
  DmViewState build() => const DmViewState(
    conversations: [],
    friendsList: [],
    activeTab: FriendsTab.online,
    searchQuery: '',
  );
}

class _FixedDmViewModel extends DmViewModel {
  _FixedDmViewModel(this._conversations);

  final List<DmConversation> _conversations;

  @override
  DmViewState build() => DmViewState(
    conversations: _conversations,
    friendsList: const [],
    activeTab: FriendsTab.online,
    searchQuery: '',
  );
}

class _FixedGuildListViewModel extends GuildListViewModel {
  _FixedGuildListViewModel(this._guilds);

  final List<Guild> _guilds;

  @override
  GuildListViewState build() => GuildListViewState(guilds: _guilds);
}

void main() {
  group('channelMessagePermissionsForComposer', () {
    test('loading stays unresolved until bits are cached', () {
      final ChannelMessagePermissions perms =
          channelMessagePermissionsForComposer(
            const AsyncValue<ChannelMessagePermissions>.loading(),
          );
      expect(perms, ChannelMessagePermissions.unresolved);
      expect(perms.isComposerEnabled, isTrue);
      expect(perms.showsNoSendPermissionHint, isFalse);
    });

    test('error stays unresolved until bits are cached', () {
      final ChannelMessagePermissions perms =
          channelMessagePermissionsForComposer(
            AsyncValue<ChannelMessagePermissions>.error(
              Exception('test'),
              StackTrace.empty,
            ),
          );
      expect(perms, ChannelMessagePermissions.unresolved);
      expect(perms.isComposerEnabled, isTrue);
      expect(perms.showsNoSendPermissionHint, isFalse);
    });

    test('resolved deny shows permission hint flag', () {
      final ChannelMessagePermissions perms =
          channelMessagePermissionsForComposer(
            const AsyncValue.data(ChannelMessagePermissions.none),
          );
      expect(perms.isComposerEnabled, isFalse);
      expect(perms.showsNoSendPermissionHint, isTrue);
      expect(perms.canShowAttachControls, isFalse);
      expect(perms.isVoiceEnabled, isFalse);
    });

    test('unresolved keeps the composer open without a deny hint', () {
      const ChannelMessagePermissions perms =
          ChannelMessagePermissions.unresolved;
      expect(perms.isComposerEnabled, isTrue);
      expect(perms.showsNoSendPermissionHint, isFalse);
      expect(perms.canShowAttachControls, isTrue);
      expect(perms.isVoiceEnabled, isTrue);
    });

    test('async unresolved data stays unresolved for the composer', () {
      final ChannelMessagePermissions perms =
          channelMessagePermissionsForComposer(
            const AsyncValue.data(ChannelMessagePermissions.unresolved),
          );
      expect(perms, ChannelMessagePermissions.unresolved);
      expect(perms.isComposerEnabled, isTrue);
      expect(perms.showsNoSendPermissionHint, isFalse);
    });

    test('resolved send without attach hides attach controls', () {
      const ChannelMessagePermissions perms = ChannelMessagePermissions(
        isResolved: true,
        canSendMessages: true,
        canAttachFiles: false,
        canEmbedLinks: true,
        canUseExternalEmojis: true,
        canUseExternalStickers: true,
      );
      expect(perms.isComposerEnabled, isTrue);
      expect(perms.canShowAttachControls, isFalse);
      expect(perms.isVoiceEnabled, isFalse);
    });

    test('reload keeps previous data instead of loading deny', () async {
      const ChannelMessagePermissions allowed = ChannelMessagePermissions.all;
      final triggerProvider = StateProvider<int>((_) => 0);
      final pendingReload = Completer<ChannelMessagePermissions>();
      final permissionsProvider = FutureProvider<ChannelMessagePermissions>((
        ref,
      ) {
        final int generation = ref.watch(triggerProvider);
        if (generation == 0) {
          return allowed;
        }
        return pendingReload.future;
      });
      final container = ProviderContainer();
      addTearDown(() {
        if (!pendingReload.isCompleted) {
          pendingReload.complete(allowed);
        }
        container.dispose();
      });

      await container.read(permissionsProvider.future);
      container.read(triggerProvider.notifier).state = 1;
      final AsyncValue<ChannelMessagePermissions> reloading = container.read(
        permissionsProvider,
      );

      expect(reloading.isLoading, isTrue);
      expect(reloading.hasValue, isTrue);

      final ChannelMessagePermissions perms =
          channelMessagePermissionsForComposer(reloading);

      expect(perms, allowed);
    });
  });

  group('channelMessagePermissions provider', () {
    test(
      'grants all permissions for personal notes route without dm row',
      () async {
        const String userId = '1000000000000000001';
        final FluxerDatabase db = openTestDatabase();

        final ProviderContainer container = ProviderContainer(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            dmViewModelProvider.overrideWith(_EmptyDmViewModel.new),
            currentUserIdProvider.overrideWithValue(userId),
            guildListViewModelProvider.overrideWith(
              _EmptyGuildListViewModel.new,
            ),
          ],
        );
        addTearDown(container.dispose);

        final ChannelMessagePermissions perms = await container.read(
          channelMessagePermissionsProvider(userId).future,
        );

        expect(perms, ChannelMessagePermissions.all);
      },
    );

    test(
      'denies all permissions for system DM with Fluxerbot recipient',
      () async {
        const String channelId = '1000000000000000100';
        final FluxerDatabase db = openTestDatabase();

        final ProviderContainer container = ProviderContainer(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            dmViewModelProvider.overrideWith(
              () => _FixedDmViewModel(<DmConversation>[
                DmConversation(
                  id: channelId,
                  type: 1,
                  recipientId: fluxerBotUserId,
                  recipientName: 'Fluxer',
                  lastMessage: '',
                  lastMessageTime: DateTime.utc(2026),
                  isBot: true,
                  isSystem: true,
                ),
              ]),
            ),
            currentUserIdProvider.overrideWithValue('1000000000000000001'),
            guildListViewModelProvider.overrideWith(
              _EmptyGuildListViewModel.new,
            ),
          ],
        );
        addTearDown(container.dispose);

        final ChannelMessagePermissions perms = await container.read(
          channelMessagePermissionsProvider(channelId).future,
        );

        expect(perms, ChannelMessagePermissions.none);
      },
    );

    test('grants all permissions for regular DM', () async {
      const String channelId = '1000000000000000200';
      final FluxerDatabase db = openTestDatabase();

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          dmViewModelProvider.overrideWith(
            () => _FixedDmViewModel(<DmConversation>[
              DmConversation(
                id: channelId,
                type: 1,
                recipientId: '1000000000000000300',
                recipientName: 'Friend',
                lastMessage: 'Hi',
                lastMessageTime: DateTime.utc(2026),
              ),
            ]),
          ),
          currentUserIdProvider.overrideWithValue('1000000000000000001'),
          guildListViewModelProvider.overrideWith(_EmptyGuildListViewModel.new),
        ],
      );
      addTearDown(container.dispose);

      final ChannelMessagePermissions perms = await container.read(
        channelMessagePermissionsProvider(channelId).future,
      );

      expect(perms, ChannelMessagePermissions.all);
    });
  });

  group('channelMessagePermissionsFromBits', () {
    test('maps send and attach flags from effective bits', () {
      final int bits =
          Permission.sendMessages.value | Permission.attachFiles.value;
      final ChannelMessagePermissions perms = channelMessagePermissionsFromBits(
        bits: bits,
        channelType: ChannelType.guildText,
      );
      expect(perms.isResolved, isTrue);
      expect(perms.canSendMessages, isTrue);
      expect(perms.canAttachFiles, isTrue);
      expect(perms.canEmbedLinks, isFalse);
    });
  });

  group('ChannelPermissionCache', () {
    test(
      'caches bits from local server row when guild list is empty',
      () async {
        final FluxerDatabase db = openTestDatabase();
        const String guildId = 'guild_1';
        const String channelId = 'channel_1';
        const String userId = 'user_1';
        await db.guildDao.upsertServer(
          ServersCompanion.insert(id: guildId, name: 'Guild'),
        );
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: channelId,
            guildId: guildId,
            name: 'general',
          ),
        );
        await db.memberDao.upsertMember(
          MembersCompanion.insert(userId: userId, guildId: guildId),
        );

        final ProviderContainer container = ProviderContainer(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            guildListViewModelProvider.overrideWith(
              _EmptyGuildListViewModel.new,
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

        expect(
          container
              .read(channelPermissionCacheProvider.notifier)
              .getChannelBits(channelId),
          isNotNull,
        );
      },
    );

    test('caches everyone bits when member row is missing', () async {
      final FluxerDatabase db = openTestDatabase();
      const String guildId = 'guild_1';
      const String channelId = 'channel_1';
      const String ownerId = 'owner_1';
      await db.guildDao.upsertServer(
        ServersCompanion.insert(id: guildId, name: 'Guild'),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: guildId,
          name: 'general',
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

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          guildListViewModelProvider.overrideWith(
            () => _FixedGuildListViewModel(<Guild>[
              const Guild(id: guildId, name: 'Guild', ownerId: ownerId),
            ]),
          ),
          userSettingsViewModelProvider.overrideWith(
            () => _FixedUserSettingsViewModel('user_1'),
          ),
        ],
      );
      addTearDown(container.dispose);

      await container
          .read(channelPermissionCacheProvider.notifier)
          .rebuildChannel(channelId);

      expect(
        container
            .read(channelPermissionCacheProvider.notifier)
            .getChannelBits(channelId),
        Permission.viewChannel.value,
      );
    });
  });

  group('computeEffectiveGuildChannelPermissionBitsOutcome', () {
    test('returns shouldCache false when guild is missing from list', () async {
      final FluxerDatabase db = openTestDatabase();
      const String guildId = 'guild_1';
      const String channelId = 'channel_1';
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: guildId,
          name: 'general',
        ),
      );

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          guildListViewModelProvider.overrideWith(_EmptyGuildListViewModel.new),
          userSettingsViewModelProvider.overrideWith(
            () => _FixedUserSettingsViewModel('user_1'),
          ),
        ],
      );
      addTearDown(container.dispose);

      final ChannelPermissionBitsOutcome outcome = await container.read(
        FutureProvider<ChannelPermissionBitsOutcome>(
          (Ref ref) => computeEffectiveGuildChannelPermissionBitsOutcome(
            ref: ref,
            channelId: channelId,
          ),
        ).future,
      );

      expect(outcome.shouldCache, isFalse);
      expect(outcome.value, 0);
    });

    test(
      'resolves from the database when another guild is already in memory',
      () async {
        final FluxerDatabase db = openTestDatabase();
        const String guildId = 'guild_1';
        const String channelId = 'channel_1';
        const String userId = 'user_1';
        await db.guildDao.upsertServer(
          ServersCompanion.insert(id: guildId, name: 'Guild'),
        );
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: channelId,
            guildId: guildId,
            name: 'general',
          ),
        );
        await db.roleDao.upsertRoles([
          RolesCompanion.insert(
            id: guildId,
            guildId: guildId,
            name: '@everyone',
            permissions: Value(Permission.sendMessages.value.toString()),
          ),
        ]);
        await db.memberDao.upsertMember(
          MembersCompanion.insert(userId: userId, guildId: guildId),
        );

        final ProviderContainer container = ProviderContainer(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            guildListViewModelProvider.overrideWith(
              () => _FixedGuildListViewModel(<Guild>[
                const Guild(id: 'other_guild', name: 'Other', ownerId: 'owner'),
              ]),
            ),
            userSettingsViewModelProvider.overrideWith(
              () => _FixedUserSettingsViewModel(userId),
            ),
          ],
        );
        addTearDown(container.dispose);

        final ChannelPermissionBitsOutcome outcome = await container.read(
          FutureProvider<ChannelPermissionBitsOutcome>(
            (Ref ref) => computeEffectiveGuildChannelPermissionBitsOutcome(
              ref: ref,
              channelId: channelId,
            ),
          ).future,
        );

        expect(outcome.shouldCache, isTrue);
        expect(hasPermission(outcome.value, Permission.sendMessages), isTrue);
      },
    );

    test(
      'resolves view-only send deny from local rows while guild list is empty',
      () async {
        final FluxerDatabase db = openTestDatabase();
        const String guildId = 'guild_1';
        const String channelId = 'channel_1';
        const String userId = 'user_1';
        await db.guildDao.upsertServer(
          ServersCompanion.insert(id: guildId, name: 'Guild'),
        );
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: channelId,
            guildId: guildId,
            name: 'announcements',
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
              _EmptyGuildListViewModel.new,
            ),
            userSettingsViewModelProvider.overrideWith(
              () => _FixedUserSettingsViewModel(userId),
            ),
          ],
        );
        addTearDown(container.dispose);

        final ChannelPermissionBitsOutcome outcome = await container.read(
          FutureProvider<ChannelPermissionBitsOutcome>(
            (Ref ref) => computeEffectiveGuildChannelPermissionBitsOutcome(
              ref: ref,
              channelId: channelId,
            ),
          ).future,
        );

        expect(outcome.shouldCache, isTrue);
        expect(hasPermission(outcome.value, Permission.viewChannel), isTrue);
        expect(hasPermission(outcome.value, Permission.sendMessages), isFalse);
      },
    );

    test('caches everyone bits when member row is missing', () async {
      final FluxerDatabase db = openTestDatabase();
      const String guildId = 'guild_1';
      const String channelId = 'channel_1';
      const String ownerId = 'owner_1';
      await db.guildDao.upsertServer(
        ServersCompanion.insert(id: guildId, name: 'Guild'),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: guildId,
          name: 'general',
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

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          guildListViewModelProvider.overrideWith(
            () => _FixedGuildListViewModel(<Guild>[
              const Guild(id: guildId, name: 'Guild', ownerId: ownerId),
            ]),
          ),
          userSettingsViewModelProvider.overrideWith(
            () => _FixedUserSettingsViewModel('user_1'),
          ),
        ],
      );
      addTearDown(container.dispose);

      final ChannelPermissionBitsOutcome outcome = await container.read(
        FutureProvider<ChannelPermissionBitsOutcome>(
          (Ref ref) => computeEffectiveGuildChannelPermissionBitsOutcome(
            ref: ref,
            channelId: channelId,
          ),
        ).future,
      );

      expect(outcome.shouldCache, isTrue);
      expect(outcome.value, Permission.viewChannel.value);
    });

    test(
      'uses default permissions when @everyone role row is missing',
      () async {
        final FluxerDatabase db = openTestDatabase();
        const String guildId = 'guild_1';
        const String channelId = 'channel_1';
        const String userId = 'user_1';
        const String ownerId = 'owner_1';
        await db.guildDao.upsertServer(
          ServersCompanion.insert(id: guildId, name: 'Guild'),
        );
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: channelId,
            guildId: guildId,
            name: 'general',
          ),
        );
        await db.memberDao.upsertMember(
          MembersCompanion.insert(userId: userId, guildId: guildId),
        );

        final ProviderContainer container = ProviderContainer(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            guildListViewModelProvider.overrideWith(
              () => _FixedGuildListViewModel(<Guild>[
                const Guild(id: guildId, name: 'Guild', ownerId: ownerId),
              ]),
            ),
            userSettingsViewModelProvider.overrideWith(
              () => _FixedUserSettingsViewModel(userId),
            ),
          ],
        );
        addTearDown(container.dispose);

        final ChannelPermissionBitsOutcome outcome = await container.read(
          FutureProvider<ChannelPermissionBitsOutcome>(
            (Ref ref) => computeEffectiveGuildChannelPermissionBitsOutcome(
              ref: ref,
              channelId: channelId,
            ),
          ).future,
        );

        expect(outcome.shouldCache, isTrue);
        expect(hasPermission(outcome.value, Permission.sendMessages), isTrue);
        expect(hasPermission(outcome.value, Permission.viewChannel), isTrue);
      },
    );
  });

  group('syncChannelMessagePermissions', () {
    test('maps cached guild bits to resolved send permission', () async {
      final FluxerDatabase db = openTestDatabase();
      const String guildId = 'guild_1';
      const String channelId = 'channel_1';
      const String userId = 'user_1';
      const String ownerId = 'owner_1';
      final int sendBits =
          Permission.viewChannel.value | Permission.sendMessages.value;
      await db.guildDao.upsertServer(
        ServersCompanion.insert(id: guildId, name: 'Guild'),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: guildId,
          name: 'general',
        ),
      );
      await db.roleDao.upsertRoles([
        RolesCompanion.insert(
          id: guildId,
          guildId: guildId,
          name: '@everyone',
          permissions: Value(sendBits.toString()),
        ),
      ]);
      await db.memberDao.upsertMember(
        MembersCompanion.insert(userId: userId, guildId: guildId),
      );

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          dmViewModelProvider.overrideWith(_EmptyDmViewModel.new),
          guildListViewModelProvider.overrideWith(
            () => _FixedGuildListViewModel(<Guild>[
              const Guild(id: guildId, name: 'Guild', ownerId: ownerId),
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
      final int? bits = container
          .read(channelPermissionCacheProvider.notifier)
          .getChannelBits(channelId);
      expect(bits, isNotNull);

      final ChannelMessagePermissions sync = channelMessagePermissionsFromBits(
        bits: bits!,
        channelType: ChannelType.guildText,
      );

      expect(sync.isResolved, isTrue);
      expect(sync.canSendMessages, isTrue);
      expect(sync.isComposerEnabled, isTrue);
    });
  });

  group('guild channel view-only @everyone', () {
    test('denies send when @everyone has view channel only', () async {
      final FluxerDatabase db = openTestDatabase();
      const String guildId = 'guild_1';
      const String channelId = 'channel_1';
      const String userId = 'user_1';
      const String ownerId = 'owner_1';
      await db.guildDao.upsertServer(
        ServersCompanion.insert(id: guildId, name: 'Guild'),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: guildId,
          name: 'general',
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
            () => _FixedGuildListViewModel(<Guild>[
              const Guild(id: guildId, name: 'Guild', ownerId: ownerId),
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
      final int? bits = container
          .read(channelPermissionCacheProvider.notifier)
          .getChannelBits(channelId);
      expect(bits, isNotNull);

      final ChannelMessagePermissions perms = channelMessagePermissionsFromBits(
        bits: bits!,
        channelType: ChannelType.guildText,
      );

      expect(perms.isResolved, isTrue);
      expect(perms.canSendMessages, isFalse);
      expect(perms.isComposerEnabled, isFalse);
      expect(perms.showsNoSendPermissionHint, isTrue);
    });

    test(
      'denies send after restart when guild list has not emitted yet',
      () async {
        final FluxerDatabase db = openTestDatabase();
        const String guildId = 'guild_1';
        const String channelId = 'channel_1';
        const String userId = 'user_1';
        await db.guildDao.upsertServer(
          ServersCompanion.insert(id: guildId, name: 'Guild'),
        );
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: channelId,
            guildId: guildId,
            name: 'announcements',
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
            dmViewModelProvider.overrideWith(_EmptyDmViewModel.new),
            currentUserIdProvider.overrideWithValue(userId),
            guildListViewModelProvider.overrideWith(
              _EmptyGuildListViewModel.new,
            ),
            userSettingsViewModelProvider.overrideWith(
              () => _FixedUserSettingsViewModel(userId),
            ),
          ],
        );
        addTearDown(container.dispose);

        final ProviderSubscription<AsyncValue<ChannelMessagePermissions>> sub =
            container.listen(
              channelMessagePermissionsProvider(channelId),
              (_, _) {},
            );
        addTearDown(sub.close);

        final ChannelMessagePermissions perms = await container.read(
          channelMessagePermissionsProvider(channelId).future,
        );

        expect(perms.isResolved, isTrue);
        expect(perms.canSendMessages, isFalse);
        expect(perms.isComposerEnabled, isFalse);
        expect(perms.showsNoSendPermissionHint, isTrue);
      },
    );

    test('replaces a cached send allow when the channel denies send', () async {
      final FluxerDatabase db = openTestDatabase();
      const String guildId = 'guild_1';
      const String channelId = 'channel_1';
      const String userId = 'user_1';
      const String ownerId = 'owner_1';
      await db.guildDao.upsertServer(
        ServersCompanion.insert(id: guildId, name: 'Guild'),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: guildId,
          name: 'announcements',
          permissionOverwritesJson: Value(
            jsonEncode(<Map<String, Object>>[
              <String, Object>{
                'id': guildId,
                'type': 0,
                'allow': '0',
                'deny': Permission.sendMessages.value.toString(),
              },
            ]),
          ),
        ),
      );
      await db.roleDao.upsertRoles([
        RolesCompanion.insert(
          id: guildId,
          guildId: guildId,
          name: '@everyone',
          permissions: Value(
            (Permission.viewChannel.value | Permission.sendMessages.value)
                .toString(),
          ),
        ),
      ]);
      await db.memberDao.upsertMember(
        MembersCompanion.insert(userId: userId, guildId: guildId),
      );

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          dmViewModelProvider.overrideWith(_EmptyDmViewModel.new),
          currentUserIdProvider.overrideWithValue(userId),
          guildListViewModelProvider.overrideWith(
            () => _FixedGuildListViewModel(<Guild>[
              const Guild(id: guildId, name: 'Guild', ownerId: ownerId),
            ]),
          ),
          userSettingsViewModelProvider.overrideWith(
            () => _FixedUserSettingsViewModel(userId),
          ),
        ],
      );
      addTearDown(container.dispose);

      container
          .read(channelPermissionCacheProvider.notifier)
          .cacheEffectiveBits(
            channelId: channelId,
            outcome: (
              value:
                  Permission.viewChannel.value | Permission.sendMessages.value,
              shouldCache: true,
            ),
          );

      final ProviderSubscription<AsyncValue<ChannelMessagePermissions>> sub =
          container.listen(
            channelMessagePermissionsProvider(channelId),
            (_, _) {},
          );
      addTearDown(sub.close);

      final ChannelMessagePermissions perms = await container.read(
        channelMessagePermissionsProvider(channelId).future,
      );

      expect(perms.isResolved, isTrue);
      expect(perms.canSendMessages, isFalse);
      expect(perms.isComposerEnabled, isFalse);
      expect(perms.showsNoSendPermissionHint, isTrue);
    });

    test('applies a role send deny once the member row exists', () async {
      final FluxerDatabase db = openTestDatabase();
      const String guildId = 'guild_1';
      const String channelId = 'channel_1';
      const String userId = 'user_1';
      const String ownerId = 'owner_1';
      const String mutedRoleId = 'role_muted';
      await db.guildDao.upsertServer(
        ServersCompanion.insert(id: guildId, name: 'Guild'),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: guildId,
          name: 'general',
          permissionOverwritesJson: Value(
            jsonEncode(<Map<String, Object>>[
              <String, Object>{
                'id': mutedRoleId,
                'type': 0,
                'allow': '0',
                'deny': Permission.sendMessages.value.toString(),
              },
            ]),
          ),
        ),
      );
      await db.roleDao.upsertRoles([
        RolesCompanion.insert(
          id: guildId,
          guildId: guildId,
          name: '@everyone',
          permissions: Value(
            (Permission.viewChannel.value | Permission.sendMessages.value)
                .toString(),
          ),
        ),
        RolesCompanion.insert(
          id: mutedRoleId,
          guildId: guildId,
          name: 'Muted',
          permissions: const Value('0'),
        ),
      ]);

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          dmViewModelProvider.overrideWith(_EmptyDmViewModel.new),
          currentUserIdProvider.overrideWithValue(userId),
          guildListViewModelProvider.overrideWith(
            () => _FixedGuildListViewModel(<Guild>[
              const Guild(id: guildId, name: 'Guild', ownerId: ownerId),
            ]),
          ),
          userSettingsViewModelProvider.overrideWith(
            () => _FixedUserSettingsViewModel(userId),
          ),
        ],
      );
      addTearDown(container.dispose);

      final ProviderSubscription<AsyncValue<ChannelMessagePermissions>>
      permissionsSub = container.listen(
        channelMessagePermissionsProvider(channelId),
        (_, _) {},
      );
      addTearDown(permissionsSub.close);
      final Completer<CurrentUserMemberIdentity> memberReady =
          Completer<CurrentUserMemberIdentity>();
      final ProviderSubscription<AsyncValue<CurrentUserMemberIdentity?>>
      identitySub = container
          .listen(currentUserMemberIdentityProvider(guildId), (
            AsyncValue<CurrentUserMemberIdentity?>? _,
            AsyncValue<CurrentUserMemberIdentity?> next,
          ) {
            final CurrentUserMemberIdentity? identity = next.asData?.value;
            if (identity != null && !memberReady.isCompleted) {
              memberReady.complete(identity);
            }
          }, fireImmediately: true);
      addTearDown(identitySub.close);

      final ChannelMessagePermissions beforeMember = await container.read(
        channelMessagePermissionsProvider(channelId).future,
      );
      expect(beforeMember.canSendMessages, isTrue);

      await db.memberDao.upsertMember(
        MembersCompanion.insert(
          userId: userId,
          guildId: guildId,
          roleIdsJson: Value(jsonEncode(<String>[mutedRoleId])),
        ),
      );
      final CurrentUserMemberIdentity identity = await memberReady.future
          .timeout(const Duration(seconds: 2));
      expect(identity.roleIdsJson, contains(mutedRoleId));

      final ChannelMessagePermissions afterMember = await container.read(
        channelMessagePermissionsProvider(channelId).future,
      );
      expect(afterMember.isResolved, isTrue);
      expect(afterMember.canSendMessages, isFalse);
      expect(afterMember.isComposerEnabled, isFalse);
      expect(afterMember.showsNoSendPermissionHint, isTrue);
    });
  });
}
