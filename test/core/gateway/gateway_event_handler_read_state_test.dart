import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

UserPartialResponse _user(String id) => UserPartialResponse(
  id: id,
  username: 'user-$id',
  discriminator: '0001',
  globalName: null,
  avatar: null,
  avatarColor: null,
  flags: 0,
);

UserPrivateResponse _privateUser(String id) => UserPrivateResponse(
  hasVerifiedPhone: false,
  username: 'user-$id',
  discriminator: '0001',
  globalName: null,
  avatar: null,
  avatarColor: null,
  privacyAgreedAt: null,
  termsAgreedAt: null,
  pendingBulkMessageDeletion: null,
  flags: 0,
  unreadGiftInventoryCount: 0,
  isStaff: false,
  acls: const [],
  traits: const [],
  email: null,
  hasUnreadGiftInventory: false,
  hasEverPurchased: false,
  id: id,
  bio: null,
  pronouns: null,
  accentColor: null,
  banner: null,
  hasDismissedPremiumOnboarding: false,
  bannerColor: null,
  mfaEnabled: false,
  nsfwAllowed: true,
  verified: true,
  premiumType: null,
  premiumSince: null,
  premiumUntil: null,
  premiumWillCancel: false,
  premiumBillingCycle: null,
  premiumLifetimeSequence: null,
  premiumGraceEndsAt: null,
  premiumDiscriminator: false,
  requiredActions: const [],
  premiumBadgeMasked: false,
  premiumBadgeTimestampHidden: false,
  premiumBadgeSequenceHidden: false,
  premiumPurchaseDisabled: false,
  premiumEnabledOverride: false,
  passwordLastChangedAt: null,
  lastVoiceActivitySharingChangeAt: null,
  premiumBadgeHidden: false,
  premiumPerksDisabled: false,
);

MessagesCompanion _cachedMessage({
  required String id,
  required String channelId,
  required String authorId,
  bool isMentioned = false,
}) => MessagesCompanion.insert(
  id: id,
  channelId: channelId,
  authorId: authorId,
  content: 'message $id',
  timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
  isMentioned: Value(isMentioned),
);

MessageResponseSchema _message({
  required String id,
  required String channelId,
  required String authorId,
  bool mentionEveryone = false,
  List<String> mentionRoles = const [],
}) => MessageResponseSchema(
  id: id,
  channelId: channelId,
  author: _user(authorId),
  type: MessageResponseSchemaTypeType.valueDefault,
  flags: 0,
  content: 'hello',
  timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
  pinned: false,
  mentionEveryone: mentionEveryone,
  tts: false,
  mentions: const [],
  mentionRoles: mentionRoles,
);

ReadyEvent _readyEvent({
  String userId = 'me',
  List<GatewayReadState> readStates = const [],
}) => ReadyEvent(
  sessionId: 'session-1',
  user: _privateUser(userId),
  guilds: const [],
  rawGuilds: const [],
  privateChannels: const [],
  relationships: const [],
  readStates: readStates,
  presences: const [],
  userGuildSettings: const [],
);

