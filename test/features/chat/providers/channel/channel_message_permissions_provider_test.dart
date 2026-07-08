import 'dart:async';

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

void main() {
  group('channelMessagePermissionsForComposer', () {
    test('loading maps to unresolved not deny', () {
      final ChannelMessagePermissions perms =
          channelMessagePermissionsForComposer(
            const AsyncValue<ChannelMessagePermissions>.loading(),
          );
      expect(perms, ChannelMessagePermissions.unresolved);
      expect(perms.isComposerEnabled, isTrue);
      expect(perms.showsNoSendPermissionHint, isFalse);
    });

    test('error maps to unresolved not deny', () {
      final ChannelMessagePermissions perms =
          channelMessagePermissionsForComposer(
            AsyncValue<ChannelMessagePermissions>.error(
              Exception('test'),
              StackTrace.empty,
            ),
          );
      expect(perms, ChannelMessagePermissions.unresolved);
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

    test('unresolved keeps attach and voice aligned with input', () {
      const ChannelMessagePermissions perms =
          ChannelMessagePermissions.unresolved;
      expect(perms.isComposerEnabled, isTrue);
      expect(perms.canShowAttachControls, isTrue);
      expect(perms.isVoiceEnabled, isTrue);
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
    test('does not cache bits when guild list is not hydrated', () async {
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
          guildListViewModelProvider.overrideWith(_EmptyGuildListViewModel.new),
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
        equals(null),
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
  });
}
