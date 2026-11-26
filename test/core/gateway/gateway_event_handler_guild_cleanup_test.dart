import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:fluxer_dart/gateway_client/event_parser.dart';

import '../../helpers/open_test_database.dart';

void main() {
  _resyncTests();
  group('guild membership cleanup', () {
    Future<
      ({
        GatewayEventHandler handler,
        FluxerDatabase database,
        List<String> evictedGuildIds,
      })
    >
    buildHandler() async {
      final database = openTestDatabase();
      final evictedGuildIds = <String>[];
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
        onGuildPermissionsEvict: (String guildId, List<String> _) =>
            evictedGuildIds.add(guildId),
      );
      return (
        handler: handler,
        database: database,
        evictedGuildIds: evictedGuildIds,
      );
    }

    Future<void> sendReady(
      GatewayEventHandler handler, {
      List<Map<String, dynamic>> rawGuilds = const [],
      String sessionId = 'session-1',
    }) {
      return handler.handle(
        ReadyEvent(
          sessionId: sessionId,
          user: _user(),
          rawGuilds: rawGuilds,
          privateChannels: const [],
          relationships: const [],
          readStates: const [],
          presences: const [],
        ),
      );
    }

    for (final (String name, bool owned) in <(String, bool)>[
      ('diffs against a cache the user owns', true),
      ('wipes a cache the user does not own', false),
    ]) {
      test('first READY of a process $name', () async {
        final database = openTestDatabase();
        await database.guildDao.upsertServer(
          ServersCompanion.insert(id: '200', name: 'Kept Guild'),
        );
        await database.guildDao.upsertServer(
          ServersCompanion.insert(id: 'left', name: 'Left Guild'),
        );
        await database.userDao.upsertUser(
          UsersCompanion.insert(id: 'cached-user', username: 'cached'),
        );
        final List<String> ownerChecks = <String>[];
        final handler = GatewayEventHandler(
          database: database,
          currentUserId: '100',
          isCacheOwnedBy: (String userId) async {
            ownerChecks.add(userId);
            return owned;
          },
        );

        await sendReady(handler, rawGuilds: [_guildRaw(id: '200')]);

        expect(ownerChecks, <String>['100']);
        expect(await database.guildDao.getServerById('200'), isNotNull);
        expect(await database.guildDao.getServerById('left'), isNull);
        expect(
          await database.userDao.getUserById('cached-user'),
          owned ? isNotNull : isNull,
        );

        await sendReady(
          handler,
          rawGuilds: [_guildRaw(id: '200')],
          sessionId: 'session-2',
        );
        expect(ownerChecks, hasLength(1));
      });
    }

    test(
      'a cached READY with no guilds drops the guild the user left',
      () async {
        final database = openTestDatabase();
        await database.guildDao.upsertServer(
          ServersCompanion.insert(id: 'left', name: 'Left Guild'),
        );
        await database.channelDao.upsertChannel(
          ChannelsCompanion.insert(id: 'left-chan', guildId: 'left', name: 'x'),
        );
        final handler = GatewayEventHandler(
          database: database,
          currentUserId: '100',
          isCacheOwnedBy: (String userId) async => true,
        );

        await sendReady(handler);

        expect(await database.guildDao.getServerById('left'), isNull);
        expect(await database.channelDao.getChannelById('left-chan'), isNull);
      },
    );

    test('incremental READY prunes guilds missing from payload', () async {
      final ctx = await buildHandler();
      await sendReady(ctx.handler, rawGuilds: [_guildRaw(id: '200')]);
      await ctx.database.guildDao.upsertServer(
        ServersCompanion.insert(id: 'stale', name: 'Stale Guild'),
      );

      await sendReady(
        ctx.handler,
        rawGuilds: [_guildRaw(id: '200')],
        sessionId: 'session-2',
      );

      expect(await ctx.database.guildDao.getServerById('200'), isNotNull);
      expect(await ctx.database.guildDao.getServerById('stale'), isNull);
      expect(ctx.evictedGuildIds, contains('stale'));
    });

    test(
      'incremental READY keeps unavailable guilds listed in payload',
      () async {
        final ctx = await buildHandler();
        await sendReady(ctx.handler, rawGuilds: [_guildRaw(id: '200')]);
        await ctx.database.guildDao.upsertServer(
          ServersCompanion.insert(
            id: 'unavailable',
            name: 'Unavailable Guild',
            unavailable: const Value(true),
          ),
        );

        await sendReady(
          ctx.handler,
          rawGuilds: [
            _guildRaw(id: '200'),
            {'id': 'unavailable', 'unavailable': true},
          ],
          sessionId: 'session-2',
        );

        expect(
          await ctx.database.guildDao.getServerById('unavailable'),
          isNotNull,
        );
      },
    );

    test(
      'READY writes the own member when its user is only an id reference',
      () async {
        final ctx = await buildHandler();

        await sendReady(
          ctx.handler,
          rawGuilds: [
            {
              ..._guildRaw(id: '200'),
              'members': <Map<String, Object?>>[
                <String, Object?>{
                  'user': <String, Object?>{'id': '100'},
                  'roles': <String>['300'],
                  'joined_at': '2026-10-01T00:00:00.000Z',
                  'mute': false,
                  'deaf': false,
                },
              ],
            },
          ],
        );

        final Member? own = await ctx.database.memberDao.getMemberByUserId(
          '100',
          '200',
        );
        expect(own?.roleIdsJson, '["300"]');
      },
    );

    test('GUILD_MEMBER_REMOVE for current user removes guild', () async {
      final ctx = await buildHandler();
      await ctx.database.guildDao.upsertServer(
        ServersCompanion.insert(id: 'g1', name: 'Guild One'),
      );

      await ctx.handler.handle(
        const GuildMemberRemoveEvent(guildId: 'g1', userId: '100'),
      );
      await Future<void>.delayed(Duration.zero);

      expect(await ctx.database.guildDao.getServerById('g1'), isNull);
      expect(ctx.evictedGuildIds, contains('g1'));
    });

    test('GUILD_MEMBER_REMOVE for another user keeps guild', () async {
      final ctx = await buildHandler();
      await ctx.database.guildDao.upsertServer(
        ServersCompanion.insert(id: 'g1', name: 'Guild One'),
      );
      await ctx.database.memberDao.upsertMember(
        MembersCompanion.insert(userId: '999', guildId: 'g1'),
      );

      await ctx.handler.handle(
        const GuildMemberRemoveEvent(guildId: 'g1', userId: '999'),
      );
      await Future<void>.delayed(Duration.zero);

      expect(await ctx.database.guildDao.getServerById('g1'), isNotNull);
      expect(ctx.evictedGuildIds, isEmpty);
    });

    test('GUILD_DELETE removes guild from local db', () async {
      final ctx = await buildHandler();
      await ctx.database.guildDao.upsertServer(
        ServersCompanion.insert(id: 'g1', name: 'Guild One'),
      );

      await ctx.handler.handle(const GuildDeleteEvent(guildId: 'g1'));
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(await ctx.database.guildDao.getServerById('g1'), isNull);
      expect(ctx.evictedGuildIds, contains('g1'));
    });

    test('GUILD_DELETE unavailable keeps server and clears content', () async {
      final ctx = await buildHandler();
      await ctx.database.guildDao.upsertServer(
        ServersCompanion.insert(id: 'g1', name: 'Guild One'),
      );
      await ctx.database.channelDao.upsertChannelsMerged([
        ChannelsCompanion.insert(
          id: 'c1',
          guildId: 'g1',
          name: 'general',
          type: const Value(0),
        ),
      ]);

      await ctx.handler.handle(
        const GuildDeleteEvent(guildId: 'g1', unavailable: true),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));

      final server = await ctx.database.guildDao.getServerById('g1');
      expect(server, isNotNull);
      expect(server!.unavailable, isTrue);
      expect(await ctx.database.channelDao.getChannels('g1'), isEmpty);
      expect(ctx.evictedGuildIds, contains('g1'));
    });

    test('GUILD_DELETE ends voice for a guild that is gone', () async {
      final database = openTestDatabase();
      final endedGuildIds = <String>[];
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
        onGuildVoiceEnded: endedGuildIds.add,
      );

      await handler.handle(const GuildDeleteEvent(guildId: 'g1'));
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(endedGuildIds, <String>['g1']);
    });

    test('GUILD_DELETE ends voice for a guild that went unavailable', () async {
      final database = openTestDatabase();
      final endedGuildIds = <String>[];
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
        onGuildVoiceEnded: endedGuildIds.add,
      );

      await handler.handle(
        const GuildDeleteEvent(guildId: 'g1', unavailable: true),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(endedGuildIds, <String>['g1']);
    });

    test(
      'GUILD_CREATE reports the guild available once members are stored',
      () async {
        final database = openTestDatabase();
        final memberReads = <Future<Member?>>[];
        final handler = GatewayEventHandler(
          database: database,
          currentUserId: '100',
          onGuildAvailable: (String guildId, {required bool synced}) =>
              memberReads.add(
                database.memberDao.getMemberByUserId('100', guildId),
              ),
        );
        await handler.handle(
          const GuildDeleteEvent(guildId: 'g1', unavailable: true),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        await handler.handle(
          GuildCreateEvent(
            guild: GuildCreateData.fromJson({
              ..._guildRaw(id: 'g1'),
              'members': <Map<String, Object?>>[
                {
                  'user': {
                    'id': '100',
                    'username': 'phonetest',
                    'discriminator': '0001',
                    'global_name': null,
                    'avatar': null,
                    'avatar_color': null,
                    'flags': 0,
                  },
                  'nick': 'PT Nick',
                  'roles': <String>[],
                  'joined_at': '2026-01-01T00:00:00.000Z',
                  'mute': false,
                  'deaf': false,
                },
              ],
            }),
          ),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(memberReads, hasLength(1));
        expect((await memberReads.single)?.nick, 'PT Nick');
      },
    );

    test(
      'GUILD_DELETE during a GUILD_CREATE write keeps the guild unavailable',
      () async {
        final database = openTestDatabase();
        final availability = <String>[];
        final handler = GatewayEventHandler(
          database: database,
          currentUserId: '100',
          onGuildAvailable: (String guildId, {required bool synced}) =>
              availability.add('available'),
          onGuildAvailabilityChanged:
              (
                String guildId, {
                required bool unavailable,
                bool unavailableHidden = false,
              }) => availability.add(unavailable ? 'unavailable' : 'removed'),
        );

        final created = handler.handle(
          GuildCreateEvent(
            guild: GuildCreateData.fromJson(_guildRaw(id: 'g1')),
          ),
        );
        final deleted = handler.handle(
          const GuildDeleteEvent(guildId: 'g1', unavailable: true),
        );
        await Future.wait(<Future<void>>[created, deleted]);
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(availability, <String>['unavailable']);
      },
    );

    test('incomplete GUILD_CREATE marks guild unavailable', () async {
      final ctx = await buildHandler();
      await ctx.database.guildDao.upsertServer(
        ServersCompanion.insert(id: 'g1', name: 'Guild One'),
      );
      await ctx.handler.handle(
        GuildCreateEvent(
          guild: GuildCreateData.fromJson({
            'id': 'g1',
            'properties': {
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
          }),
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));

      final server = await ctx.database.guildDao.getServerById('g1');
      expect(server, isNotNull);
      expect(server!.unavailable, isTrue);
    });
  });
}

