import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_back_button_unread_count.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_back_button_unread_provider.g.dart';

@riverpod
int chatBackButtonUnreadCount(Ref ref, String currentChannelId) {
  final int guildMentions = ref.watch(
    guildReadStateProvider.select(
      (Map<String, GuildReadStateEntry> states) => countMentionsOutsideChannel(
        mentionCountByChannel: states.values.expand(
          (GuildReadStateEntry entry) => entry.mentionCountByChannel.entries,
        ),
        currentChannelId: currentChannelId,
      ),
    ),
  );
  final int dmMentions = ref.watch(
    unreadDmChannelsProvider.select(
      (UnreadDmState state) => countMentionsOutsideChannel(
        mentionCountByChannel: state.channels.map(
          (dm) => MapEntry<String, int>(dm.id, dm.unreadCount),
        ),
        currentChannelId: currentChannelId,
      ),
    ),
  );
  return guildMentions + dmMentions;
}
