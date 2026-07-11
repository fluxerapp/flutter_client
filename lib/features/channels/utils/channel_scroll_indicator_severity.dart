import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel_unread_state.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';

GuildScrollIndicatorSeverity? channelScrollIndicatorSeverity({
  required WidgetRef ref,
  required String guildId,
  required String channelId,
}) {
  final UnreadState? unread = ref.read(channelUnreadProvider(channelId)).value;
  if (unread == null) {
    return null;
  }
  final bool isChannelDirectlyMuted =
      ref.read(mutedChannelIdsProvider(guildId)).value?.contains(channelId) ??
      false;
  final bool showFadedUnread = ref.read(
    appearancePreferencesProvider.select(
      (AppearancePreferencesState state) =>
          state.showFadedUnreadOnMutedChannels,
    ),
  );
  final ChannelUnreadState channelUnreadState = getChannelUnreadState(
    unreadCount: unread.hasUnreadMessages ? 1 : 0,
    mentionCount: unread.mentionCount,
    isMuted: isChannelDirectlyMuted,
    showFadedUnreadOnMutedChannels: showFadedUnread,
    unreadBadgesLevel: unread.unreadBadgesLevel,
  );
  if (channelUnreadState.hasMentions) {
    return GuildScrollIndicatorSeverity.mention;
  }
  if (channelUnreadState.shouldShowUnreadIndicator) {
    return GuildScrollIndicatorSeverity.unread;
  }
  return null;
}
