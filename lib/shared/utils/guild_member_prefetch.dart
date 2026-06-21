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
  final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
  final List<String> fetchedUserIds = <String>[];
  for (final String userId in authorIds) {
    final db.Member? existing = await database.memberDao.getMemberByUserId(
      userId,
      guildId,
    );
    if (existing != null) {
      continue;
    }
    try {
      final sdk = await ref
          .read(fluxerClientProvider)
          .guilds
          .getGuildMember(guildId: guildId, userId: userId);
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
      fetchedUserIds.add(userId);
    } on Object {
      // Skip authors that cannot be resolved.
    }
  }
  for (final String userId in fetchedUserIds) {
    ref.invalidate(memberRoleColorProvider((userId, guildId)));
  }
}
