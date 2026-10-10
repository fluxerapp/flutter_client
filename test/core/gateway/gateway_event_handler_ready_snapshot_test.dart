import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

void main() {
  Future<void> sendReady(
    GatewayEventHandler handler, {
    required String sessionId,
    List<Map<String, dynamic>> rawGuilds = const <Map<String, dynamic>>[],
    List<ChannelResponse> privateChannels = const <ChannelResponse>[],
    List<Map<String, dynamic>> presences = const <Map<String, dynamic>>[],
    List<Map<String, dynamic>>? users,
    Map<String, String>? notes,
  }) {
    return handler.handle(
      ReadyEvent(
        sessionId: sessionId,
        user: _user(),
        guilds: const [],
        rawGuilds: rawGuilds,
        privateChannels: privateChannels,
        relationships: const [],
        readStates: const [],
        presences: presences,
        users: users,
        notes: notes,
      ),
    );
  }

  group('same-user re-READY presence', () {
    test('users missing from READY presences go offline', () async {
      final FluxerDatabase database = openTestDatabase();
      final GatewayEventHandler handler = GatewayEventHandler(
        database: database,
      );
      final List<Map<String, dynamic>> users = <Map<String, dynamic>>[
        _userPartial('friend-gone'),
        _userPartial('friend-here'),
      ];
      await sendReady(
        handler,
        sessionId: 'session-1',
        users: users,
        presences: <Map<String, dynamic>>[
          _presence('friend-gone', status: 'online', mobile: true),
          _presence('friend-here', status: 'idle'),
        ],
      );
      expect(
        (await database.userDao.getUserById('friend-gone'))?.status,
        'online',
      );

      await sendReady(
        handler,
        sessionId: 'session-2',
        users: users,
        presences: <Map<String, dynamic>>[
          _presence('friend-here', status: 'dnd'),
        ],
      );

      final User? gone = await database.userDao.getUserById('friend-gone');
      expect(gone?.status, 'offline');
      expect(gone?.customStatus, isNull);
      expect(gone?.mobile, isFalse);
      final User? here = await database.userDao.getUserById('friend-here');
      expect(here?.status, 'dnd');
      expect(here?.customStatus, isNotNull);
      expect((await database.userDao.getUserById('100'))?.status, 'online');
    });

    test('an empty READY presence list takes everyone offline', () async {
      final FluxerDatabase database = openTestDatabase();
      final GatewayEventHandler handler = GatewayEventHandler(
        database: database,
      );
      final List<Map<String, dynamic>> users = <Map<String, dynamic>>[
        _userPartial('friend-gone'),
      ];
      await sendReady(
        handler,
        sessionId: 'session-1',
        users: users,
        presences: <Map<String, dynamic>>[
          _presence('friend-gone', status: 'online'),
        ],
      );

      await sendReady(handler, sessionId: 'session-2', users: users);

      expect(
        (await database.userDao.getUserById('friend-gone'))?.status,
        'offline',
      );
    });
  });

  group('guild snapshot replace', () {
    Future<void> waitFor(Future<bool> Function() condition) async {
      for (var i = 0; i < 100; i++) {
        if (await condition()) {
          return;
        }
        await Future<void>.delayed(const Duration(milliseconds: 10));
      }
      fail('condition not met within timeout');
    }

    final Map<String, dynamic> fullGuild = _guild(
      channelIds: <String>['c-kept', 'c-gone'],
      roleIds: <String>['g1', 'r-kept', 'r-gone'],
      emojiIds: <String>['e1'],
      stickerIds: <String>['s1'],
    );
    final Map<String, dynamic> shrunkGuild = _guild(
      channelIds: <String>['c-kept'],
      roleIds: <String>['g1', 'r-kept'],
    );

    test(
      'same-user re-READY drops channels and roles the guild no longer lists',
      () async {
        final FluxerDatabase database = openTestDatabase();
        final List<String> deletedChannelIds = <String>[];
        final GatewayEventHandler handler = GatewayEventHandler(
          database: database,
          onChannelDelete: deletedChannelIds.add,
        );
        await sendReady(
          handler,
          sessionId: 'session-1',
          rawGuilds: <Map<String, dynamic>>[fullGuild],
        );
        await database.channelDao.upsertChannels(<ChannelsCompanion>[
          ChannelsCompanion.insert(
            id: 't-kept',
            guildId: 'g1',
            name: 'thread',
            type: const Value(11),
            parentId: const Value('c-kept'),
          ),
          ChannelsCompanion.insert(
            id: 't-gone',
            guildId: 'g1',
            name: 'thread',
            type: const Value(11),
            parentId: const Value('c-gone'),
          ),
        ]);
        await database.readStateDao.upsertReadStates(<ReadStatesCompanion>[
          ReadStatesCompanion.insert(channelId: 'c-gone'),
        ]);

        await sendReady(
          handler,
          sessionId: 'session-2',
          rawGuilds: <Map<String, dynamic>>[shrunkGuild],
        );

        expect(
          (await database.channelDao.getChannels(
            'g1',
            includeThreads: true,
          )).map((Channel channel) => channel.id).toSet(),
          <String>{'c-kept', 't-kept'},
        );
        expect(
          (await database.roleDao.getRoles(
            'g1',
          )).map((Role role) => role.id).toSet(),
          <String>{'g1', 'r-kept'},
        );
        expect(await database.readStateDao.getReadState('c-gone'), isNull);
        expect(await database.guildEmojiDao.getById('e1'), isNull);
        expect(await database.guildStickerDao.getAll(), isEmpty);
        expect(deletedChannelIds, containsAll(<String>['c-gone', 't-gone']));
      },
    );

    test(
      'GUILD_SYNC drops channels, roles, emojis and stickers it omits',
      () async {
        final FluxerDatabase database = openTestDatabase();
        final List<String> deletedChannelIds = <String>[];
        final List<String> permissionGuildIds = <String>[];
        final GatewayEventHandler handler = GatewayEventHandler(
          database: database,
          onChannelDelete: deletedChannelIds.add,
          onGuildPermissionsChanged: permissionGuildIds.add,
        );
        await sendReady(
          handler,
          sessionId: 'session-1',
          rawGuilds: <Map<String, dynamic>>[fullGuild],
        );
        expect(await database.channelDao.getChannelById('c-gone'), isNotNull);
        expect(await database.guildEmojiDao.getById('e1'), isNotNull);

        await handler.handle(
          GuildSyncEvent(guild: GuildCreateData.fromJson(shrunkGuild)),
        );
        await waitFor(() async => deletedChannelIds.isNotEmpty);

        expect(
          (await database.channelDao.getChannels(
            'g1',
          )).map((Channel channel) => channel.id).toSet(),
          <String>{'c-kept'},
        );
        expect(
          (await database.roleDao.getRoles(
            'g1',
          )).map((Role role) => role.id).toSet(),
          <String>{'g1', 'r-kept'},
        );
        expect(await database.guildEmojiDao.getById('e1'), isNull);
        expect(await database.guildStickerDao.getAll(), isEmpty);
        expect(deletedChannelIds, <String>['c-gone']);
        expect(permissionGuildIds, <String>['g1']);
      },
    );
  });

  group('same-user re-READY account data', () {
    test('notes missing from the READY map are removed', () async {
      final FluxerDatabase database = openTestDatabase();
      final GatewayEventHandler handler = GatewayEventHandler(
        database: database,
      );
      await sendReady(
        handler,
        sessionId: 'session-1',
        notes: <String, String>{'u1': 'kept', 'u2': 'deleted elsewhere'},
      );

      await sendReady(
        handler,
        sessionId: 'session-2',
        notes: <String, String>{'u1': 'kept'},
      );

      expect((await database.userNotesDao.getNote('u1'))?.content, 'kept');
      expect(await database.userNotesDao.getNote('u2'), isNull);

      await sendReady(
        handler,
        sessionId: 'session-3',
        notes: <String, String>{},
      );

      expect(await database.userNotesDao.getNote('u1'), isNull);
    });

    test('DMs missing from READY private_channels are removed', () async {
      final FluxerDatabase database = openTestDatabase();
      final List<String> deletedChannelIds = <String>[];
      final GatewayEventHandler handler = GatewayEventHandler(
        database: database,
        onChannelDelete: deletedChannelIds.add,
      );
      await sendReady(
        handler,
        sessionId: 'session-1',
        privateChannels: <ChannelResponse>[
          _dmChannel('dm-kept', recipientId: 'u1'),
          _dmChannel('dm-closed', recipientId: 'u2'),
        ],
      );
      await database.readStateDao.upsertReadStates(<ReadStatesCompanion>[
        ReadStatesCompanion.insert(channelId: 'dm-closed'),
      ]);

      await sendReady(
        handler,
        sessionId: 'session-2',
        privateChannels: <ChannelResponse>[
          _dmChannel('dm-kept', recipientId: 'u1'),
        ],
      );

      expect(
        (await database.dmChannelDao.getDmChannels())
            .map((DmChannel channel) => channel.id)
            .toSet(),
        <String>{'dm-kept', '100'},
      );
      expect(await database.readStateDao.getReadState('dm-closed'), isNull);
      expect(deletedChannelIds, <String>['dm-closed']);

      await sendReady(handler, sessionId: 'session-3');

      expect(
        (await database.dmChannelDao.getDmChannels())
            .map((DmChannel channel) => channel.id)
            .toSet(),
        <String>{'100'},
      );
    });
  });
}

