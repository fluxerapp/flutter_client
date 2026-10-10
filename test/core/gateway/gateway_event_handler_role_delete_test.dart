import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

void main() {
  Future<void> waitFor(Future<bool> Function() condition) async {
    for (int i = 0; i < 100; i++) {
      if (await condition()) {
        return;
      }
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
    fail('condition not met within timeout');
  }

  Future<FluxerDatabase> seed() async {
    final FluxerDatabase database = openTestDatabase();
    await database.guildDao.upsertServer(
      ServersCompanion.insert(id: 'g1', name: 'Guild'),
    );
    await database.roleDao.upsertRoles(<RolesCompanion>[
      RolesCompanion.insert(id: 'r-gone', guildId: 'g1', name: 'gone'),
      RolesCompanion.insert(id: 'r-kept', guildId: 'g1', name: 'kept'),
    ]);
    await database.memberDao.upsertMembers(<MembersCompanion>[
      MembersCompanion.insert(
        userId: 'u-both',
        guildId: 'g1',
        roleIdsJson: Value<String>(jsonEncode(<String>['r-gone', 'r-kept'])),
      ),
      MembersCompanion.insert(
        userId: 'u-kept',
        guildId: 'g1',
        roleIdsJson: Value<String>(jsonEncode(<String>['r-kept'])),
      ),
      MembersCompanion.insert(
        userId: 'u-both',
        guildId: 'g2',
        roleIdsJson: Value<String>(jsonEncode(<String>['r-gone'])),
      ),
    ]);
    await database.channelDao.upsertChannels(<ChannelsCompanion>[
      ChannelsCompanion.insert(
        id: 'c-mixed',
        guildId: 'g1',
        name: 'mixed',
        permissionOverwritesJson: Value<String?>(
          jsonEncode(<Map<String, Object?>>[
            <String, Object?>{
              'id': 'r-gone',
              'type': 0,
              'allow': '1024',
              'deny': '0',
            },
            <String, Object?>{
              'id': 'r-kept',
              'type': 0,
              'allow': '0',
              'deny': '1024',
            },
            <String, Object?>{
              'id': 'r-gone',
              'type': 1,
              'allow': '2048',
              'deny': '0',
            },
          ]),
        ),
      ),
      ChannelsCompanion.insert(
        id: 'c-only',
        guildId: 'g1',
        name: 'only',
        permissionOverwritesJson: Value<String?>(
          jsonEncode(<Map<String, Object?>>[
            <String, Object?>{
              'id': 'r-gone',
              'type': 0,
              'allow': '1024',
              'deny': '0',
            },
          ]),
        ),
      ),
    ]);
    return database;
  }

  List<Object?> overwrites(Channel? channel) {
    final String? json = channel?.permissionOverwritesJson;
    return json == null ? const <Object?>[] : jsonDecode(json) as List<Object?>;
  }

  test(
    'GUILD_ROLE_DELETE strips the role from members and overwrites',
    () async {
      final FluxerDatabase database = await seed();
      final List<String> permissionGuildIds = <String>[];
      final GatewayEventHandler handler = GatewayEventHandler(
        database: database,
        onGuildPermissionsChanged: permissionGuildIds.add,
      );

      await handler.handle(
        const GuildRoleDeleteEvent(guildId: 'g1', roleId: 'r-gone'),
      );
      await waitFor(() async => permissionGuildIds.isNotEmpty);

      expect(await database.roleDao.getRoleById('r-gone'), isNull);
      expect(await database.roleDao.getRoleById('r-kept'), isNotNull);
      expect(
        (await database.memberDao.getMemberByUserId(
          'u-both',
          'g1',
        ))!.roleIdsJson,
        jsonEncode(<String>['r-kept']),
      );
      expect(
        (await database.memberDao.getMemberByUserId(
          'u-kept',
          'g1',
        ))!.roleIdsJson,
        jsonEncode(<String>['r-kept']),
      );
      expect(
        (await database.memberDao.getMemberByUserId(
          'u-both',
          'g2',
        ))!.roleIdsJson,
        jsonEncode(<String>['r-gone']),
      );
      expect(
        overwrites(await database.channelDao.getChannelById('c-mixed')),
        <Object?>[
          <String, Object?>{
            'id': 'r-kept',
            'type': 0,
            'allow': '0',
            'deny': '1024',
          },
          <String, Object?>{
            'id': 'r-gone',
            'type': 1,
            'allow': '2048',
            'deny': '0',
          },
        ],
      );
      expect(
        overwrites(await database.channelDao.getChannelById('c-only')),
        isEmpty,
      );
      expect(permissionGuildIds, <String>['g1']);
    },
  );
}
