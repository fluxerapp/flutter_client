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
