import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

void main() {
  Map<String, dynamic> guildUpdatePayload({required String ownerId}) =>
      <String, dynamic>{
        'id': 'g1',
        'name': 'Guild g1',
        'icon': null,
        'banner': null,
        'splash': null,
        'splash_card_alignment': 0,
        'vanity_url_code': null,
        'owner_id': ownerId,
        'system_channel_id': null,
        'system_channel_flags': 0,
        'rules_channel_id': null,
        'afk_channel_id': null,
        'afk_timeout': 300,
        'features': <String>[],
        'verification_level': 0,
        'mfa_level': 0,
        'nsfw_level': 0,
        'nsfw': false,
        'content_warning_level': 0,
        'content_warning_text': null,
        'explicit_content_filter': 0,
        'default_message_notifications': 0,
        'disabled_operations': 0,
      };

  test(
    'GUILD_UPDATE rebuilds guild permissions after storing the new owner',
    () async {
      final FluxerDatabase database = openTestDatabase();
      addTearDown(database.close);
      await database.guildDao.upsertServer(
        ServersCompanion.insert(
          id: 'g1',
          name: 'Guild g1',
          ownerId: const Value<String?>('u-old'),
        ),
      );
      final List<Future<String?>> ownerAtRebuild = <Future<String?>>[];
      final GatewayEventHandler handler = GatewayEventHandler(
        database: database,
        onGuildPermissionsChanged: (String guildId) {
          ownerAtRebuild.add(
            database.guildDao
                .getServerById(guildId)
                .then((Server? server) => server?.ownerId),
          );
        },
      );

      await handler.handle(
        GuildUpdateEvent(
          guild: GuildCreateData.fromJson(guildUpdatePayload(ownerId: 'u-new')),
        ),
      );
      for (int i = 0; i < 100 && ownerAtRebuild.isEmpty; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 10));
      }

      expect(ownerAtRebuild, hasLength(1));
      expect(await ownerAtRebuild.single, 'u-new');
    },
  );
}