Map<String, dynamic> _userPartial(String id) => <String, dynamic>{
  'id': id,
  'username': 'user-$id',
  'discriminator': '0001',
  'global_name': null,
  'avatar': null,
  'avatar_color': null,
  'flags': 0,
};

Map<String, dynamic> _presence(
  String userId, {
  required String status,
  bool mobile = false,
}) => <String, dynamic>{
  'user': _userPartial(userId),
  'status': status,
  'mobile': mobile,
  'afk': false,
  'custom_status': <String, dynamic>{'text': 'busy'},
};

ChannelResponse _dmChannel(String id, {required String recipientId}) =>
    ChannelResponse.fromJson(<String, Object?>{
      'id': id,
      'type': 1,
      'last_message_id': null,
      'recipients': <Map<String, dynamic>>[_userPartial(recipientId)],
    });

Map<String, dynamic> _guild({
  required List<String> channelIds,
  required List<String> roleIds,
  List<String> emojiIds = const <String>[],
  List<String> stickerIds = const <String>[],
}) => <String, dynamic>{
  'id': 'g1',
  'properties': <String, dynamic>{
    'id': 'g1',
    'name': 'Guild g1',
    'splash_card_alignment': 0,
    'owner_id': '100',
    'system_channel_flags': 0,
    'afk_timeout': 300,
    'features': <String>[],
    'verification_level': 0,
    'mfa_level': 0,
    'nsfw_level': 0,
    'nsfw': false,
    'content_warning_level': 0,
    'explicit_content_filter': 0,
    'default_message_notifications': 0,
    'disabled_operations': 0,
  },
  'channels': <Map<String, Object?>>[
    for (final String id in channelIds)
      <String, Object?>{
        'id': id,
        'type': 0,
        'guild_id': 'g1',
        'name': id,
        'position': 0,
      },
  ],
  'members': <Map<String, Object?>>[],
  'roles': <Map<String, Object?>>[
    for (final String id in roleIds)
      <String, Object?>{
        'id': id,
        'name': id,
        'color': 0,
        'position': 0,
        'permissions': '0',
        'hoist': false,
        'mentionable': false,
      },
  ],
  'presences': <Map<String, Object?>>[],
  'voice_states': <Map<String, Object?>>[],
  'emojis': <Map<String, Object?>>[
    for (final String id in emojiIds)
      <String, Object?>{'id': id, 'name': id, 'animated': false, 'nsfw': false},
  ],
  'stickers': <Map<String, Object?>>[
    for (final String id in stickerIds)
      <String, Object?>{
        'id': id,
        'name': id,
        'description': '',
        'tags': <String>[],
        'animated': false,
        'nsfw': false,
      },
  ],
};