void main() {
  test('ready stores private settings under @me', () async {
    final db = openTestDatabase();
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      ReadyEvent(
        sessionId: 'session-1',
        user: _privateUser('me'),
        guilds: const [],
        rawGuilds: const [],
        privateChannels: const [],
        relationships: const [],
        readStates: const [],
        presences: const [],
        userGuildSettings: const [
          UserGuildSettingsResponse(
            guildId: null,
            messageNotifications: UserNotificationSettings.allMessages,
            muted: false,
            muteConfig: null,
            mobilePush: true,
            suppressEveryone: false,
            suppressRoles: false,
            hideMutedChannels: false,
            channelOverrides: {
              'dm-1': ChannelOverrides(
                collapsed: false,
                messageNotifications: UserNotificationSettings.inherit,
                muted: true,
                muteConfig: null,
              ),
            },
            version: 1,
          ),
        ],
      ),
    );

    final settings = await db.userGuildSettingsDao.getByGuildId('@me');
    expect(settings, isNotNull);
    final decoded = UserGuildSettingsResponse.fromJson(
      jsonDecode(settings!.data) as Map<String, dynamic>,
    );
    expect(decoded.channelOverrides?['dm-1']?.muted, isTrue);
  });

  test('user guild settings update merges partial payload', () async {
    final db = openTestDatabase();
    await db.userGuildSettingsDao.upsert(
      UserGuildSettingsTableCompanion.insert(
        guildId: 'guild-1',
        data: jsonEncode(
          const UserGuildSettingsResponse(
            guildId: 'guild-1',
            messageNotifications: UserNotificationSettings.onlyMentions,
            muted: false,
            muteConfig: null,
            mobilePush: true,
            suppressEveryone: true,
            suppressRoles: false,
            hideMutedChannels: false,
            channelOverrides: {
              'channel-1': ChannelOverrides(
                collapsed: false,
                messageNotifications: UserNotificationSettings.inherit,
                muted: false,
                muteConfig: null,
                unreadBadges: UserNotificationSettings.onlyMentions,
              ),
            },
            unreadBadges: UserNotificationSettings.allMessages,
            version: 1,
          ).toJson(),
        ),
      ),
    );
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      const UserGuildSettingsUpdateEvent(
        guildId: 'guild-1',
        data: <String, dynamic>{
          'guild_id': 'guild-1',
          'muted': true,
          'channel_overrides': <String, dynamic>{
            'channel-2': <String, dynamic>{'muted': true},
          },
          'version': 2,
        },
      ),
    );
    await pumpEventQueue();

    final row = await db.userGuildSettingsDao.getByGuildId('guild-1');
    final decoded = UserGuildSettingsResponse.fromJson(
      jsonDecode(row!.data) as Map<String, dynamic>,
    );
    expect(decoded.muted, isTrue);
    expect(decoded.messageNotifications, UserNotificationSettings.onlyMentions);
    expect(decoded.suppressEveryone, isTrue);
    expect(decoded.unreadBadges, UserNotificationSettings.allMessages);
    expect(
      decoded.channelOverrides?['channel-1']?.unreadBadges,
      UserNotificationSettings.onlyMentions,
    );
    expect(decoded.channelOverrides?['channel-2']?.muted, isTrue);
    expect(
      decoded.channelOverrides?['channel-2']?.messageNotifications,
      UserNotificationSettings.inherit,
    );
    expect(decoded.version, 2);
  });

  test(
    'user guild settings update preserves overrides when channel_overrides is null',
    () async {
      final db = openTestDatabase();
      await db.userGuildSettingsDao.upsert(
        UserGuildSettingsTableCompanion.insert(
          guildId: 'guild-1',
          data: jsonEncode(
            const UserGuildSettingsResponse(
              guildId: 'guild-1',
              messageNotifications: UserNotificationSettings.onlyMentions,
              muted: false,
              muteConfig: null,
              mobilePush: true,
              suppressEveryone: true,
              suppressRoles: false,
              hideMutedChannels: false,
              channelOverrides: {
                'channel-1': ChannelOverrides(
                  collapsed: false,
                  messageNotifications: UserNotificationSettings.inherit,
                  muted: true,
                  muteConfig: null,
                ),
              },
              version: 1,
            ).toJson(),
          ),
        ),
      );
      final handler = GatewayEventHandler(database: db, currentUserId: 'me');

      await handler.handle(
        const UserGuildSettingsUpdateEvent(
          guildId: 'guild-1',
          data: <String, dynamic>{
            'guild_id': 'guild-1',
            'muted': true,
            'channel_overrides': null,
            'version': 2,
          },
        ),
      );
      await pumpEventQueue();

      final row = await db.userGuildSettingsDao.getByGuildId('guild-1');
      final decoded = UserGuildSettingsResponse.fromJson(
        jsonDecode(row!.data) as Map<String, dynamic>,
      );
      expect(decoded.muted, isTrue);
      expect(decoded.channelOverrides?['channel-1']?.muted, isTrue);
      expect(decoded.version, 2);
    },
  );

  test('own created messages locally ack the channel', () async {
    final db = openTestDatabase();
    final messageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );

    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      MessageCreateEvent(
        message: _message(
          id: messageId,
          channelId: 'channel-1',
          authorId: 'me',
        ),
      ),
    );

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, messageId);
    expect(readState?.mentionCount, 0);
    expect(readState?.manual, isFalse);
  });

  test('message ack stores manual state from gateway event', () async {
    final db = openTestDatabase();
    final messageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      MessageAckEvent(
        channelId: 'channel-1',
        messageId: messageId,
        mentionCount: 2,
        manual: true,
      ),
    );

    var readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, messageId);
    expect(readState?.mentionCount, 2);
    expect(readState?.manual, isTrue);

    await handler.handle(
      MessageAckEvent(
        channelId: 'channel-1',
        messageId: messageId,
        mentionCount: 0,
        manual: false,
      ),
    );

    readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.mentionCount, 0);
    expect(readState?.manual, isFalse);
  });

  test('server ack with a stale version is ignored', () async {
    final db = openTestDatabase();
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(0),
        manual: const Value(false),
        version: const Value('5'),
      ),
    );
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    // Stale version is rejected, so the absolute mention count is dropped.
    await handler.handle(
      MessageAckEvent(
        channelId: 'channel-1',
        messageId: ackId,
        mentionCount: 9,
        version: '3',
      ),
    );

    var readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.mentionCount, 0);
    expect(readState?.version, '5');

    // Newer version applies and persists.
    await handler.handle(
      MessageAckEvent(
        channelId: 'channel-1',
        messageId: ackId,
        mentionCount: 9,
        version: '7',
      ),
    );

    readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.mentionCount, 9);
    expect(readState?.version, '7');
  });

  test('message ack ignores older non-manual ack', () async {
    final db = openTestDatabase();
    final oldId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final currentId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(currentId),
        mentionCount: const Value(0),
        manual: const Value(false),
      ),
    );
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      MessageAckEvent(
        channelId: 'channel-1',
        messageId: oldId,
        mentionCount: 3,
        manual: false,
      ),
    );

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, currentId);
    expect(readState?.mentionCount, 0);
  });

  test('message ack for same message updates mention count only', () async {
    final db = openTestDatabase();
    final currentId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(currentId),
        mentionCount: const Value(4),
        manual: const Value(false),
      ),
    );
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      MessageAckEvent(
        channelId: 'channel-1',
        messageId: currentId,
        mentionCount: 1,
        manual: false,
      ),
    );

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, currentId);
    expect(readState?.mentionCount, 1);
  });

  test('role mentions increment guild channel mention count', () async {
    final db = openTestDatabase();
    final messageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    await db.memberDao.upsertMember(
      MembersCompanion.insert(
        userId: 'me',
        guildId: 'guild-1',
        roleIdsJson: const Value('["role-1"]'),
      ),
    );

    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      MessageCreateEvent(
        message: _message(
          id: messageId,
          channelId: 'channel-1',
          authorId: 'other',
          mentionRoles: const ['role-1'],
        ),
      ),
    );

    final readState = await db.readStateDao.getReadState('channel-1');
    final message = await db.messageDao.getMessage(messageId);
    final mentionRows = await db.notificationDao.getMentionFeedOrdered();
    expect(readState?.mentionCount, 1);
    expect(message?.isMentioned, isTrue);
    expect(mentionRows.map((row) => row.messageId), [messageId]);
  });

  test('suppressed role mentions do not increment mention count', () async {
    final db = openTestDatabase();
    final messageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    await db.memberDao.upsertMember(
      MembersCompanion.insert(
        userId: 'me',
        guildId: 'guild-1',
        roleIdsJson: const Value('["role-1"]'),
      ),
    );
    await db.userGuildSettingsDao.upsert(
      UserGuildSettingsTableCompanion.insert(
        guildId: 'guild-1',
        data: jsonEncode(
          const UserGuildSettingsResponse(
            guildId: 'guild-1',
            messageNotifications: UserNotificationSettings.inherit,
            muted: false,
            muteConfig: null,
            mobilePush: true,
            suppressEveryone: false,
            suppressRoles: true,
            hideMutedChannels: false,
            channelOverrides: null,
            version: 1,
          ).toJson(),
        ),
      ),
    );

    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      MessageCreateEvent(
        message: _message(
          id: messageId,
          channelId: 'channel-1',
          authorId: 'other',
          mentionRoles: const ['role-1'],
        ),
      ),
    );

    final readState = await db.readStateDao.getReadState('channel-1');
    final message = await db.messageDao.getMessage(messageId);
    final mentionRows = await db.notificationDao.getMentionFeedOrdered();
    // The suppressed mention must not bump the mention count, but the message
    // still seeds a plain-unread read state (web parity: recordUnread).
    expect(readState, isNotNull);
    expect(readState?.mentionCount, 0);
    expect(
      compareSnowflakeIds(readState!.lastMessageId, messageId),
      lessThan(0),
    );
    expect(message?.isMentioned, isFalse);
    expect(mentionRows, isEmpty);
  });

  test('channel pins update stores latest channel pin timestamp', () async {
    final db = openTestDatabase();
    const latestPin = '2026-05-06T12:00:00.000Z';
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      const ChannelPinsUpdateEvent(
        channelId: 'channel-1',
        lastPinTimestamp: latestPin,
      ),
    );

    final channel = await db.channelDao.getChannelById('channel-1');
    final readState = await db.readStateDao.getReadState('channel-1');
    expect(channel?.lastPinTimestamp, latestPin);
    expect(readState?.lastPinTimestamp, isNot(latestPin));
  });

  test('channel pins ack falls back to latest channel pin timestamp', () async {
    final db = openTestDatabase();
    const latestPin = '2026-05-06T12:00:00.000Z';
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastPinTimestamp: const Value(latestPin),
      ),
    );
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(const ChannelPinsAckEvent(channelId: 'channel-1'));

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastPinTimestamp, latestPin);
  });

  test('channel pins ack stores acknowledged pin timestamp', () async {
    final db = openTestDatabase();
    const latestPin = '2026-05-06T12:00:00.000Z';
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      const ChannelPinsAckEvent(
        channelId: 'channel-1',
        lastPinTimestamp: latestPin,
      ),
    );

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastPinTimestamp, latestPin);
  });

  test('message delete keeps the stored mention count (notify-only)', () async {
    final db = openTestDatabase();
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final mentionId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(mentionId),
      ),
    );
    await db.messageDao.upsertMessages([
      _cachedMessage(id: ackId, channelId: 'channel-1', authorId: 'other'),
      _cachedMessage(
        id: mentionId,
        channelId: 'channel-1',
        authorId: 'other',
        isMentioned: true,
      ),
    ]);
    await db.notificationDao.prependMentionRow(
      messageId: mentionId,
      channelId: 'channel-1',
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(1),
      ),
    );
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      MessageDeleteEvent(channelId: 'channel-1', messageId: mentionId),
    );
    await pumpEventQueue();

    final readState = await db.readStateDao.getReadState('channel-1');
    final mentionRows = await db.notificationDao.getMentionFeedOrdered();
    expect(await db.messageDao.getMessage(mentionId), isNull);
    expect(readState?.mentionCount, 1);
    expect(mentionRows, isEmpty);
  });

  test(
    'bulk message delete updates last message and keeps mention count',
    () async {
      final db = openTestDatabase();
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final remainingId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11, 30));
      final deletedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(deletedId),
        ),
      );
      await db.messageDao.upsertMessages([
        _cachedMessage(id: ackId, channelId: 'channel-1', authorId: 'other'),
        _cachedMessage(
          id: remainingId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
        _cachedMessage(
          id: deletedId,
          channelId: 'channel-1',
          authorId: 'other',
          isMentioned: true,
        ),
      ]);
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(1),
        ),
      );
      final handler = GatewayEventHandler(database: db, currentUserId: 'me');

      await handler.handle(
        MessageDeleteBulkEvent(channelId: 'channel-1', ids: [deletedId]),
      );
      await pumpEventQueue();

      final channel = await db.channelDao.getChannelById('channel-1');
      final readState = await db.readStateDao.getReadState('channel-1');
      expect(channel?.lastMessageId, remainingId);
      expect(readState?.mentionCount, 1);
    },
  );

  test(
    'dm message delete keeps unread and mention counts (notify-only)',
    () async {
      final db = openTestDatabase();
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final remainingId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final deletedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-1',
          recipientId: 'other',
          recipientIds: const Value('["other"]'),
          unreadCount: const Value(2),
        ),
      ]);
      await db.messageDao.upsertMessages([
        _cachedMessage(id: ackId, channelId: 'dm-1', authorId: 'other'),
        _cachedMessage(id: remainingId, channelId: 'dm-1', authorId: 'other'),
        _cachedMessage(id: deletedId, channelId: 'dm-1', authorId: 'other'),
      ]);
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('dm-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(2),
        ),
      );
      final handler = GatewayEventHandler(database: db, currentUserId: 'me');

      await handler.handle(
        MessageDeleteEvent(channelId: 'dm-1', messageId: deletedId),
      );

      final readState = await db.readStateDao.getReadState('dm-1');
      final dm = await db.dmChannelDao.getDmChannelById('dm-1');
      expect(readState?.mentionCount, 2);
      expect(dm?.unreadCount, 2);
    },
  );

  test('guild plain unread clears when only message is deleted', () async {
    final db = openTestDatabase();
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final messageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      MessageCreateEvent(
        message: _message(
          id: messageId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
      ),
    );

    final channelAfterCreate = await db.channelDao.getChannelById('channel-1');
    expect(channelAfterCreate?.lastMessageId, messageId);
    expect(
      hasUnreadByReadState(
        channelLastMessageId: messageId,
        ackLastMessageId: ackId,
        fallbackAckMs: 0,
        mentionCount: 0,
      ),
      isTrue,
    );

    await handler.handle(
      MessageDeleteEvent(channelId: 'channel-1', messageId: messageId),
    );
    await pumpEventQueue();

    final channelAfterDelete = await db.channelDao.getChannelById('channel-1');
    expect(channelAfterDelete?.lastMessageId, isNull);
    expect(
      hasUnreadByReadState(
        channelLastMessageId: channelAfterDelete?.lastMessageId,
        ackLastMessageId: ackId,
        fallbackAckMs: 0,
        mentionCount: 0,
      ),
      isFalse,
    );
  });

  test(
    'dm stays hoisted and unread when its newest message is deleted',
    () async {
      final db = openTestDatabase();
      final olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final newerId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-1',
          recipientId: 'other',
          recipientIds: const Value('["other"]'),
          lastMessageId: Value(olderId),
          lastMessageTime: Value(dateTimeFromUserSnowflakeOrNull(olderId)!),
        ),
      ]);
      await db.messageDao.upsertMessages([
        _cachedMessage(id: olderId, channelId: 'dm-1', authorId: 'other'),
      ]);
      final handler = GatewayEventHandler(database: db, currentUserId: 'me');

      await handler.handle(
        MessageCreateEvent(
          message: _message(id: newerId, channelId: 'dm-1', authorId: 'other'),
        ),
      );
      await handler.handle(
        MessageDeleteEvent(channelId: 'dm-1', messageId: newerId),
      );
      await pumpEventQueue();

      final dm = await db.dmChannelDao.getDmChannelById('dm-1');
      final readState = await db.readStateDao.getReadState('dm-1');
      expect(dm?.lastMessageId, newerId);
      expect(
        dm?.lastMessageTime.isAtSameMomentAs(
          dateTimeFromUserSnowflakeOrNull(newerId)!,
        ),
        isTrue,
      );
      expect(dm?.unreadCount, 1);
      expect(readState?.mentionCount, 1);
    },
  );

  test(
    'muted incoming DM updates unread presence without mention badge',
    () async {
      final db = openTestDatabase();
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final messageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-1',
          recipientId: 'other',
          recipientIds: const Value('["other"]'),
          lastMessageTime: Value(DateTime.utc(2026, 5, 6, 10)),
        ),
      ]);
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('dm-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
        ),
      );
      await db.userGuildSettingsDao.upsert(
        UserGuildSettingsTableCompanion.insert(
          guildId: '@me',
          data: jsonEncode(
            const UserGuildSettingsResponse(
              guildId: null,
              messageNotifications: UserNotificationSettings.allMessages,
              muted: false,
              muteConfig: null,
              mobilePush: true,
              suppressEveryone: false,
              suppressRoles: false,
              hideMutedChannels: false,
              channelOverrides: {
                'dm-1': ChannelOverrides(
                  collapsed: false,
                  messageNotifications: UserNotificationSettings.inherit,
                  muted: true,
                  muteConfig: null,
                ),
              },
              version: 1,
            ).toJson(),
          ),
        ),
      );

      final handler = GatewayEventHandler(database: db, currentUserId: 'me');

      await handler.handle(
        MessageCreateEvent(
          message: _message(
            id: messageId,
            channelId: 'dm-1',
            authorId: 'other',
          ),
        ),
      );

      final dm = await db.dmChannelDao.getDmChannelById('dm-1');
      final readState = await db.readStateDao.getReadState('dm-1');
      expect(dm?.lastMessageId, messageId);
      expect(readState?.lastMessageId, ackId);
      expect(readState?.mentionCount, 0);
    },
  );

  test('incoming DM messages increment DM unread count', () async {
    final db = openTestDatabase();
    final messageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.dmChannelDao.upsertDmChannels([
      DmChannelsCompanion.insert(
        id: 'dm-1',
        recipientId: 'other',
        recipientIds: const Value('["other"]'),
        lastMessageTime: Value(DateTime.utc(2026, 5, 6, 10)),
      ),
    ]);

    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      MessageCreateEvent(
        message: _message(id: messageId, channelId: 'dm-1', authorId: 'other'),
      ),
    );

    final dm = await db.dmChannelDao.getDmChannelById('dm-1');
    final readState = await db.readStateDao.getReadState('dm-1');
    expect(dm?.unreadCount, 1);
    expect(readState?.mentionCount, 1);
  });
  test(
    'auto-acked channel suppresses incoming mention at the source',
    () async {
      final db = openTestDatabase();
      final messageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
        ),
      );
      await db.memberDao.upsertMember(
        MembersCompanion.insert(
          userId: 'me',
          guildId: 'guild-1',
          roleIdsJson: const Value('["role-1"]'),
        ),
      );
      final handler = GatewayEventHandler(
        database: db,
        currentUserId: 'me',
        isAutoAckActive: (channelId) => channelId == 'channel-1',
      );

      await handler.handle(
        MessageCreateEvent(
          message: _message(
            id: messageId,
            channelId: 'channel-1',
            authorId: 'other',
            mentionRoles: const ['role-1'],
          ),
        ),
      );

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, messageId);
      expect(readState?.mentionCount, 0);
    },
  );

  test('plain message marks never-acked guild channel unread', () async {
    final db = openTestDatabase();
    final messageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      MessageCreateEvent(
        message: _message(
          id: messageId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
      ),
    );

    final readState = await db.readStateDao.getReadState('channel-1');
    final channel = await db.channelDao.getChannelById('channel-1');
    expect(readState, isNotNull);
    expect(readState?.mentionCount, 0);
    expect(channel?.lastMessageId, messageId);
    expect(
      compareSnowflakeIds(readState!.lastMessageId, messageId),
      lessThan(0),
    );
  });

  test('incremental ready preserves a local manual unread', () async {
    final db = openTestDatabase();
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final stickyId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    // Establish the session so the next ready is an incremental reconnect.
    await handler.handle(_readyEvent());
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(0),
        manual: const Value(true),
        stickyUnreadMessageId: Value(stickyId),
      ),
    );

    await handler.handle(
      _readyEvent(
        readStates: [GatewayReadState(id: 'channel-1', lastMessageId: ackId)],
      ),
    );

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.manual, isTrue);
    expect(readState?.stickyUnreadMessageId, stickyId);
  });

  test(
    'incremental ready clears manual unread when server ack advances',
    () async {
      final db = openTestDatabase();
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final stickyId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final advancedAck = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
      final handler = GatewayEventHandler(database: db, currentUserId: 'me');

      await handler.handle(_readyEvent());
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
          manual: const Value(true),
          stickyUnreadMessageId: Value(stickyId),
        ),
      );

      await handler.handle(
        _readyEvent(
          readStates: [
            GatewayReadState(id: 'channel-1', lastMessageId: advancedAck),
          ],
        ),
      );

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, advancedAck);
      expect(readState?.manual, isFalse);
      expect(readState?.stickyUnreadMessageId, isNull);
    },
  );
  test(
    'server ack does not double-count a mention still pending in the batcher',
    () async {
      final db = openTestDatabase();
      final batcher = ReadStateWriteBatcher(
        database: db,
        window: const Duration(hours: 1),
      );
      addTearDown(batcher.clearAll);

      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final mentionId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
        ),
      );
      await db.memberDao.upsertMember(
        MembersCompanion.insert(
          userId: 'me',
          guildId: 'guild-1',
          roleIdsJson: const Value('["role-1"]'),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
        ),
      );

      final handler = GatewayEventHandler(
        database: db,
        currentUserId: 'me',
        readStateWriteBatcher: batcher,
      );

      // A new mention lands while unviewed -> the increment is batched
      // (pending), not yet written to Drift.
      await handler.handle(
        MessageCreateEvent(
          message: _message(
            id: mentionId,
            channelId: 'channel-1',
            authorId: 'other',
            mentionRoles: const ['role-1'],
          ),
        ),
      );
      expect(batcher.hasPending('channel-1'), isTrue);

      // A server ack refreshes the count at the current position. Its mention
      // count (1) already accounts for the still-pending mention.
      await handler.handle(
        MessageAckEvent(
          channelId: 'channel-1',
          messageId: ackId,
          mentionCount: 1,
          manual: false,
        ),
      );

      // The ack flushed the pending increment before its absolute write, so a
      // later flush cannot replay it: the count stays the server's 1, not 2.
      expect(batcher.hasPending('channel-1'), isFalse);
      await batcher.flushAll();
      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.mentionCount, 1);
      expect(readState?.lastMessageId, ackId);
    },
  );
}
