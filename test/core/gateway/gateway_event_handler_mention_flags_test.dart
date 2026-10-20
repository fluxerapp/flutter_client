import 'package:drift/drift.dart' hide isNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

void main() {
  late FluxerDatabase database;
  late GatewayEventHandler handler;

  setUp(() {
    database = openTestDatabase();
    handler = GatewayEventHandler(database: database);
  });

  Future<void> sendReady(
    Map<String, dynamic> self, {
    String sessionId = 'session-1',
    List<Map<String, dynamic>> rawGuilds = const <Map<String, dynamic>>[],
  }) {
    return handler.handle(
      ReadyEvent(
        sessionId: sessionId,
        user: UserPrivateResponse.fromJson(self),
        guilds: const [],
        rawGuilds: rawGuilds,
        privateChannels: const [],
        relationships: const [],
        readStates: const [],
        presences: const [],
        users: <Map<String, dynamic>>[_partialUser('200', mentionFlags: 2)],
      ),
    );
  }

  test('READY stores the mention preference of the current user', () async {
    await sendReady(_privateUser(mentionFlags: 1));

    expect((await database.userDao.getUserById('100'))?.mentionFlags, 1);
  });

  test('READY keeps the own member when a mention preference is set', () async {
    await sendReady(
      _privateUser(mentionFlags: 1),
      rawGuilds: <Map<String, dynamic>>[_guildWithOwnMember()],
    );

    final Member? member = await database.memberDao.getMemberByUserId(
      '100',
      'g1',
    );
    expect(member?.roleIdsJson, '["r1"]');
  });

  test('READY clears a stale mention preference the server omits', () async {
    await sendReady(_privateUser(mentionFlags: 2));

    await sendReady(_privateUser(), sessionId: 'session-2');

    expect((await database.userDao.getUserById('100'))?.mentionFlags, isNull);
  });

  test('READY stores mention preferences of cached users', () async {
    await sendReady(_privateUser());

    expect((await database.userDao.getUserById('200'))?.mentionFlags, 2);
  });

  test('USER_UPDATE stores and clears the mention preference', () async {
    await handler.handle(
      UserUpdateEvent(
        user: UserPrivateResponse.fromJson(_privateUser(mentionFlags: 2)),
      ),
    );
    await pumpEventQueue();
    expect((await database.userDao.getUserById('100'))?.mentionFlags, 2);

    await handler.handle(
      UserUpdateEvent(user: UserPrivateResponse.fromJson(_privateUser())),
    );
    await pumpEventQueue();
    expect((await database.userDao.getUserById('100'))?.mentionFlags, isNull);
  });

  test('a partial user without mention_flags clears the old value', () async {
    await database.userDao.upsertUser(
      const UsersCompanion(
        id: Value('200'),
        username: Value('user-200'),
        mentionFlags: Value(1),
      ),
    );

    await handler.handle(
      ChannelRecipientAddEvent(
        channelId: 'dm1',
        user: UserPartialResponse.fromJson(_partialUser('200')),
      ),
    );
    await pumpEventQueue();

    expect((await database.userDao.getUserById('200'))?.mentionFlags, isNull);
  });
}

Map<String, dynamic> _guildWithOwnMember() => <String, dynamic>{
  'id': 'g1',
  'properties': <String, dynamic>{
    'id': 'g1',
    'name': 'Guild g1',
    'splash_card_alignment': 0,
    'owner_id': '300',
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
  'members': <Map<String, Object?>>[
    <String, Object?>{
      'user': <String, Object?>{'id': '100'},
      'roles': <String>['r1'],
      'joined_at': '2026-01-01T00:00:00.000Z',
    },
  ],
  'roles': <Map<String, Object?>>[
    <String, Object?>{
      'id': 'r1',
      'name': 'r1',
      'color': 0,
      'position': 1,
      'permissions': '64',
      'hoist': false,
      'mentionable': false,
    },
  ],
  'member_count': 2,
  'online_count': 1,
  'presences': <Map<String, Object?>>[],
  'voice_states': <Map<String, Object?>>[],
  'joined_at': '2026-01-01T00:00:00.000Z',
  'emojis': <Map<String, Object?>>[],
  'stickers': <Map<String, Object?>>[],
};

Map<String, dynamic> _partialUser(String id, {int? mentionFlags}) =>
    <String, dynamic>{
      'id': id,
      'username': 'user-$id',
      'discriminator': '0001',
      'global_name': null,
      'avatar': null,
      'avatar_color': null,
      'flags': 0,
      'mention_flags': ?mentionFlags,
    };

Map<String, dynamic> _privateUser({int? mentionFlags}) => <String, dynamic>{
  'id': '100',
  'username': 'tester',
  'discriminator': '0001',
  'global_name': null,
  'avatar': null,
  'avatar_color': null,
  'flags': 0,
  'mention_flags': ?mentionFlags,
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
};
