import 'package:dio/dio.dart';

enum UnaddableRecipientReason {
  unknownUser,
  blocked,
  notFriends,
  groupDmAddDisabled,
}

class UnaddableRecipient {
  const UnaddableRecipient({required this.userId, required this.reason});

  final String userId;
  final UnaddableRecipientReason reason;
}

class UnaddableRecipientsError implements Exception {
  const UnaddableRecipientsError({
    required this.unaddableRecipients,
    required this.addableRecipients,
  });

  final List<UnaddableRecipient> unaddableRecipients;
  final List<String> addableRecipients;
}

const String kGroupDmRecipientsNotAddableCode =
    'GROUP_DM_RECIPIENTS_NOT_ADDABLE';

UnaddableRecipientsError? parseUnaddableRecipientsError(Object error) {
  if (error is! DioException) {
    return null;
  }
  final Object? data = error.response?.data;
  if (data is! Map<String, dynamic>) {
    return null;
  }
  if (data['code'] != kGroupDmRecipientsNotAddableCode) {
    return null;
  }
  final List<UnaddableRecipient> unaddable = <UnaddableRecipient>[];
  final Object? rawUnaddable = data['unaddable_recipients'];
  if (rawUnaddable is List<dynamic>) {
    for (final Object? entry in rawUnaddable) {
      if (entry is! Map<String, dynamic>) {
        continue;
      }
      final String? userId = entry['user_id']?.toString();
      if (userId == null || userId.isEmpty) {
        continue;
      }
      unaddable.add(
        UnaddableRecipient(
          userId: userId,
          reason: _mapUnaddableReason(entry['reason']?.toString()),
        ),
      );
    }
  }
  final List<String> addable = <String>[];
  final Object? rawAddable = data['addable_recipients'];
  if (rawAddable is List<dynamic>) {
    for (final Object? id in rawAddable) {
      final String value = id?.toString() ?? '';
      if (value.isNotEmpty) {
        addable.add(value);
      }
    }
  }
  return UnaddableRecipientsError(
    unaddableRecipients: unaddable,
    addableRecipients: addable,
  );
}

UnaddableRecipientReason _mapUnaddableReason(String? reason) {
  return switch (reason) {
    'blocked' => UnaddableRecipientReason.blocked,
    'not_friends' => UnaddableRecipientReason.notFriends,
    'group_dm_add_disabled' => UnaddableRecipientReason.groupDmAddDisabled,
    'unknown_user' => UnaddableRecipientReason.unknownUser,
    _ => UnaddableRecipientReason.unknownUser,
  };
}
