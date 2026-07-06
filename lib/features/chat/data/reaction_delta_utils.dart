import 'dart:convert';

import 'package:fluxer_dart/gateway.dart';

List<Map<String, dynamic>> decodeMessageReactionsJson(String json) {
  try {
    return (jsonDecode(json) as List<dynamic>).cast<Map<String, dynamic>>();
  } on Object {
    return <Map<String, dynamic>>[];
  }
}

bool applyMessageReactionDelta(
  List<Map<String, dynamic>> reactions,
  ReactionEmoji emoji, {
  required bool isAdd,
  required bool isCurrentUser,
}) {
  final int idx = reactions.indexWhere(
    (Map<String, dynamic> reaction) =>
        (reaction['emoji'] as String?) == emoji.name &&
        (reaction['emojiId'] as String?) == emoji.id,
  );
  if (isAdd) {
    if (idx != -1) {
      final Map<String, dynamic> existing = reactions[idx];
      if (isCurrentUser && (existing['hasReacted'] as bool? ?? false)) {
        return false;
      }
      existing['count'] = ((existing['count'] as int?) ?? 0) + 1;
      if (isCurrentUser) {
        existing['hasReacted'] = true;
      }
    } else {
      reactions.add(<String, dynamic>{
        'emoji': emoji.name,
        'emojiId': emoji.id,
        'animated': emoji.animated,
        'count': 1,
        'hasReacted': isCurrentUser,
      });
    }
  } else if (idx != -1) {
    final Map<String, dynamic> existing = reactions[idx];
    if (isCurrentUser && !(existing['hasReacted'] as bool? ?? false)) {
      return false;
    }
    final int count = ((existing['count'] as int?) ?? 1) - 1;
    if (count <= 0) {
      reactions.removeAt(idx);
    } else {
      existing['count'] = count;
      if (isCurrentUser) {
        existing['hasReacted'] = false;
      }
    }
  }
  return true;
}
