import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/utils/messages/message_content_stripper.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';

Future<String> resolveMessageUserDisplayName({
  required db.FluxerDatabase database,
  required String userId,
  required String? guildId,
  String? fallbackDisplayName,
}) async {
  final db.User? user = await database.userDao.getUserById(userId);
  db.Member? member;
  if (guildId != null && guildId.isNotEmpty) {
    member = await database.memberDao.getMemberByUserId(userId, guildId);
  }
  final String? friendNickname =
      (await database.relationshipDao.getRelationship(userId))?.nickname;
  final String? userUsername = user?.username.trim();
  final String? fallback = fallbackDisplayName?.trim();
  final String username = (userUsername != null && userUsername.isNotEmpty)
      ? userUsername
      : (fallback != null && fallback.isNotEmpty ? fallback : userId);
  return resolveDisplayName(
    username: username,
    guildNickname: member?.nick,
    friendNickname: friendNickname,
    fallbackDisplayName: fallbackDisplayName,
    globalName: user?.globalName,
  );
}

Future<Map<String, String>> resolveMessageUserMentionNames({
  required db.FluxerDatabase database,
  required String? guildId,
  required String content,
}) async {
  final Map<String, String> names = <String, String>{};
  for (final RegExpMatch match in MessageContentPatterns.userMention.allMatches(
    content,
  )) {
    final String userId = match.group(1)!;
    if (names.containsKey(userId)) {
      continue;
    }
    names[userId] = await resolveMessageUserDisplayName(
      database: database,
      userId: userId,
      guildId: guildId,
    );
  }
  return names;
}

Future<Map<String, String>> resolveMessageChannelMentionNames({
  required db.FluxerDatabase database,
  required String content,
}) async {
  final Map<String, String> names = <String, String>{};
  for (final RegExpMatch match
      in MessageContentPatterns.channelMention.allMatches(content)) {
    final String channelId = match.group(1)!;
    if (names.containsKey(channelId)) {
      continue;
    }
    final db.Channel? channel = await database.channelDao.getChannelById(
      channelId,
    );
    final String name = channel?.name.trim() ?? '';
    if (name.isNotEmpty) {
      names[channelId] = name;
    }
  }
  return names;
}

Future<Map<String, String>> resolveMessageRoleMentionNames({
  required db.FluxerDatabase database,
  required String? guildId,
  required String content,
}) async {
  final Map<String, String> names = <String, String>{};
  if (guildId == null || guildId.isEmpty) {
    return names;
  }
  for (final RegExpMatch match in MessageContentPatterns.roleMention.allMatches(
    content,
  )) {
    final String roleId = match.group(1)!;
    if (names.containsKey(roleId)) {
      continue;
    }
    final db.Role? role = await database.roleDao.getRoleById(roleId);
    final String name = role?.name.trim() ?? '';
    if (name.isNotEmpty) {
      names[roleId] = name;
    }
  }
  return names;
}
