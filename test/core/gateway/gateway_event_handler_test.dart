import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/features/chat/domain/message.dart' as domain;
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

void main() {
  group('reaction remove', () {
    const currentUserId = '100';
    const messageId = '500';
    const channelId = '200';
    const thumbsUp = ReactionEmoji(name: '👍');

    Future<FluxerDatabase> createDatabase({
      required int count,
      required bool hasReacted,
    }) async {
      final database = openTestDatabase();
      await database.messageDao.upsertMessage(
        domain.Message(
          id: messageId,
          channelId: channelId,
          authorId: '300',
          authorName: 'author',
          content: 'hello',
          timestamp: DateTime.utc(2026, 1, 2),
          reactions: [
            domain.Reaction(
              emoji: thumbsUp.name,
              count: count,
              hasReacted: hasReacted,
            ),
          ],
        ).toCompanion(),
      );
      return database;
    }

    Future<domain.Reaction?> loadReaction(FluxerDatabase database) async {
      final row = await database.messageDao.getMessage(messageId);
      expect(row, isNotNull);
      final reactions = (jsonDecode(row!.reactionsJson) as List<dynamic>)
          .cast<Map<String, dynamic>>();
      if (reactions.isEmpty) {
        return null;
      }
      return domain.Reaction.fromJson(reactions.single);
    }

    Future<void> dispatchRemove({
      required FluxerDatabase database,
      required String userId,
    }) async {
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: currentUserId,
      );
      await handler.handle(
        MessageReactionRemoveEvent(
          channelId: channelId,
          messageId: messageId,
          userId: userId,
          emoji: thumbsUp,
        ),
      );
    }

    test(
      'skips duplicate decrement when current user already unreacted locally',
      () async {
        final database = await createDatabase(count: 2, hasReacted: false);
        await dispatchRemove(database: database, userId: currentUserId);
        final reaction = await loadReaction(database);
        expect(reaction, isNotNull);
        expect(reaction!.count, 2);
        expect(reaction.hasReacted, isFalse);
      },
    );

    test('decrements when current user still has hasReacted true', () async {
      final database = await createDatabase(count: 2, hasReacted: true);
      await dispatchRemove(database: database, userId: currentUserId);
      final reaction = await loadReaction(database);
      expect(reaction, isNotNull);
      expect(reaction!.count, 1);
      expect(reaction.hasReacted, isFalse);
    });

    test('decrements for other users without touching hasReacted', () async {
      final database = await createDatabase(count: 2, hasReacted: true);
      await dispatchRemove(database: database, userId: '999');
      final reaction = await loadReaction(database);
      expect(reaction, isNotNull);
      expect(reaction!.count, 1);
      expect(reaction.hasReacted, isTrue);
    });
  });

  test('READY applies voice states after onReady', () async {
    final database = openTestDatabase();
    var readyCalled = false;
    final bulkCalls = <List<VoiceState>>[];

    final handler = GatewayEventHandler(
      database: database,
      onReady: () {
        readyCalled = true;
      },
      onVoiceStatesBulk: bulkCalls.add,
    );

    await handler.handle(
      ReadyEvent(
        sessionId: 'session-id',
        user: _user(),
        guilds: const [],
        rawGuilds: [_guildWithVoiceState()],
        privateChannels: const [],
        relationships: const [],
        readStates: const [],
        presences: const [],
      ),
    );

    expect(readyCalled, isTrue);
    expect(bulkCalls, hasLength(1));
    expect(bulkCalls.single, hasLength(1));
    expect(bulkCalls.single.single.userId, '400');
    expect(bulkCalls.single.single.channelId, 'voice-1');
    expect(bulkCalls.single.single.guildId, '200');
  });

  test('READY persists guild stickers from raw guild payload', () async {
    final database = openTestDatabase();

    final handler = GatewayEventHandler(database: database);

    await handler.handle(
      ReadyEvent(
        sessionId: 'session-id',
        user: _user(),
        guilds: const [],
        rawGuilds: [_guildWithSticker()],
        privateChannels: const [],
        relationships: const [],
        readStates: const [],
        presences: const [],
      ),
    );

    final stickers = await database.guildStickerDao.getByGuild('200');

    expect(stickers, hasLength(1));
    expect(stickers.single.id, '300');
    expect(stickers.single.name, 'Blob Wave');
    expect(stickers.single.description, 'Waving blob');
    expect(stickers.single.tagsJson, '["wave","hello"]');
    expect(stickers.single.animated, isFalse);
  });

  test(
    'READY bulk fanout persists channels and members across guilds',
    () async {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(database: database);

      await handler.handle(
        ReadyEvent(
          sessionId: 'session-id',
          user: _user(),
          guilds: const [],
          rawGuilds: [
            _guildWithChannelAndMember(
              guildId: 'g-a',
              channelId: 'c-a',
              memberUserId: 'u-a',
            ),
            _guildWithChannelAndMember(
              guildId: 'g-b',
              channelId: 'c-b',
              memberUserId: 'u-b',
            ),
          ],
          privateChannels: const [],
          relationships: const [],
          readStates: const [],
          presences: const [],
        ),
      );

      expect(await database.channelDao.getChannelById('c-a'), isNotNull);
      expect(await database.channelDao.getChannelById('c-b'), isNotNull);
      expect(
        await database.memberDao.getMemberByUserId('u-a', 'g-a'),
        isNotNull,
      );
      expect(
        await database.memberDao.getMemberByUserId('u-b', 'g-b'),
        isNotNull,
      );
      expect(await database.userDao.getUserById('u-a'), isNotNull);
      expect(await database.userDao.getUserById('u-b'), isNotNull);

      // Multi-guild bulk must attribute cache access under the correct guild.
      final accessA = await database
          .customSelect(
            'SELECT guild_id, user_id FROM member_cache_access '
            "WHERE user_id = 'u-a'",
          )
          .getSingle();
      final accessB = await database
          .customSelect(
            'SELECT guild_id, user_id FROM member_cache_access '
            "WHERE user_id = 'u-b'",
          )
          .getSingle();
      expect(accessA.read<String>('guild_id'), 'g-a');
      expect(accessB.read<String>('guild_id'), 'g-b');
    },
  );

  group('member-load permission refresh', () {
    const memberGuildId = 'g1';

    ({GatewayEventHandler handler, FluxerDatabase database}) build(
      List<String> captured,
    ) {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
        onGuildPermissionsChanged: (guildId) => captured.add(guildId),
      );
      return (handler: handler, database: database);
    }

    test('member add for the current user refreshes permissions', () async {
      final captured = <String>[];
      final ctx = build(captured);
      await ctx.handler.handle(
        GuildMemberAddEvent(guildId: memberGuildId, member: _member('100')),
      );
      expect(captured, <String>[memberGuildId]);
      await ctx.database.memberDao.countMembers(memberGuildId);
    });

    test('member add for another user does not refresh', () async {
      final captured = <String>[];
      final ctx = build(captured);
      await ctx.handler.handle(
        GuildMemberAddEvent(guildId: memberGuildId, member: _member('999')),
      );
      expect(captured, isEmpty);
      await ctx.database.memberDao.countMembers(memberGuildId);
    });

    test('member update is gated to the current user', () async {
      final captured = <String>[];
      final ctx = build(captured);
      await ctx.handler.handle(
        GuildMemberUpdateEvent(guildId: memberGuildId, member: _member('999')),
      );
      expect(captured, isEmpty);
      await ctx.handler.handle(
        GuildMemberUpdateEvent(guildId: memberGuildId, member: _member('100')),
      );
      expect(captured, <String>[memberGuildId]);
      await ctx.database.memberDao.countMembers(memberGuildId);
    });

    test('members chunk containing the current user refreshes once', () async {
      final captured = <String>[];
      final ctx = build(captured);
      await ctx.handler.handle(
        GuildMembersChunkEvent(
          guildId: memberGuildId,
          members: [_member('111'), _member('100'), _member('222')],
          chunkIndex: 0,
          chunkCount: 1,
        ),
      );
      expect(captured, <String>[memberGuildId]);
      await ctx.database.memberDao.countMembers(memberGuildId);
    });

    test('members chunk without the current user does not refresh', () async {
      final captured = <String>[];
      final ctx = build(captured);
      await ctx.handler.handle(
        GuildMembersChunkEvent(
          guildId: memberGuildId,
          members: [_member('111'), _member('222')],
          chunkIndex: 0,
          chunkCount: 1,
        ),
      );
      expect(captured, isEmpty);
      await ctx.database.memberDao.countMembers(memberGuildId);
    });
  });

  group('presence update bulk', () {
    test('writes status and custom status for every presence', () async {
      final database = openTestDatabase();
      await database.userDao.upsertUser(
        UsersCompanion.insert(id: 'u1', username: 'one'),
      );
      await database.userDao.upsertUser(
        UsersCompanion.insert(id: 'u2', username: 'two'),
      );

      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
      );
      await handler.handle(
        const PresenceUpdateBulkEvent(
          presences: <Map<String, dynamic>>[
            <String, dynamic>{
              'user': <String, dynamic>{'id': 'u1'},
              'status': 'idle',
              'custom_status': <String, dynamic>{'text': 'busy'},
            },
            <String, dynamic>{
              'user': <String, dynamic>{'id': 'u2'},
              'status': 'dnd',
            },
          ],
        ),
      );
      await pumpEventQueue();

      final u1 = await database.userDao.getUserById('u1');
      final u2 = await database.userDao.getUserById('u2');
      expect(u1?.status, 'idle');
      expect(u1?.customStatus, 'busy');
      expect(u2?.status, 'dnd');
      expect(u2?.customStatus, isNull);
    });

    test('stores custom emoji custom status as json', () async {
      final database = openTestDatabase();
      await database.userDao.upsertUser(
        UsersCompanion.insert(id: 'u3', username: 'three'),
      );

      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
      );
      await handler.handle(
        const PresenceUpdateBulkEvent(
          presences: <Map<String, dynamic>>[
            <String, dynamic>{
              'user': <String, dynamic>{'id': 'u3'},
              'status': 'online',
              'custom_status': <String, dynamic>{
                'emoji_id': '123456789',
                'emoji_animated': true,
              },
            },
          ],
        ),
      );
      await pumpEventQueue();

      final u3 = await database.userDao.getUserById('u3');
      expect(u3?.status, 'online');
      final CustomStatusResponse? parsed = parseStoredCustomStatus(
        u3?.customStatus,
      );
      expect(parsed?.emojiId?.toString(), '123456789');
      expect(parsed?.emojiAnimated, isTrue);
    });
  });

  group('typing start', () {
    const guildId = 'guild-1';
    const channelId = 'channel-1';
    const typerId = '300';

    TypingStartEvent typingEvent({GuildMemberResponse? member}) =>
        TypingStartEvent(
          channelId: channelId,
          userId: typerId,
          timestamp: DateTime.utc(2026),
          guildId: member == null ? null : guildId,
          member: member,
        );

    Future<void> waitFor(Future<bool> Function() condition) async {
      for (var i = 0; i < 50; i++) {
        if (await condition()) {
          return;
        }
        await Future<void>.delayed(const Duration(milliseconds: 10));
      }
      fail('condition not met within timeout');
    }

    test('hydrates the typer member when absent from cache', () async {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
      );

      await handler.handle(
        typingEvent(member: _member(typerId, nick: 'Monty')),
      );

      await waitFor(
        () async =>
            (await database.memberDao.getMemberByUserId(typerId, guildId)) !=
            null,
      );
      await waitFor(
        () async => (await database.userDao.getUserById(typerId)) != null,
      );
      final member = await database.memberDao.getMemberByUserId(
        typerId,
        guildId,
      );
      expect(member?.nick, 'Monty');
    });

    test('does not overwrite an already cached member', () async {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
      );

      await handler.handle(
        typingEvent(member: _member(typerId, nick: 'first')),
      );
      await waitFor(
        () async =>
            (await database.memberDao.getMemberByUserId(
              typerId,
              guildId,
            ))?.nick ==
            'first',
      );

      await handler.handle(
        typingEvent(member: _member(typerId, nick: 'second')),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));
      final member = await database.memberDao.getMemberByUserId(
        typerId,
        guildId,
      );
      expect(member?.nick, 'first');
    });

    test('skips member hydration for DM typing without a guild', () async {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
      );

      await handler.handle(typingEvent());
      await Future<void>.delayed(const Duration(milliseconds: 50));
      final member = await database.memberDao.getMemberByUserId(
        typerId,
        guildId,
      );
      expect(member, isNull);
    });
  });

  group('USER_PINNED_DMS_UPDATE', () {
    test('replaces pinned DM rows with gateway order', () async {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(database: database);

      await handler.handle(
        const UserPinnedDmsUpdateEvent(pinnedDmChannelIds: ['ch-1', 'ch-2']),
      );
      await pumpEventQueue();

      final pinnedDms = await database.pinnedDmsDao.getPinnedDms();
      expect(pinnedDms, hasLength(2));
      expect(pinnedDms[0].channelId, 'ch-1');
      expect(pinnedDms[0].position, 0);
      expect(pinnedDms[1].channelId, 'ch-2');
      expect(pinnedDms[1].position, 1);
    });

    test('clears pinned DM rows when list is empty', () async {
      final database = openTestDatabase();
      final handler = GatewayEventHandler(database: database);

      await handler.handle(
        const UserPinnedDmsUpdateEvent(pinnedDmChannelIds: ['ch-1']),
      );
      await pumpEventQueue();

      await handler.handle(
        const UserPinnedDmsUpdateEvent(pinnedDmChannelIds: []),
      );
      await pumpEventQueue();

      final pinnedDms = await database.pinnedDmsDao.getPinnedDms();
      expect(pinnedDms, isEmpty);
    });
  });

  group('READY channel lastMessageId merge', () {
    String snowflakeForUtc(DateTime utc) {
      final int internal =
          (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
      return internal.toString();
    }

    Map<String, dynamic> guildWithLastMessage({
      required String guildId,
      required String channelId,
      required String lastMessageId,
    }) {
      final Map<String, dynamic> guild = _guildWithChannelAndMember(
        guildId: guildId,
        channelId: channelId,
        memberUserId: 'u-$channelId',
      );
      final List<dynamic> channels = guild['channels'] as List<dynamic>;
      final Map<String, Object?> first = Map<String, Object?>.from(
        channels[0] as Map,
      );
      channels[0] = <String, Object?>{
        ...first,
        'last_message_id': lastMessageId,
      };
      return guild;
    }

    MessageResponseSchema messageSchema({
      required String id,
      required String channelId,
    }) => MessageResponseSchema(
      id: id,
      channelId: channelId,
      author: const UserPartialResponse(
        id: '300',
        username: 'author',
        discriminator: '0001',
        globalName: null,
        avatar: null,
        avatarColor: null,
        flags: 0,
      ),
      type: MessageResponseSchemaTypeType.valueDefault,
      flags: 0,
      content: 'hello $id',
      timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
      pinned: false,
      mentionEveryone: false,
      tts: false,
      mentions: const [],
      mentionRoles: const [],
    );

    Future<void> seedReadyChannel(
      GatewayEventHandler handler, {
      required String lastMessageId,
    }) async {
      await handler.handle(
        ReadyEvent(
          sessionId: 'session-seed',
          user: _user(),
          guilds: const [],
          rawGuilds: [
            guildWithLastMessage(
              guildId: 'g1',
              channelId: 'c1',
              lastMessageId: lastMessageId,
            ),
          ],
          privateChannels: const [],
          relationships: const [],
          readStates: const [],
          presences: const [],
        ),
      );
    }

    test(
      'incremental READY accepts lower snapshot lastMessageId (authoritative)',
      () async {
        final String olderId = snowflakeForUtc(DateTime.utc(2026, 5, 10, 10));
        final String newerId = snowflakeForUtc(DateTime.utc(2026, 5, 10, 12));
        final database = openTestDatabase();
        final handler = GatewayEventHandler(database: database);

        await seedReadyChannel(handler, lastMessageId: newerId);
        await database.messageDao.upsertMessage(
          MessagesCompanion.insert(
            id: newerId,
            channelId: 'c1',
            authorId: '300',
            content: 'local',
            timestamp: dateTimeFromUserSnowflakeOrNull(newerId)!,
          ),
        );

        await handler.handle(
          ReadyEvent(
            sessionId: 'session-2',
            user: _user(),
            guilds: const [],
            rawGuilds: [
              guildWithLastMessage(
                guildId: 'g1',
                channelId: 'c1',
                lastMessageId: olderId,
              ),
            ],
            privateChannels: const [],
            relationships: const [],
            readStates: const [],
            presences: const [],
          ),
        );

        final Channel? row = await database.channelDao.getChannelById('c1');
        expect(row?.lastMessageId, olderId);
      },
    );

    test(
      'post-READY MESSAGE_CREATE re-advances lastMessageId past snapshot',
      () async {
        final String snapshotId = snowflakeForUtc(
          DateTime.utc(2026, 5, 10, 10),
        );
        final String createId = snowflakeForUtc(DateTime.utc(2026, 5, 10, 14));
        final database = openTestDatabase();
        final handler = GatewayEventHandler(database: database);

        await seedReadyChannel(handler, lastMessageId: snapshotId);

        await handler.handle(
          MessageCreateEvent(
            message: messageSchema(id: createId, channelId: 'c1'),
          ),
        );

        final Channel? row = await database.channelDao.getChannelById('c1');
        expect(row?.lastMessageId, createId);
      },
    );

    test('full-wipe READY lands snapshot lastMessageId', () async {
      final String snapshotId = snowflakeForUtc(DateTime.utc(2026, 5, 10, 11));
      final database = openTestDatabase();
      final handler = GatewayEventHandler(database: database);

      await seedReadyChannel(handler, lastMessageId: snapshotId);

      final Channel? row = await database.channelDao.getChannelById('c1');
      expect(row?.lastMessageId, snapshotId);
    });

    test(
      'incremental READY advances lastMessageId when snapshot is newer',
      () async {
        final String olderId = snowflakeForUtc(DateTime.utc(2026, 5, 10, 10));
        final String newerId = snowflakeForUtc(DateTime.utc(2026, 5, 10, 13));
        final database = openTestDatabase();
        final handler = GatewayEventHandler(database: database);

        await seedReadyChannel(handler, lastMessageId: olderId);

        await handler.handle(
          ReadyEvent(
            sessionId: 'session-2',
            user: _user(),
            guilds: const [],
            rawGuilds: [
              guildWithLastMessage(
                guildId: 'g1',
                channelId: 'c1',
                lastMessageId: newerId,
              ),
            ],
            privateChannels: const [],
            relationships: const [],
            readStates: const [],
            presences: const [],
          ),
        );

        final Channel? row = await database.channelDao.getChannelById('c1');
        expect(row?.lastMessageId, newerId);
      },
    );
  });

  group('MESSAGE_DELETE lastMessageId', () {
    String snowflakeForUtc(DateTime utc) {
      final int internal =
          (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
      return internal.toString();
    }

    Future<void> seedChannel(
      FluxerDatabase database, {
      required String lastMessageId,
    }) async {
      await database.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'c1',
          guildId: 'g1',
          name: 'general',
          lastMessageId: Value(lastMessageId),
        ),
      );
    }

    test('tail delete with cached previous leaves pointer unchanged', () async {
      final String olderId = snowflakeForUtc(DateTime.utc(2026, 5, 10, 10));
      final String tailId = snowflakeForUtc(DateTime.utc(2026, 5, 10, 12));
      final database = openTestDatabase();
      final handler = GatewayEventHandler(database: database);

      await seedChannel(database, lastMessageId: tailId);
      await database.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: olderId,
          channelId: 'c1',
          authorId: '300',
          content: 'older',
          timestamp: dateTimeFromUserSnowflakeOrNull(olderId)!,
        ),
      );
      await database.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: tailId,
          channelId: 'c1',
          authorId: '300',
          content: 'tail',
          timestamp: dateTimeFromUserSnowflakeOrNull(tailId)!,
        ),
      );

      await handler.handle(
        MessageDeleteEvent(channelId: 'c1', messageId: tailId),
      );

      final Channel? row = await database.channelDao.getChannelById('c1');
      expect(row?.lastMessageId, tailId);
      expect(await database.messageDao.getMessage(tailId), isNull);
      expect(await database.messageDao.getMessage(olderId), isNotNull);
    });

    test('tail delete with empty cache leaves pointer untouched', () async {
      final String tailId = snowflakeForUtc(DateTime.utc(2026, 5, 10, 12));
      final database = openTestDatabase();
      final handler = GatewayEventHandler(database: database);

      await seedChannel(database, lastMessageId: tailId);

      await handler.handle(
        MessageDeleteEvent(channelId: 'c1', messageId: tailId),
      );

      final Channel? row = await database.channelDao.getChannelById('c1');
      expect(row?.lastMessageId, tailId);
    });

    test('non-tail delete leaves lastMessageId untouched', () async {
      final String olderId = snowflakeForUtc(DateTime.utc(2026, 5, 10, 10));
      final String tailId = snowflakeForUtc(DateTime.utc(2026, 5, 10, 12));
      final database = openTestDatabase();
      final handler = GatewayEventHandler(database: database);

      await seedChannel(database, lastMessageId: tailId);
      await database.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: olderId,
          channelId: 'c1',
          authorId: '300',
          content: 'older',
          timestamp: dateTimeFromUserSnowflakeOrNull(olderId)!,
        ),
      );
      await database.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: tailId,
          channelId: 'c1',
          authorId: '300',
          content: 'tail',
          timestamp: dateTimeFromUserSnowflakeOrNull(tailId)!,
        ),
      );

      await handler.handle(
        MessageDeleteEvent(channelId: 'c1', messageId: olderId),
      );

      final Channel? row = await database.channelDao.getChannelById('c1');
      expect(row?.lastMessageId, tailId);
      expect(await database.messageDao.getMessage(olderId), isNull);
      expect(await database.messageDao.getMessage(tailId), isNotNull);
    });
  });
}

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

