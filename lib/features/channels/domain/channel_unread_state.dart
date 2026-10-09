import 'package:fluxer_dart/export.dart';

class ChannelUnreadState {
  const ChannelUnreadState({
    required this.hasMentions,
    required this.isHighlight,
    required this.shouldShowUnreadIndicator,
    required this.isUnreadIndicatorMuted,
    required this.hasVisibleUnread,
  });

  final bool hasMentions;
  final bool isHighlight;
  final bool shouldShowUnreadIndicator;
  final bool isUnreadIndicatorMuted;
  final bool hasVisibleUnread;
}

ChannelUnreadState getChannelUnreadState({
  required int unreadCount,
  required int mentionCount,
  required bool isMuted,
  required bool showFadedUnreadOnMutedChannels,
  UserNotificationSettings? unreadBadgesLevel,
}) {
  final bool hasUnreadMessages = unreadCount > 0;
  final bool rawHasMentions = mentionCount > 0;
  if (unreadBadgesLevel == UserNotificationSettings.noMessages) {
    return const ChannelUnreadState(
      hasMentions: false,
      isHighlight: false,
      shouldShowUnreadIndicator: false,
      isUnreadIndicatorMuted: false,
      hasVisibleUnread: false,
    );
  }
  if (unreadBadgesLevel == UserNotificationSettings.onlyMentions) {
    return ChannelUnreadState(
      hasMentions: rawHasMentions,
      isHighlight: rawHasMentions,
      shouldShowUnreadIndicator: hasUnreadMessages,
      isUnreadIndicatorMuted: hasUnreadMessages,
      hasVisibleUnread: rawHasMentions || hasUnreadMessages,
    );
  }
  if (unreadBadgesLevel == UserNotificationSettings.allMessages) {
    return ChannelUnreadState(
      hasMentions: rawHasMentions,
      isHighlight: rawHasMentions || hasUnreadMessages,
      shouldShowUnreadIndicator: hasUnreadMessages,
      isUnreadIndicatorMuted: false,
      hasVisibleUnread: rawHasMentions || hasUnreadMessages,
    );
  }
  final bool shouldShowUnreadIndicator =
      hasUnreadMessages && (!isMuted || showFadedUnreadOnMutedChannels);
  return ChannelUnreadState(
    hasMentions: rawHasMentions,
    isHighlight: rawHasMentions || (hasUnreadMessages && !isMuted),
    shouldShowUnreadIndicator: shouldShowUnreadIndicator,
    isUnreadIndicatorMuted: shouldShowUnreadIndicator && isMuted,
    hasVisibleUnread: rawHasMentions || shouldShowUnreadIndicator,
  );
}
