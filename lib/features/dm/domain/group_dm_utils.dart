import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';

String canonicalizeRecipientIds(Iterable<String> recipientIds) {
  final List<String> sorted =
      recipientIds
          .map((String id) => id.trim())
          .where((String id) => id.isNotEmpty)
          .toSet()
          .toList()
        ..sort();
  return jsonEncode(sorted);
}

List<String> parseDmRecipientIds(String json) {
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

List<String> recipientIdsForDuplicateMatch(db.DmChannel row) {
  final List<String> parsed = parseDmRecipientIds(row.recipientIds);
  if (parsed.isNotEmpty) {
    return parsed;
  }
  if (row.recipientId.isNotEmpty) {
    return <String>[row.recipientId];
  }
  return const <String>[];
}

bool isDuplicateGroupDmRow({
  required db.DmChannel row,
  required String canonicalKey,
  String? excludeChannelId,
}) {
  if (!isDmGroupType(row.type)) {
    return false;
  }
  if (excludeChannelId != null && row.id == excludeChannelId) {
    return false;
  }
  final List<String> remoteIds = recipientIdsForDuplicateMatch(row);
  if (remoteIds.isEmpty) {
    return false;
  }
  return canonicalizeRecipientIds(remoteIds) == canonicalKey;
}

int getMaxGroupDmOtherRecipients(int maxGroupDmRecipients) {
  return (maxGroupDmRecipients - 1).clamp(0, maxGroupDmRecipients);
}

bool isGroupDmFull({
  required int memberCount,
  required int maxGroupDmRecipients,
}) {
  return memberCount >= maxGroupDmRecipients;
}
