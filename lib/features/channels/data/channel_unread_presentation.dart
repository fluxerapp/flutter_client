import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show
        isThreadChannelType,
        isThreadOnlyChannelType,
        tracksGuildChannelUnreadSnapshot;
import 'package:fluxer_app/features/channels/domain/channel_unread_state.dart';
import 'package:fluxer_app/features/channels/domain/unread_state.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart'
    show forumNewPostsUnreadEnabled;
import 'package:fluxer_app/features/guilds/domain/guild_read_state_contribution.dart';
import 'package:fluxer_app/features/guilds/utils/guild_notification_resolution.dart';
import 'package:fluxer_dart/export.dart';

class ChannelGuildUnreadPresentation {
  const ChannelGuildUnreadPresentation({
    required this.unreadEligible,
    required this.hasPlainUnread,
    required this.hasUnreadMessages,
    required this.guildMentionCount,
    required this.snapshotUnread,
  });

  final bool unreadEligible;
  final bool hasPlainUnread;
  final bool hasUnreadMessages;
  final int guildMentionCount;
  final UnreadState snapshotUnread;
}

ChannelGuildUnreadPresentation computeChannelGuildUnreadPresentation({
  required Channel channel,
  required ReadState? readState,
  required UserGuildSettingsResponse? guildSettings,
  required GuildNotificationContext? guildContext,
  required DateTime now,
  required int fallbackAckMs,
  required String? strictLatestMessageId,
  required bool channelLastMessageExistsInCache,
  required bool threadJoined,
  required bool threadMuted,
}) {
  final int rawMentions = readState?.mentionCount ?? 0;
  final String? latestMessageId = resolveLatestMessageIdForUnread(
    strictLatestMessageId: strictLatestMessageId,
    channelLastMessageId: channel.lastMessageId,
    ackLastMessageId: readState?.lastMessageId,
    mentionCount: rawMentions,
    channelLastMessageExistsInCache: channelLastMessageExistsInCache,
  );
  final bool isThread = isThreadChannelType(channel.type);
  final bool isMutedForUnread =
      isGuildOrCategoryOrChannelMuted(
        channel: channel,
        guildSettings: guildSettings,
        now: now,
      ) ||
      (isThread && threadMuted);
  final bool unreadTracked =
      (!isThread || (threadJoined && !isMutedForUnread)) &&
      (!isThreadOnlyChannelType(channel.type) ||
          forumNewPostsUnreadEnabled(
            guildSettings?.channelOverrides?[channel.id]?.flags,
          ));
  final bool hasUnreadMessage =
      unreadTracked &&
      hasUnreadByReadState(
        channelLastMessageId: latestMessageId,
        ackLastMessageId: readState?.lastMessageId,
        fallbackAckMs: fallbackAckMs,
        mentionCount: 0,
        isGuildChannel: true,
      );
  final bool tracksType = tracksGuildChannelUnreadSnapshot(channel.type);
  final GuildReadStateContribution contribution =
      resolveGuildReadStateContribution(
        isEligibleTextChannel: tracksType,
        isPrivate: false,
        unreadBadgesLevel: isMutedForUnread
            ? UserNotificationSettings.noMessages
            : resolveGuildUnreadBadgesLevel(
                channel: channel,
                guildSettings: guildSettings,
                guildContext: guildContext,
              ),
        isMutedForUnread: isMutedForUnread,
        hasUnread: hasUnreadMessage,
        mentionCount: rawMentions,
      );
  final bool unreadEligible = contribution.unreadAllowed;
  final bool hasPlainUnread = contribution.unreadAllowed && rawMentions == 0;
  final bool filteredUnreadMessages =
      contribution.unreadAllowed && hasUnreadMessage;
  final int guildMentionCount = contribution.mentionAllowed ? rawMentions : 0;
  final bool rawUnreadMessages = tracksType && hasUnreadMessage;
  final int trackedRawMentions = tracksType ? rawMentions : 0;
  final bool hasUnreadPinsForChannel = hasUnreadPins(
    channelLastPinTimestamp: channel.lastPinTimestamp,
    ackLastPinTimestamp: readState?.lastPinTimestamp,
  );

  final UnreadState snapshotUnread = _snapshotUnreadState(
    channel: channel,
    guildSettings: guildSettings,
    guildContext: guildContext,
    now: now,
    isThread: isThread,
    isMutedForUnread: isMutedForUnread,
    rawMentions: trackedRawMentions,
    rawUnreadMessages: rawUnreadMessages,
    unreadEligible: unreadEligible,
    filteredUnreadMessages: filteredUnreadMessages,
    guildMentionCount: guildMentionCount,
    hasUnreadPinsForChannel: hasUnreadPinsForChannel,
  );

  return ChannelGuildUnreadPresentation(
    unreadEligible: unreadEligible,
    hasPlainUnread: hasPlainUnread,
    hasUnreadMessages: filteredUnreadMessages,
    guildMentionCount: guildMentionCount,
    snapshotUnread: snapshotUnread,
  );
}

UnreadState _snapshotUnreadState({
  required Channel channel,
  required UserGuildSettingsResponse? guildSettings,
  required GuildNotificationContext? guildContext,
  required DateTime now,
  required bool isThread,
  required bool isMutedForUnread,
  required int rawMentions,
  required bool rawUnreadMessages,
  required bool unreadEligible,
  required bool filteredUnreadMessages,
  required int guildMentionCount,
  required bool hasUnreadPinsForChannel,
}) {
  if (isThread) {
    final UserNotificationSettings? unreadBadgesLevel = isMutedForUnread
        ? UserNotificationSettings.noMessages
        : resolveGuildUnreadBadgesLevel(
            channel: channel,
            guildSettings: guildSettings,
            guildContext: guildContext,
          );
    return UnreadState(
      hasUnread: unreadEligible || guildMentionCount > 0,
      hasUnreadMessages: filteredUnreadMessages,
      mentionCount: guildMentionCount,
      hasUnreadPins: hasUnreadPinsForChannel,
      unreadBadgesLevel: unreadBadgesLevel,
    );
  }

  final bool channelDirectlyMuted = isChannelDirectlyMuted(
    channel: channel,
    guildSettings: guildSettings,
    now: now,
  );
  final UserNotificationSettings? tileBadgesLevel = resolveUnreadBadgesLevel(
    channel: channel,
    guildSettings: guildSettings,
  );
  final ChannelUnreadState tileState = getChannelUnreadState(
    unreadCount: rawUnreadMessages ? 1 : 0,
    mentionCount: rawMentions,
    isMuted: channelDirectlyMuted,
    showFadedUnreadOnMutedChannels: true,
    unreadBadgesLevel: tileBadgesLevel,
  );
  final int snapshotMentionCount = tileState.hasMentions ? rawMentions : 0;
  final bool snapshotHasUnreadMessages = tileState.shouldShowUnreadIndicator;
  return UnreadState(
    hasUnread: tileState.hasVisibleUnread,
    hasUnreadMessages: snapshotHasUnreadMessages && rawUnreadMessages,
    mentionCount: snapshotMentionCount,
    hasUnreadPins: hasUnreadPinsForChannel,
    unreadBadgesLevel: tileBadgesLevel,
  );
}
