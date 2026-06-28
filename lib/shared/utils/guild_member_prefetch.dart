import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

const int guildMemberPrefetchMaxAuthors = 50;

Future<void> prefetchGuildMembersForMessages({
  required Ref ref,
  required String guildId,
  required List<Message> messages,
}) async {
  if (guildId.isEmpty) {
    return;
  }
  final Set<String> authorIds = <String>{};
  for (final Message message in messages) {
    if (messagePrefersPersistedAuthorDisplay(message)) {
      continue;
    }
    if (message.authorId.isEmpty) {
      continue;
    }
    authorIds.add(message.authorId);
    if (authorIds.length >= guildMemberPrefetchMaxAuthors) {
      break;
    }
  }
  if (authorIds.isEmpty) {
    return;
  }
  await prefetchGuildMembersForUserIds(
    database: ref.read(fluxerDatabaseProvider),
    client: ref.read(fluxerClientProvider),
    guildId: guildId,
    userIds: authorIds,
    onMemberFetched: (String userId) {
      ref.invalidate(memberRoleColorProvider((userId, guildId)));
    },
  );
}

Future<void> prefetchGuildMembersForUserIds({
  required db.FluxerDatabase database,
  required FluxerClient client,
  required String guildId,
  required Iterable<String> userIds,
  void Function(String userId)? onMemberFetched,
}) async {
  if (guildId.isEmpty) {
    return;
  }
  final Set<String> uniqueUserIds = userIds
      .where((String id) => id.isNotEmpty)
      .toSet();
  if (uniqueUserIds.isEmpty) {
    return;
  }
  for (final String userId in uniqueUserIds) {
    final db.Member? existing = await database.memberDao.getMemberByUserId(
      userId,
      guildId,
    );
    if (existing != null) {
      continue;
    }
    try {
      final GuildMemberResponse sdk = await client.guilds.getGuildMember(
        guildId: guildId,
        userId: userId,
      );
      await database.userDao.upsertUser(
        db.UsersCompanion.insert(
          id: sdk.user.id,
          username: sdk.user.username,
          discriminator: Value(sdk.user.discriminator),
          globalName: Value(sdk.user.globalName),
          avatar: Value(sdk.user.avatar),
          avatarColor: Value(sdk.user.avatarColor),
          bot: Value(sdk.user.bot ?? false),
          system: Value(sdk.user.system ?? false),
          memberSince: Value(dateTimeFromUserSnowflakeOrNull(sdk.user.id)),
        ),
      );
      await database.memberDao.upsertMember(
        memberCompanionFromSdk(sdk, guildId: guildId),
      );
      onMemberFetched?.call(userId);
    } on Object {
      // Skip users that cannot be resolved.
    }
  }
}

Future<Map<String, GuildUserDisplay>> resolveGuildUserDisplaysForUserIds({
  required db.FluxerDatabase database,
  required FluxerClient client,
  required String guildId,
  required Iterable<String> userIds,
  void Function(String userId)? onMemberFetched,
}) async {
  final Set<String> uniqueUserIds = userIds
      .where((String id) => id.isNotEmpty)
      .toSet();
  if (uniqueUserIds.isEmpty || guildId.isEmpty) {
    return const <String, GuildUserDisplay>{};
  }
  await prefetchGuildMembersForUserIds(
    database: database,
    client: client,
    guildId: guildId,
    userIds: uniqueUserIds,
    onMemberFetched: onMemberFetched,
  );
  final Map<String, String?> nicknameByUserId = await database.relationshipDao
      .getNicknamesByUserId();
  final Map<String, GuildUserDisplay> displays = <String, GuildUserDisplay>{};
  for (final String userId in uniqueUserIds) {
    final db.User? user = await database.userDao.getUserById(userId);
    if (user == null) {
      continue;
    }
    final db.Member? member = await database.memberDao.getMemberByUserId(
      userId,
      guildId,
    );
    displays[userId] = resolveGuildUserDisplayFromRows(
      user: user,
      member: member,
      guildId: guildId,
      friendNickname: nicknameByUserId[userId],
    );
  }
  return displays;
}