Map<String, dynamic> _guildWithVoiceState() => {
  'id': '200',
  'properties': {
    'id': '200',
    'name': 'Voice Guild',
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
  'voice_states': <Map<String, Object?>>[
    {'user_id': '400', 'channel_id': 'voice-1', 'guild_id': '200'},
  ],
  'emojis': <Map<String, Object?>>[],
  'stickers': <Map<String, Object?>>[],
};

Map<String, dynamic> _guildWithSticker() => {
  'id': '200',
  'properties': {
    'id': '200',
    'name': 'Sticker Guild',
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
  'stickers': [
    {
      'id': '300',
      'name': 'Blob Wave',
      'description': 'Waving blob',
      'tags': ['wave', 'hello'],
      'animated': false,
      'nsfw': false,
    },
  ],
};

Map<String, dynamic> _guildWithChannelAndMember({
  required String guildId,
  required String channelId,
  required String memberUserId,
}) => {
  'id': guildId,
  'properties': {
    'id': guildId,
    'name': 'Guild $guildId',
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
    {
      'id': channelId,
      'type': 0,
      'guild_id': guildId,
      'name': 'general',
      'position': 0,
    },
  ],
  'members': <Map<String, Object?>>[
    {
      'user': {
        'id': memberUserId,
        'username': 'user-$memberUserId',
        'discriminator': '0001',
        'global_name': null,
        'avatar': null,
        'avatar_color': null,
        'flags': 0,
      },
      'roles': <String>[],
      'joined_at': '2024-01-01T00:00:00.000Z',
      'mute': false,
      'deaf': false,
    },
  ],
  'roles': <Map<String, Object?>>[],
  'presences': <Map<String, Object?>>[],
  'voice_states': <Map<String, Object?>>[],
  'emojis': <Map<String, Object?>>[],
  'stickers': <Map<String, Object?>>[],
};

GuildMemberResponse _member(String userId, {String? nick}) =>
    GuildMemberResponse(
      user: UserPartialResponse(
        id: userId,
        username: 'user-$userId',
        discriminator: '0001',
        globalName: null,
        avatar: null,
        avatarColor: null,
        flags: 0,
      ),
      roles: const <String>[],
      joinedAt: DateTime.utc(2024),
      mute: false,
      deaf: false,
      nick: nick,
    );
