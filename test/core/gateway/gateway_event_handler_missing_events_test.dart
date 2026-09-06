import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

UserPartialResponse _user(String id) => UserPartialResponse(
  id: id,
  username: 'user-$id',
  discriminator: '0001',
  globalName: null,
  avatar: null,
  avatarColor: null,
  flags: 0,
);

void main() {
  group('GatewayEventHandler missing events', () {
    late FluxerDatabase database;

    setUp(() {
      database = openTestDatabase();
    });

    test('GUILD_COUNTS_UPDATE writes member and online counts', () async {
      await database.guildDao.upsertServer(
        ServersCompanion.insert(id: 'g1', name: 'Guild'),
      );
      final handler = GatewayEventHandler(database: database);

      await handler.handle(
        const GuildCountsUpdateEvent(
          counts: <GuildCountEntry>[
            GuildCountEntry(guildId: 'g1', memberCount: 42, onlineCount: 7),
          ],
        ),
      );

      final Server? row = await database.guildDao.getServerById('g1');
      expect(row?.memberCount, 42);
      expect(row?.onlineCount, 7);
    });

    test('GUILD_BAN_ADD emits callback', () async {
      String? guildId;
      UserPartialResponse? user;
      final handler = GatewayEventHandler(
        database: database,
        onGuildBanAdd: (String id, UserPartialResponse banned) {
          guildId = id;
          user = banned;
        },
      );

      await handler.handle(GuildBanAddEvent(guildId: 'g1', user: _user('u1')));

      expect(guildId, 'g1');
      expect(user?.id, 'u1');
    });

    test('WEBHOOKS_UPDATE emits callback', () async {
      String? guildId;
      String? channelId;
      final handler = GatewayEventHandler(
        database: database,
        onWebhooksUpdate: (String gid, String cid) {
          guildId = gid;
          channelId = cid;
        },
      );

      await handler.handle(
        const WebhooksUpdateEvent(channelId: 'ch1', guildId: 'g1'),
      );

      expect(guildId, 'g1');
      expect(channelId, 'ch1');
    });

    test('AUTH_SESSION_CHANGE emits token and hash callbacks', () async {
      String? token;
      String? hash;
      final handler = GatewayEventHandler(
        database: database,
        onAuthSessionChange: (AuthSessionChangeEvent event) {
          token = event.newToken;
        },
        onAuthSessionIdHashChanged: (String? idHash) {
          hash = idHash;
        },
      );

      await handler.handle(
        const AuthSessionChangeEvent(
          newToken: 'rotated',
          newAuthSessionIdHash: 'hash-1',
        ),
      );

      expect(token, 'rotated');
      expect(hash, 'hash-1');
    });

    test('CHANNEL_MEMBER_COUNTS_UPDATE emits callback', () async {
      List<ChannelMemberCountEntry>? counts;
      final handler = GatewayEventHandler(
        database: database,
        onChannelMemberCountsUpdate: (ChannelMemberCountsUpdateEvent event) {
          counts = event.counts;
        },
      );

      await handler.handle(
        const ChannelMemberCountsUpdateEvent(
          counts: <ChannelMemberCountEntry>[
            ChannelMemberCountEntry(
              guildId: 'g1',
              channelId: 'ch1',
              memberCount: 9,
              onlineCount: 2,
            ),
          ],
        ),
      );

      expect(counts, hasLength(1));
      expect(counts!.first.channelId, 'ch1');
    });

    test('ENTRANCE_SOUND_PLAY emits callback', () async {
      EntranceSoundPlayEvent? received;
      final handler = GatewayEventHandler(
        database: database,
        onEntranceSoundPlay: (EntranceSoundPlayEvent event) {
          received = event;
        },
      );

      await handler.handle(
        const EntranceSoundPlayEvent(
          userId: 'u1',
          channelId: 'ch1',
          soundId: 's1',
          hash: 'h',
          url: 'https://cdn.example/a.ogg',
          durationMs: 800,
          contentType: 'audio/ogg',
        ),
      );

      expect(received?.url, 'https://cdn.example/a.ogg');
    });

    test('VOICE_STATE_ACK emits callback', () async {
      VoiceStateAckEvent? received;
      final handler = GatewayEventHandler(
        database: database,
        onVoiceStateAck: (VoiceStateAckEvent event) {
          received = event;
        },
      );

      await handler.handle(
        const VoiceStateAckEvent(status: 'ok', mutationId: 'm1'),
      );

      expect(received?.mutationId, 'm1');
    });
  });
}
