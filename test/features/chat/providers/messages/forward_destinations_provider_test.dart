import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/providers/messages/forward_destinations_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';

const String _userId = 'user_1';
const String _ownedGuild = 'guild_owned';
const String _otherGuild = 'guild_other';
const String _memberGuild = 'guild_member';
const int _sendMessagesBit = 1 << 11;

UserSettingsViewState _userSettings() => const UserSettingsViewState(
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

class _FakeGuilds extends GuildListViewModel {
  _FakeGuilds(this._guilds);
  final List<Guild> _guilds;
  @override
  GuildListViewState build() => GuildListViewState(guilds: _guilds);
}

class _FakeUser extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => _userSettings();
}

class _FakeDms extends DmViewModel {
  _FakeDms(this._conversations);
  final List<DmConversation> _conversations;
  @override
  DmViewState build() => DmViewState(
    conversations: _conversations,
    friendsList: const <Friend>[],
    activeTab: FriendsTab.online,
    searchQuery: '',
  );
}

DmConversation _dm(String id, {int type = 1}) => DmConversation(
  id: id,
  type: type,
  recipientId: 'recip_$id',
  recipientName: 'Recipient $id',
  lastMessage: '',
  lastMessageTime: DateTime(2020),
);

Future<FluxerDatabase> _seedDb() async {
  final FluxerDatabase db = FluxerDatabase.forTesting(NativeDatabase.memory());

  Future<void> channel(
    String id,
    String guildId,
    int type, {
    int rateLimit = 0,
  }) {
    return db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: id,
        guildId: guildId,
        name: id,
        type: Value(type),
        rateLimitPerUser: Value(rateLimit),
      ),
    );
  }

  // Owned guild: the user is the owner, so every text/voice channel is sendable
  // and slowmode is bypassed.
  await channel('c_source', _ownedGuild, 0);
  await channel('c_text', _ownedGuild, 0);
  await channel('c_voice', _ownedGuild, 2);
  await channel('c_category', _ownedGuild, 4);
  await channel('c_link', _ownedGuild, 998);

  // Other guild: the user has no membership, so sending is blocked.
  await channel('c_other', _otherGuild, 0);

  // Member guild: @everyone grants SEND_MESSAGES but not BYPASS_SLOWMODE.
  await channel('c_slow', _memberGuild, 0, rateLimit: 10);
  await db.roleDao.upsertRoles(<RolesCompanion>[
    RolesCompanion.insert(
      id: _memberGuild,
      guildId: _memberGuild,
      name: '@everyone',
      permissions: const Value('$_sendMessagesBit'),
    ),
  ]);
  await db.memberDao.upsertMember(
    MembersCompanion.insert(userId: _userId, guildId: _memberGuild),
  );

  // Other guild: the user is a member, but @everyone grants no permissions,
  // so its channels are a genuine missing-send-permission case (loaded data).
  await db.roleDao.upsertRoles(<RolesCompanion>[
    RolesCompanion.insert(
      id: _otherGuild,
      guildId: _otherGuild,
      name: '@everyone',
      permissions: const Value('0'),
    ),
  ]);
  await db.memberDao.upsertMember(
    MembersCompanion.insert(userId: _userId, guildId: _otherGuild),
  );

  return db;
}

ProviderContainer _container(FluxerDatabase db, List<DmConversation> dms) {
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      guildListViewModelProvider.overrideWith(
        () => _FakeGuilds(<Guild>[
          const Guild(id: _ownedGuild, name: 'Owned', ownerId: _userId),
          const Guild(id: _otherGuild, name: 'Other', ownerId: 'someone_else'),
          const Guild(
            id: _memberGuild,
            name: 'Member',
            ownerId: 'someone_else',
          ),
        ]),
      ),
      userSettingsViewModelProvider.overrideWith(_FakeUser.new),
      dmViewModelProvider.overrideWith(() => _FakeDms(dms)),
    ],
  );
}

Future<List<ForwardDestination>> _read(
  ProviderContainer container, {
  bool hasEmbeds = false,
  bool hasAttachments = false,
}) {
  final provider = forwardDestinationsProvider(
    sourceChannelId: 'c_source',
    sourceHasEmbeds: hasEmbeds,
    sourceHasAttachments: hasAttachments,
  );
  // Keep the provider (and its Drift stream dependency) alive past the read so
  // `watchAllChannels` can emit before auto-dispose tears the chain down.
  container.listen(provider, (_, _) {});
  return container.read(provider.future);
}

Future<Map<String, ForwardDestination>> _resolve(
  ProviderContainer container, {
  bool hasEmbeds = false,
  bool hasAttachments = false,
}) async {
  final List<ForwardDestination> result = await _read(
    container,
    hasEmbeds: hasEmbeds,
    hasAttachments: hasAttachments,
  );
  return <String, ForwardDestination>{
    for (final ForwardDestination d in result) d.channelId: d,
  };
}

