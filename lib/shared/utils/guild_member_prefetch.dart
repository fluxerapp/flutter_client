import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/message_member_load_utils.dart';
import 'package:fluxer_dart/export.dart';

Future<void> hydrateGuildMembersForMessages({
  required Ref ref,
  required String guildId,
  required List<Message> messages,
  List<Message> embeddedReplyParents = const <Message>[],
}) async {
  if (guildId.isEmpty || messages.isEmpty) {
    return;
  }
  final Set<String> userIds = collectMessageMemberUserIds(
    messages,
    currentUserId: ref.read(currentUserIdProvider),
    embeddedReplyParents: embeddedReplyParents,
  );
  if (userIds.isEmpty) {
    return;
  }
  await ref
      .read(guildMemberHydrationServiceProvider)
      .hydrateMembers(
        guildId: guildId,
        userIds: userIds,
        onMemberFetched: (String userId) {
          ref.invalidate(memberRoleColorProvider((userId, guildId)));
        },
      );
}

@Deprecated('Use hydrateGuildMembersForMessages')
Future<void> prefetchGuildMembersForMessages({
  required Ref ref,
  required String guildId,
  required List<Message> messages,
}) {
  return hydrateGuildMembersForMessages(
    ref: ref,
    guildId: guildId,
    messages: messages,
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
  final GuildMemberHydrationService hydrationService =
      GuildMemberHydrationService(
        database: database,
        client: client,
        chunkWaiter: GuildMemberChunkWaiter(),
        readGateway: () => null,
      );
  await hydrationService.hydrateMembers(
    guildId: guildId,
    userIds: uniqueUserIds,
    onMemberFetched: onMemberFetched,
  );
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
