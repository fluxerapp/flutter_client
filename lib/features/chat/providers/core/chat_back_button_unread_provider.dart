import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_back_button_unread_count.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_back_button_unread_provider.g.dart';

@riverpod
int chatBackButtonUnreadCount(Ref ref, String currentChannelId) {
  final int totalGuildMentionCount = ref.watch(
    guildReadStateProvider.select(
      (Map<String, GuildReadStateEntry> states) => sumGuildMentionCounts({
        for (final MapEntry<String, GuildReadStateEntry> entry
            in states.entries)
          entry.key: entry.value.mentionCount,
      }),
    ),
  );
  final bool isGuildChannel =
      ref.watch(channelByIdProvider(currentChannelId)).value != null;
  final int currentGuildChannelMentionCount = isGuildChannel
      ? ref.watch(
          channelUnreadProvider(currentChannelId).select(
            (AsyncValue<UnreadState> asyncUnread) =>
                asyncUnread.value?.mentionCount ?? 0,
          ),
        )
      : 0;
  final int otherDmUnreadCount = ref.watch(
    unreadDmChannelsProvider.select(
      (UnreadDmState state) => computeOtherDmUnreadCount(
        dmChannels: state.channels.map(
          (dm) => ChatBackButtonDmUnreadSnapshot(
            channelId: dm.id,
            mentionCount: dm.unreadCount,
            hasUnread: state.hasUnread(dm.id),
          ),
        ),
        currentChannelId: currentChannelId,
      ),
    ),
  );
  return computeChatBackButtonUnreadCount(
    totalGuildMentionCount: totalGuildMentionCount,
    currentGuildChannelMentionCount: currentGuildChannelMentionCount,
    otherDmUnreadCount: otherDmUnreadCount,
  );
}