UserPrivateResponse _user() => UserPrivateResponse.fromJson({
  'id': '100',
  'username': 'tester',
  'discriminator': '0001',
  'global_name': null,
  'avatar': null,
  'avatar_color': null,
  'bot': false,
  'system': false,
  'flags': 0,
  'is_staff': false,
  'acls': <String>[],
  'traits': <String>[],
  'email': null,
  'phone': null,
  'bio': null,
  'pronouns': null,
  'accent_color': null,
  'banner': null,
  'banner_color': null,
  'mfa_enabled': false,
  'verified': true,
  'has_verified_phone': false,
  'premium_type': null,
  'premium_since': null,
  'premium_until': null,
  'premium_will_cancel': false,
  'premium_billing_cycle': null,
  'premium_lifetime_sequence': null,
  'premium_badge_hidden': false,
  'premium_badge_masked': false,
  'premium_badge_timestamp_hidden': false,
  'premium_badge_sequence_hidden': false,
  'premium_purchase_disabled': false,
  'premium_enabled_override': false,
  'premium_discriminator': false,
  'premium_perks_disabled': false,
  'password_last_changed_at': null,
  'required_actions': <String>[],
  'nsfw_allowed': true,
  'has_dismissed_premium_onboarding': false,
  'has_ever_purchased': false,
  'has_unread_gift_inventory': false,
  'unread_gift_inventory_count': 0,
  'used_mobile_client': true,
  'pending_bulk_message_deletion': null,
});
