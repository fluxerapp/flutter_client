import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';

List<String> parseDmChannelRecipientIds(String json) {
  try {
    final List<dynamic> raw = jsonDecode(json) as List<dynamic>;
    return raw
        .map((dynamic e) => e.toString())
        .where((String s) => s.isNotEmpty)
        .toList();
  } on Object {
    return <String>[];
  }
}

List<String> buildDmRemoteRecipientIds(
  List<String> parsedRecipientIds,
  String primaryRecipientId,
) {
  final Set<String> combined = <String>{
    ...parsedRecipientIds,
    primaryRecipientId,
  };
  final List<String> out = combined.toList()..sort();
  return out;
}

List<GroupMemberInfo> buildDmGroupMembers(
  List<String> recipientIds,
  Map<String, db.User> userMap,
) {
  return recipientIds.map((String id) {
    final db.User? user = userMap[id];
    return GroupMemberInfo(
      id: id,
      avatar: user?.avatar,
      name: user?.globalName ?? user?.username ?? '',
    );
  }).toList();
}

Future<DmConversation> buildDmConversationFromChannelRow(
  db.FluxerDatabase database,
  db.DmChannel row,
) async {
  final List<String> recipientIds = parseDmChannelRecipientIds(
    row.recipientIds,
  );
  final bool isGroup = isDmGroupType(row.type);
  final Set<String> allRecipientIds = <String>{
    ...recipientIds,
    row.recipientId,
  };
  final List<db.User> users = await database.userDao.getUsersByIds(
    allRecipientIds.toList(),
  );
  final Map<String, db.User> userMap = <String, db.User>{
    for (final db.User user in users) user.id: user,
  };
  return DmConversation.fromRow(
    row,
    userMap[row.recipientId],
    groupMembers: isGroup
        ? buildDmGroupMembers(recipientIds, userMap)
        : const <GroupMemberInfo>[],
    channelNicks: isGroup ? parseDmChannelNicksJson(row.nicksJson) : const {},
    remoteRecipientIds: buildDmRemoteRecipientIds(
      recipientIds,
      row.recipientId,
    ),
  );
}
