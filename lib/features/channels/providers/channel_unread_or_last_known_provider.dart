import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/features/channels/providers/guild_channel_unread_snapshot_provider.dart';
import 'package:fluxer_app/features/channels/providers/read_state_write_batcher_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_unread_or_last_known_provider.g.dart';

@riverpod
UnreadState? channelUnreadOrLastKnown(Ref ref, String channelId) {
  ref.watch(readStateOverlayVersionProvider);
  final ReadStateWriteBatcher batcher = ref.read(readStateWriteBatcherProvider);
  final UnreadState? fromStream = ref
      .watch(channelUnreadProvider(channelId))
      .value;

  if (batcher.hasOverlay(channelId) && fromStream != null) {
    return fromStream;
  }

  if (fromStream != null) {
    return fromStream;
  }

  final UnreadState? fromSnapshot = ref.watch(
    guildChannelUnreadSnapshotProvider,
  )[channelId];
  if (fromSnapshot != null) {
    return fromSnapshot;
  }

  if (ref.watch(guildReadStateReadyProvider)) {
    final int aggregateMention = _guildMentionCountForChannel(
      ref.watch(guildReadStateProvider),
      channelId,
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
