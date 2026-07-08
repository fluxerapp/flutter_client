import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/data/unread_permission_utils.dart';

import '../../../helpers/open_test_database.dart';

Future<Channel> _seedGuildChannel({
  required FluxerDatabase db,
  required String guildId,
  required String channelId,
  required String userId,
  bool includeMember = true,
  int everyonePermissions = 0,
  List<String> memberRoleIds = const [],
}) async {
  await db.guildDao.upsertServer(
    ServersCompanion.insert(
      id: guildId,
      name: 'Guild $guildId',
      ownerId: const Value('owner'),
    ),
  );
  await db.roleDao.upsertRoles([
    RolesCompanion.insert(
      id: guildId,
      guildId: guildId,
      name: '@everyone',
      permissions: Value(everyonePermissions.toString()),
    ),
    RolesCompanion.insert(
      id: 'role-view',
      guildId: guildId,
      name: 'Viewers',
      permissions: Value(Permission.viewChannel.value.toString()),
    ),
  ]);
  if (includeMember) {
    await db.memberDao.upsertMember(
      MembersCompanion.insert(
        userId: userId,
        guildId: guildId,
        roleIdsJson: Value(jsonEncode(memberRoleIds)),
        joinedAt: Value(DateTime.utc(2026)),
      ),
    );
  }
  await db.channelDao.upsertChannel(
    ChannelsCompanion.insert(id: channelId, guildId: guildId, name: 'general'),
  );
  return (await db.channelDao.getChannelById(channelId))!;
}

void main() {
  test(
    'evaluateChannelUnreadPermission allows unread when member row is missing',
    () async {
      final db = openTestDatabase();
      const userId = 'me';
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      final channel = await _seedGuildChannel(
        db: db,
        guildId: guildId,
        channelId: channelId,
        userId: userId,
        includeMember: false,
      );

      final outcome = await evaluateChannelUnreadPermission(
        database: db,
        channel: channel,
        currentUserId: userId,
      );

      expect(outcome.isDefinitive, isFalse);
      expect(outcome.canRead, isTrue);
      expect(
        await canReadChannelForUnread(
          database: db,
          channel: channel,
          currentUserId: userId,
        ),
        isTrue,
      );
    },
  );

  test(
    'evaluateChannelUnreadPermission denies unread when member cannot view channel',
    () async {
      final db = openTestDatabase();
      const userId = 'me';
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      final channel = await _seedGuildChannel(
        db: db,
        guildId: guildId,
        channelId: channelId,
        userId: userId,
      );

      final outcome = await evaluateChannelUnreadPermission(
        database: db,
        channel: channel,
        currentUserId: userId,
      );

      expect(outcome.isDefinitive, isTrue);
      expect(outcome.canRead, isFalse);
    },
  );

  test(
    'evaluateChannelUnreadPermission allows unread when member has view role',
    () async {
      final db = openTestDatabase();
      const userId = 'me';
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      final channel = await _seedGuildChannel(
        db: db,
        guildId: guildId,
        channelId: channelId,
        userId: userId,
        memberRoleIds: const ['role-view'],
      );

      final outcome = await evaluateChannelUnreadPermission(
        database: db,
        channel: channel,
        currentUserId: userId,
      );

      expect(outcome.isDefinitive, isTrue);
      expect(outcome.canRead, isTrue);
    },
  );
}