void main() {
  test(
    'excludes the source channel and non-text-based channel types',
    () async {
      final FluxerDatabase db = await _seedDb();
      addTearDown(db.close);
      final ProviderContainer container = _container(db, <DmConversation>[]);
      addTearDown(container.dispose);

      final Map<String, ForwardDestination> byId = await _resolve(container);

      expect(byId.containsKey('c_source'), isFalse, reason: 'source excluded');
      expect(byId.containsKey('c_category'), isFalse);
      expect(byId.containsKey('c_link'), isFalse);
      expect(byId.containsKey('c_text'), isTrue);
      expect(byId.containsKey('c_voice'), isTrue);
    },
  );

  test('maps guild channel kinds and keeps owner channels sendable', () async {
    final FluxerDatabase db = await _seedDb();
    addTearDown(db.close);
    final ProviderContainer container = _container(db, <DmConversation>[]);
    addTearDown(container.dispose);

    final Map<String, ForwardDestination> byId = await _resolve(container);

    expect(byId['c_text']!.kind, ForwardDestinationKind.guildText);
    expect(byId['c_text']!.disable, ForwardDestinationDisable.none);
    expect(byId['c_text']!.guildName, 'Owned');
    expect(byId['c_voice']!.kind, ForwardDestinationKind.guildVoice);
    expect(byId['c_voice']!.disable, ForwardDestinationDisable.none);
  });

  test('disables channels without send permission', () async {
    final FluxerDatabase db = await _seedDb();
    addTearDown(db.close);
    final ProviderContainer container = _container(db, <DmConversation>[]);
    addTearDown(container.dispose);

    final Map<String, ForwardDestination> byId = await _resolve(container);

    expect(
      byId['c_other']!.disable,
      ForwardDestinationDisable.noSendPermission,
    );
  });

  test('flags slowmode only when the user cannot bypass it', () async {
    final FluxerDatabase db = await _seedDb();
    addTearDown(db.close);
    final ProviderContainer container = _container(db, <DmConversation>[]);
    addTearDown(container.dispose);

    final Map<String, ForwardDestination> byId = await _resolve(container);

    // @everyone can send but cannot bypass slowmode, so it is flagged.
    expect(byId['c_slow']!.disable, ForwardDestinationDisable.none);
    expect(byId['c_slow']!.slowmodeEnabled, isTrue);
    expect(byId['c_slow']!.rateLimitPerUser, 10);
    // The owner bypasses slowmode, so owner channels are never flagged.
    expect(byId['c_text']!.slowmodeEnabled, isFalse);
  });

  test('requires attach-files permission when the message has media', () async {
    final FluxerDatabase db = await _seedDb();
    addTearDown(db.close);
    final ProviderContainer container = _container(db, <DmConversation>[]);
    addTearDown(container.dispose);

    final Map<String, ForwardDestination> byId = await _resolve(
      container,
      hasAttachments: true,
    );

    // @everyone lacks ATTACH_FILES, so a message with media can't go here.
    expect(
      byId['c_slow']!.disable,
      ForwardDestinationDisable.noAttachPermission,
    );
    // The owner has every permission, so owner channels stay sendable.
    expect(byId['c_text']!.disable, ForwardDestinationDisable.none);
  });

  test('includes DMs, group DMs and personal notes as enabled', () async {
    final FluxerDatabase db = await _seedDb();
    addTearDown(db.close);
    final ProviderContainer container = _container(db, <DmConversation>[
      _dm('dm_1'),
      _dm('group_1', type: 3),
      _dm('notes_1', type: 999),
    ]);
    addTearDown(container.dispose);

    final Map<String, ForwardDestination> byId = await _resolve(container);

    expect(byId['dm_1']!.kind, ForwardDestinationKind.dm);
    expect(byId['dm_1']!.disable, ForwardDestinationDisable.none);
    expect(byId['dm_1']!.slowmodeEnabled, isFalse);
    expect(byId['group_1']!.kind, ForwardDestinationKind.group);
    expect(byId['notes_1']!.kind, ForwardDestinationKind.personalNotes);
  });

  test('excludes a DM that is itself the forward source', () async {
    final FluxerDatabase db = await _seedDb();
    addTearDown(db.close);
    final ProviderContainer container = _container(db, <DmConversation>[
      _dm('c_source'),
      _dm('dm_keep'),
    ]);
    addTearDown(container.dispose);

    final List<ForwardDestination> result = await _read(container);
    final Set<String> ids = result
        .map((ForwardDestination d) => d.channelId)
        .toSet();
    expect(ids.contains('c_source'), isFalse);
    expect(ids.contains('dm_keep'), isTrue);
  });

  test('guild send-disabled pre-empts permissions for its channels', () async {
    final FluxerDatabase db = FluxerDatabase.forTesting(
      NativeDatabase.memory(),
    );
    addTearDown(db.close);
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'c_src',
        guildId: 'g_disabled',
        name: 'src',
        type: const Value(0),
      ),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'c_in_disabled',
        guildId: 'g_disabled',
        name: 'general',
        type: const Value(0),
      ),
    );
    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(db),
        guildListViewModelProvider.overrideWith(
          // Owner would have every permission, but the guild disables sending.
          () => _FakeGuilds(const <Guild>[
            Guild(
              id: 'g_disabled',
              name: 'Disabled',
              ownerId: _userId,
              disabledOperations: 1 << 4,
            ),
          ]),
        ),
        userSettingsViewModelProvider.overrideWith(_FakeUser.new),
        dmViewModelProvider.overrideWith(
          () => _FakeDms(const <DmConversation>[]),
        ),
      ],
    );
    addTearDown(container.dispose);

    final provider = forwardDestinationsProvider(
      sourceChannelId: 'c_src',
      sourceHasEmbeds: false,
      sourceHasAttachments: false,
    );
    container.listen(provider, (_, _) {});
    final List<ForwardDestination> result = await container.read(
      provider.future,
    );
    final ForwardDestination dest = result.firstWhere(
      (ForwardDestination d) => d.channelId == 'c_in_disabled',
    );
    expect(dest.disable, ForwardDestinationDisable.guildSendDisabled);
  });

  test('member timeout disables channels in that guild', () async {
    final FluxerDatabase db = FluxerDatabase.forTesting(
      NativeDatabase.memory(),
    );
    addTearDown(db.close);
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'c_src',
        guildId: 'g_timeout',
        name: 'src',
        type: const Value(0),
      ),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'c_timeout',
        guildId: 'g_timeout',
        name: 'general',
        type: const Value(0),
      ),
    );
    await db.roleDao.upsertRoles(<RolesCompanion>[
      RolesCompanion.insert(
        id: 'g_timeout',
        guildId: 'g_timeout',
        name: '@everyone',
        permissions: const Value('$_sendMessagesBit'),
      ),
    ]);
    await db.memberDao.upsertMember(
      MembersCompanion.insert(
        userId: _userId,
        guildId: 'g_timeout',
        communicationDisabledUntil: Value(
          DateTime.now().add(const Duration(hours: 1)),
        ),
      ),
    );
    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(db),
        guildListViewModelProvider.overrideWith(
          () => _FakeGuilds(const <Guild>[
            Guild(id: 'g_timeout', name: 'Timeout', ownerId: 'other'),
          ]),
        ),
        userSettingsViewModelProvider.overrideWith(_FakeUser.new),
        dmViewModelProvider.overrideWith(
          () => _FakeDms(const <DmConversation>[]),
        ),
      ],
    );
    addTearDown(container.dispose);
    // The forward provider only checks the current user's member timeout.
    container.read(currentUserIdProvider.notifier).set(_userId);

    final provider = forwardDestinationsProvider(
      sourceChannelId: 'c_src',
      sourceHasEmbeds: false,
      sourceHasAttachments: false,
    );
    container.listen(provider, (_, _) {});
    final List<ForwardDestination> result = await container.read(
      provider.future,
    );
    final ForwardDestination dest = result.firstWhere(
      (ForwardDestination d) => d.channelId == 'c_timeout',
    );
    // @everyone grants SEND, so the timeout is the only blocker and wins.
    expect(dest.disable, ForwardDestinationDisable.memberTimedOut);
  });

  test(
    'does not block a destination when permission data is not loaded',
    () async {
      final FluxerDatabase db = FluxerDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(db.close);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'c_src',
          guildId: 'g_unloaded',
          name: 'src',
          type: const Value(0),
        ),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'c_unloaded',
          guildId: 'g_unloaded',
          name: 'general',
          type: const Value(0),
        ),
      );
      // The guild is known, but the current user's member row and roles are
      // not seeded and they are not the owner, mirroring a guild not opened
      // yet. Permission resolution returns 0 with shouldCache false, so the
      // destination must not be disabled (the server enforces on send).
      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          guildListViewModelProvider.overrideWith(
            () => _FakeGuilds(const <Guild>[
              Guild(
                id: 'g_unloaded',
                name: 'Unloaded',
                ownerId: 'someone_else',
              ),
            ]),
          ),
          userSettingsViewModelProvider.overrideWith(_FakeUser.new),
          dmViewModelProvider.overrideWith(
            () => _FakeDms(const <DmConversation>[]),
          ),
        ],
      );
      addTearDown(container.dispose);

      final provider = forwardDestinationsProvider(
        sourceChannelId: 'c_src',
        sourceHasEmbeds: false,
        sourceHasAttachments: false,
      );
      container.listen(provider, (_, _) {});
      final List<ForwardDestination> result = await container.read(
        provider.future,
      );
      final ForwardDestination dest = result.firstWhere(
        (ForwardDestination d) => d.channelId == 'c_unloaded',
      );
      expect(dest.disable, ForwardDestinationDisable.none);
    },
  );
}
