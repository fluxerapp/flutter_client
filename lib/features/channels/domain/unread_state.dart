import 'package:flutter/foundation.dart';
import 'package:fluxer_dart/export.dart';

@immutable
class UnreadState {
  final bool hasUnread;
  final bool hasUnreadMessages;
  final int mentionCount;
  final bool hasUnreadPins;
  final UserNotificationSettings? unreadBadgesLevel;

  const UnreadState({
    this.hasUnread = false,
    this.hasUnreadMessages = false,
    this.mentionCount = 0,
    this.hasUnreadPins = false,
    this.unreadBadgesLevel,
  });

  @override
  bool operator ==(Object other) =>
      other is UnreadState &&
      other.hasUnread == hasUnread &&
      other.hasUnreadMessages == hasUnreadMessages &&
      other.mentionCount == mentionCount &&
      other.hasUnreadPins == hasUnreadPins &&
      other.unreadBadgesLevel == unreadBadgesLevel;

  @override
  int get hashCode => Object.hash(
    hasUnread,
    hasUnreadMessages,
    mentionCount,
    hasUnreadPins,
    unreadBadgesLevel,
  );
}
