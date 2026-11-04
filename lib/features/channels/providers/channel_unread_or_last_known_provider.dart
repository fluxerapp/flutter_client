import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/providers/guild_channel_unread_snapshot_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_unread_or_last_known_provider.g.dart';

@riverpod
UnreadState? channelUnreadOrLastKnown(Ref ref, String channelId) {
  final UnreadState? fromStream = ref
      .watch(channelUnreadProvider(channelId))
      .value;
  if (fromStream != null) {
    return fromStream;
  }

  final UnreadState? fromSnapshot = ref.watch(
    guildChannelUnreadSnapshotProvider.select(
      (Map<String, UnreadState> snapshot) => snapshot[channelId],
    ),
  );
  if (fromSnapshot != null) {
    return fromSnapshot;
  }

  if (ref.watch(guildReadStateReadyProvider)) {
    final int aggregateMention = ref.watch(
      guildReadStateProvider.select(
        (Map<String, GuildReadStateEntry> guildStates) =>
            _guildMentionCountForChannel(guildStates, channelId),
      ),
    );
    if (aggregateMention > 0) {
      return UnreadState(hasUnread: true, mentionCount: aggregateMention);
    }
  }

  return ref.watch(channelUnreadLastKnownProvider)[channelId];
}

int _guildMentionCountForChannel(
  Map<String, GuildReadStateEntry> guildStates,
  String channelId,
) {
  for (final GuildReadStateEntry entry in guildStates.values) {
    final int? count = entry.mentionCountByChannel[channelId];
    if (count != null) {
      return count;
    }
  }
  return 0;
}
