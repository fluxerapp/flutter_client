import 'package:drift/drift.dart' show Value;
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

  tearDown(() => database.close());

  test('USER_UPDATE refreshes the stored account of that user', () async {
    await database.authSessionDao.saveSessionMetadata(
      userId: '100',
      username: 'old',
      discriminator: '0001',
      avatar: 'old-hash',
    );
    await (database.update(database.authSessions)
          ..where((t) => t.userId.equals('100')))
        .write(AuthSessionsCompanion(lastActive: Value(DateTime.utc(2020))));
    await database.authSessionDao.saveSessionMetadata(userId: '200');
    await database.authSessionDao.touchSession('200');

    await handler.handle(
      UserUpdateEvent(user: UserPrivateResponse.fromJson(_privateUser())),
    );
    await pumpEventQueue();

    final AuthSession? stored = await database.authSessionDao.getSession('100');
    expect(stored?.username, 'tester');
    expect(stored?.discriminator, '0002');
    expect(stored?.avatar, 'new-hash');
    expect((await database.authSessionDao.getActiveSession())?.userId, '200');
  });
}

Map<String, dynamic> _privateUser() => <String, dynamic>{
  'id': '100',
  'username': 'tester',
  'discriminator': '0002',
  'global_name': null,
  'avatar': 'new-hash',
  'avatar_color': null,
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
};
