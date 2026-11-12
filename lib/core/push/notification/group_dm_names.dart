import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/utils/group_dm_display_name.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Map<String, String> resolvePushGroupDmNames(
  List<DmConversation> conversations, {
  required FluxerLocalizations l10n,
  required String currentUserId,
}) {
  return <String, String>{
    for (final DmConversation conversation in conversations)
      if (conversation.isGroup)
        conversation.id: resolveGroupDmDisplayName(
          dm: conversation,
          l10n: l10n,
          currentUserId: currentUserId,
        ),
  };
}

typedef PushGroupDmNamesWriter =
    Future<void> Function(String userId, Map<String, String> names);

class PushGroupDmNamesMirror {
  PushGroupDmNamesMirror(this._write);

  final PushGroupDmNamesWriter _write;
  String? _userId;
  Map<String, String>? _names;

  void sync({
    required String? userId,
    required List<DmConversation> conversations,
    required FluxerLocalizations l10n,
  }) {
    if (userId == null || userId.isEmpty) {
      return;
    }
    final Map<String, String> next = resolvePushGroupDmNames(
      conversations,
      l10n: l10n,
      currentUserId: userId,
    );
    if (userId == _userId && mapEquals(next, _names)) {
      return;
    }
    _userId = userId;
    _names = next;
    unawaited(_write(userId, next));
  }
}
