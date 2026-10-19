import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_channel_unread_snapshot_provider.g.dart';

@Riverpod(keepAlive: true)
class GuildChannelUnreadSnapshot extends _$GuildChannelUnreadSnapshot {
  @override
  Map<String, UnreadState> build() {
    ref.watch(currentUserIdProvider);
    return <String, UnreadState>{};
  }

  void apply(Map<String, UnreadState> patch) {
    if (patch.isEmpty) {
      return;
    }
    state = <String, UnreadState>{...state, ...patch};
  }

  void replace(Map<String, UnreadState> next) {
    state = Map<String, UnreadState>.of(next);
  }
}

@riverpod
Map<String, UnreadState> guildListedChannelUnreadSnapshot(
  Ref ref,
  String guildId,
) {
  final List<ChannelCategory> categories = ref.watch(
    channelListViewModelProvider.select(
      (ChannelListState state) => state.guild?.id == guildId
          ? state.categories
          : const <ChannelCategory>[],
    ),
  );
  final Map<String, UnreadState> snapshot = ref.watch(
    guildChannelUnreadSnapshotProvider,
  );
  final Map<String, UnreadState> listed = <String, UnreadState>{
    for (final ChannelCategory category in categories)
      for (final Channel channel in category.channels)
        channel.id:
            snapshot[channel.id] ??
            ref.watch(channelUnreadOrLastKnownProvider(channel.id)) ??
            const UnreadState(),
  };
  return Map<String, UnreadState>.unmodifiable(listed);
}

@riverpod
bool guildListedChannelUnreadReady(Ref ref, String guildId) {
  final List<ChannelCategory> categories = ref.watch(
    channelListViewModelProvider.select(
      (ChannelListState state) => state.guild?.id == guildId
          ? state.categories
          : const <ChannelCategory>[],
    ),
  );
  final Map<String, UnreadState> snapshot = ref.watch(
    guildChannelUnreadSnapshotProvider,
  );
  for (final ChannelCategory category in categories) {
    for (final Channel channel in category.channels) {
      if (!tracksGuildChannelUnreadSnapshot(channel.type.wireValue)) {
        continue;
      }
      if (snapshot.containsKey(channel.id)) {
        continue;
      }
      final bool known = ref.watch(
        channelUnreadOrLastKnownProvider(
          channel.id,
        ).select((UnreadState? unread) => unread != null),
      );
      if (!known) {
        return false;
      }
    }
  }
  return true;
}
