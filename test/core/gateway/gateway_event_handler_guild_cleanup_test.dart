import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  group('guild membership cleanup', () {
    Future<
      ({
        GatewayEventHandler handler,
        FluxerDatabase database,
        List<String> evictedGuildIds,
      })
    >
    buildHandler() async {
      final database = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(database.close);
      final evictedGuildIds = <String>[];
      final handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
        onGuildPermissionsEvict: evictedGuildIds.add,
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
          guilds: const [],
          rawGuilds: rawGuilds,
          privateChannels: const [],
          relationships: const [],
          readStates: const [],
          presences: const [],
        ),
      );
    }

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
