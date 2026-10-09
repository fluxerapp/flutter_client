import 'package:fluxer_dart/export.dart';

class GuildReadStateContribution {
  const GuildReadStateContribution({
    required this.mentionAllowed,
    required this.unreadAllowed,
  });

  final bool mentionAllowed;
  final bool unreadAllowed;
}

enum _GuildReadContributionRoute {
  ineligible,
  privateChannel,
  noMessages,
  onlyMentions,
  allMessages,
  legacyMuted,
  legacyUnmuted,
}

_GuildReadContributionRoute _routeGuildReadContribution({
  required bool isEligibleTextChannel,
  required bool isPrivate,
  required UserNotificationSettings? unreadBadgesLevel,
  required bool isMutedForUnread,
}) {
  if (!isPrivate && !isEligibleTextChannel) {
    return _GuildReadContributionRoute.ineligible;
  }
  if (isPrivate) {
    return _GuildReadContributionRoute.privateChannel;
  }
  if (unreadBadgesLevel == UserNotificationSettings.noMessages) {
    return _GuildReadContributionRoute.noMessages;
  }
  if (unreadBadgesLevel == UserNotificationSettings.onlyMentions) {
    return _GuildReadContributionRoute.onlyMentions;
  }
  if (unreadBadgesLevel == UserNotificationSettings.allMessages) {
    return _GuildReadContributionRoute.allMessages;
  }
  if (isMutedForUnread) {
    return _GuildReadContributionRoute.legacyMuted;
  }
  return _GuildReadContributionRoute.legacyUnmuted;
}

bool _isMentionAllowed({
  required _GuildReadContributionRoute route,
  required int mentionCount,
}) {
  if (mentionCount <= 0) {
    return false;
  }
  return route != _GuildReadContributionRoute.ineligible;
}

bool _isUnreadAllowed({
  required _GuildReadContributionRoute route,
  required bool hasUnread,
}) {
  if (!hasUnread) {
    return false;
  }
  switch (route) {
    case _GuildReadContributionRoute.privateChannel:
    case _GuildReadContributionRoute.allMessages:
    case _GuildReadContributionRoute.legacyUnmuted:
      return true;
    case _GuildReadContributionRoute.ineligible:
    case _GuildReadContributionRoute.noMessages:
    case _GuildReadContributionRoute.onlyMentions:
    case _GuildReadContributionRoute.legacyMuted:
      return false;
  }
}

GuildReadStateContribution resolveGuildReadStateContribution({
  required bool isEligibleTextChannel,
  required bool isPrivate,
  required UserNotificationSettings? unreadBadgesLevel,
  required bool isMutedForUnread,
  required bool hasUnread,
  required int mentionCount,
}) {
  final route = _routeGuildReadContribution(
    isEligibleTextChannel: isEligibleTextChannel,
    isPrivate: isPrivate,
    unreadBadgesLevel: unreadBadgesLevel,
    isMutedForUnread: isMutedForUnread,
  );
  return GuildReadStateContribution(
    mentionAllowed: _isMentionAllowed(route: route, mentionCount: mentionCount),
    unreadAllowed: _isUnreadAllowed(route: route, hasUnread: hasUnread),
  );
}
