import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_channel_unread_snapshot_provider.g.dart';

@Riverpod(keepAlive: true)
class GuildChannelUnreadFold extends _$GuildChannelUnreadFold {
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
Map<String, UnreadState> guildChannelUnreadSnapshot(Ref ref, String guildId) {
  final List<ChannelCategory> categories = ref.watch(
    channelListViewModelProvider.select(
      (ChannelListState state) => state.guild?.id == guildId
          ? state.categories
          : const <ChannelCategory>[],
    ),
  );
  final Map<String, UnreadState> fold = ref.watch(
    guildChannelUnreadFoldProvider,
  );
  final Map<String, UnreadState> snapshot = <String, UnreadState>{
    for (final ChannelCategory category in categories)
      for (final Channel channel in category.channels)
        channel.id:
            fold[channel.id] ??
            ref.watch(channelUnreadOrLastKnownProvider(channel.id)) ??
            const UnreadState(),
  };
  return Map<String, UnreadState>.unmodifiable(snapshot);
}

@riverpod
bool guildChannelUnreadKnown(Ref ref, String guildId) {
  final List<ChannelCategory> categories = ref.watch(
    channelListViewModelProvider.select(
      (ChannelListState state) => state.guild?.id == guildId
          ? state.categories
          : const <ChannelCategory>[],
    ),
  );
  final Map<String, UnreadState> fold = ref.watch(
    guildChannelUnreadFoldProvider,
  );
  for (final ChannelCategory category in categories) {
    for (final Channel channel in category.channels) {
      if (!tracksGuildChannelUnreadFold(channel.type.wireValue)) {
        continue;
      }
      if (fold.containsKey(channel.id)) {
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