void _resyncTests() {
  group('gateway resync', () {
    const EventParser parser = EventParser();

    ReadyEvent readyFor(String userId) => ReadyEvent(
      sessionId: 'session-1',
      user: UserPrivateResponse.fromJson(<String, Object?>{
        ..._user().toJson(),
        'id': userId,
      }),
      rawGuilds: [_guildRaw(id: '200')],
      privateChannels: const [],
      relationships: const [],
      readStates: const [],
      presences: const [],
    );

    test('GUILD_CREATE always asks for a permission recompute', () async {
      final database = openTestDatabase();
      final List<String> changed = <String>[];
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
        onGuildPermissionsChanged: changed.add,
      );

      await handler.handle(
        GuildCreateEvent(guild: GuildCreateData.fromJson(_guildRaw(id: 'g1'))),
      );

      expect(changed, <String>['g1']);
    });

    test(
      'GUILD_DELETE unavailable evicts the guild channels it removed',
      () async {
        final database = openTestDatabase();
        final List<List<String>> evicted = <List<String>>[];
        final handler = GatewayEventHandler(
          database: database,
          currentUserId: '100',
          onGuildPermissionsEvict: (_, List<String> channelIds) =>
              evicted.add(channelIds),
        );
        await handler.handle(
          GuildCreateEvent(
            guild: GuildCreateData.fromJson({
              ..._guildRaw(id: 'g1'),
              'channels': <Map<String, Object?>>[_channelRaw('c1', 'g1')],
            }),
          ),
        );

        await handler.handle(
          const GuildDeleteEvent(guildId: 'g1', unavailable: true),
        );

        expect(evicted, <List<String>>[
          <String>['c1'],
        ]);
        expect(await database.channelDao.getChannelById('c1'), isNull);
        expect(
          (await database.guildDao.getServerById('g1'))?.unavailable,
          true,
        );
      },
    );

    test('an outage keeps drafts and a removal drops them', () async {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
      );
      final GuildCreateEvent create = GuildCreateEvent(
        guild: GuildCreateData.fromJson({
          ..._guildRaw(id: 'g1'),
          'channels': <Map<String, Object?>>[_channelRaw('c1', 'g1')],
        }),
      );
      await handler.handle(create);
      await database.composerDraftDao.upsertDraft(
        channelId: 'c1',
        content: 'draft',
      );

      await handler.handle(
        const GuildDeleteEvent(guildId: 'g1', unavailable: true),
      );
      expect(await database.composerDraftDao.getDraft('c1'), isNotNull);

      await handler.handle(create);
      await handler.handle(const GuildDeleteEvent(guildId: 'g1'));
      expect(await database.composerDraftDao.getDraft('c1'), isNull);
    });

    test('GUILD_CREATE right after an outage keeps the fresh data', () async {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
      );
      final GuildCreateEvent create = GuildCreateEvent(
        guild: GuildCreateData.fromJson({
          ..._guildRaw(id: 'g1'),
          'channels': <Map<String, Object?>>[_channelRaw('c1', 'g1')],
        }),
      );
      await handler.handle(create);

      await handler.handle(
        const GuildDeleteEvent(guildId: 'g1', unavailable: true),
      );
      await handler.handle(create);

      expect(await database.channelDao.getChannelById('c1'), isNotNull);
      expect((await database.guildDao.getServerById('g1'))?.unavailable, false);
    });

    test('GUILD_UPDATE keeps the guild position', () async {
      final database = openTestDatabase();
      await database.guildDao.upsertServer(
        ServersCompanion.insert(
          id: 'g1',
          name: 'Guild g1',
          position: const Value(7),
        ),
      );
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
      );

      await handler.handle(
        GuildUpdateEvent(guild: GuildCreateData.fromJson(_guildRaw(id: 'g1'))),
      );

      expect((await database.guildDao.getServerById('g1'))?.position, 7);
    });

    test('READY clears permission caches after its data is written', () async {
      final database = openTestDatabase();
      final List<String> order = <String>[];
      late final GatewayEventHandler handler;
      handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
        onPermissionsClearAll: () async {
          order.add('clear');
          final Server? guild = await database.guildDao.getServerById('200');
          order.add(guild == null ? 'missing' : 'present');
        },
        onReady: () => order.add('ready'),
      );

      await handler.handle(readyFor('100'));
      await Future<void>.delayed(const Duration(milliseconds: 20));

      expect(order, <String>['clear', 'ready', 'present']);
    });

    test('READY for another account is rejected before any write', () async {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
        resolveCurrentUserId: () => '100',
      );

      await expectLater(handler.handle(readyFor('999')), throwsStateError);
      expect(await database.guildDao.getServerById('200'), isNull);
    });

    test('CHANNEL_DELETE drops drafts and mention rows', () async {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
      );
      await handler.handle(
        parser.parse('CHANNEL_CREATE', _channelRaw('c1', 'g1')),
      );
      await database.composerDraftDao.upsertDraft(
        channelId: 'c1',
        content: 'draft',
      );
      await database.notificationDao.prependMentionRow(
        messageId: 'm1',
        channelId: 'c1',
      );

      await handler.handle(
        parser.parse('CHANNEL_DELETE', <String, Object?>{
          'guild_id': 'g1',
          'id': 'c1',
        }),
      );

      expect(await database.composerDraftDao.getDraft('c1'), isNull);
      expect(await database.notificationDao.maxMentionOrdinal(), isNull);
    });

    test('MESSAGE_DELETE removes the saved message entry', () async {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
      );
      await database.savedMessageDao.addSavedMessage('m1');

      await handler.handle(
        const MessageDeleteEvent(messageId: 'm1', channelId: 'c1'),
      );

      expect(await database.savedMessageDao.isSaved('m1'), isFalse);
    });

    test('OPERATOR_PASS_UPDATE reaches the handler callback', () async {
      final database = openTestDatabase();
      final List<int> counts = <int>[];
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
        onOperatorPassUpdate: (OperatorPassPassesResponse passes) =>
            counts.add(passes.count),
      );

      await handler.handle(
        parser.parse('OPERATOR_PASS_UPDATE', <String, Object?>{'count': 2}),
      );

      expect(counts, <int>[2]);
    });
  });
}

Map<String, Object?> _channelRaw(String id, String guildId) =>
    <String, Object?>{
      'content_warning_level': 0,
      'content_warning_text': null,
      'guild_id': guildId,
      'id': id,
      'last_message_id': null,
      'last_pin_timestamp': null,
      'name': 'general',
      'nsfw': false,
      'nsfw_override': null,
      'parent_id': null,
      'permission_overwrites': <Object?>[],
      'position': 0,
      'rate_limit_per_user': 0,
      'topic': null,
      'type': 0,
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

Map<String, dynamic> _guildRaw({required String id}) => {
  'id': id,
  'properties': {
    'id': id,
    'name': 'Guild $id',
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
  'channels': <Map<String, Object?>>[],
  'members': <Map<String, Object?>>[],
  'roles': <Map<String, Object?>>[],
  'presences': <Map<String, Object?>>[],
  'voice_states': <Map<String, Object?>>[],
  'emojis': <Map<String, Object?>>[],
  'stickers': <Map<String, Object?>>[],
};
